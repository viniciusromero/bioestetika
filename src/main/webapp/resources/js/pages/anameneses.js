function anamenesesController($scope, $http, $filter) {
    $scope.pageToGet = 0;

    $scope.state = 'busy';
    $scope.statedetails = '';
    $scope.navactive = 'general';
    
    $scope.lastAction = '';

    $scope.url = "/bioestetika/protected/anameneses/";
    
    $scope.errorOnSubmit = false;
    $scope.errorIllegalAccess = false;
    $scope.displayMessageToUser = false;
    $scope.displayValidationError = false;
    $scope.displaySearchMessage = false;
    $scope.displaySearchButton = true;
    $scope.displayCreateanameneseButton = false;
    
    $scope.anamenese = {};
    
    $scope.changeNavBar = function (activenavbar) {
    	$scope.navactive = activenavbar;    	
    }
    
    $scope.getAdmissionSession = function () {
        $scope.lastAction = 'list';               
        
        $http.get($scope.url)
            .success(function (data) {            	
            	$scope.admission = data;            	
            	if ($scope.admission.id > 0) {
            		$scope.getAnameneseList();
            	}
            	else {
            		$scope.state = 'nosession';
            	}
            })
            .error(function () {
                $scope.state = 'error';
                $scope.displayCreateAnameneseButton = false;
            });
    }
    
    $scope.getAnameneseList = function () {
        if (!($scope.admission.id)) {            
            return;
        }
        
    	var url = $scope.url + 'admission/' + $scope.admission.id;
        $scope.lastAction = 'list';               
        
        $scope.startDialogAjaxRequest();
        
        var config = {params: {page: $scope.pageToGet}};        
        $http.get(url, config)
            .success(function (data) {            	
                $scope.finishAjaxCallOnSuccess(data, null, false);
            })
            .error(function () {
                $scope.state = 'error';
                $scope.displayCreateAnameneseButton = false;
            });
    }
    
    $scope.populateTable = function (data) {
        if (data.pagesCount > 0) {
            $scope.state = 'list';

            $scope.page = {source: data.anameneses, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalAnameneses : data.totalAnameneses};

            if($scope.page.pagesCount <= $scope.page.currentPage){
                $scope.pageToGet = $scope.page.pagesCount - 1;
                $scope.page.currentPage = $scope.page.pagesCount - 1;
            }

            $scope.displayCreateAnameneseButton = true;
            $scope.displaySearchButton = true;
        } else {
            $scope.state = 'noresult';
            $scope.displayCreateAnameneseButton = true;

            if(!$scope.searchFor){
                $scope.displaySearchButton = false;
            }
        }

        if (data.actionMessage || data.searchMessage) {
            $scope.displayMessageToUser = $scope.lastAction != 'search';

            $scope.page.actionMessage = data.actionMessage;
            $scope.page.searchMessage = data.searchMessage;
        } else {
            $scope.displayMessageToUser = false;
        }
    }

    $scope.changePage = function (page) {
        $scope.pageToGet = page;

        $scope.getAnameneseList();        
    };

    $scope.exit = function (modalId) {
        $(modalId).modal('hide');

        $scope.anamenese = {};
        $scope.errorOnSubmit = false;
        $scope.errorIllegalAccess = false;
        $scope.displayValidationError = false;
    }

    $scope.finishAjaxCallOnSuccess = function (data, modalId, isPagination) {
        $scope.populateTable(data);
        $("#loadingModal").modal('hide');

        if(!isPagination){
            if(modalId){
                $scope.exit(modalId);
            }
        }

        $scope.lastAction = '';
    }

    $scope.startDialogAjaxRequest = function () {
        $scope.displayValidationError = false;
        $("#loadingModal").modal('show');
        $scope.previousState = $scope.state;
        $scope.state = 'busy';
    }

    $scope.handleErrorInDialogs = function (status) {
        $("#loadingModal").modal('hide');
        $scope.state = $scope.previousState;

        // illegal access
        if(status == 403){
            $scope.errorIllegalAccess = true;
            return;
        }

        $scope.errorOnSubmit = true;
        $scope.lastAction = '';
    }

    $scope.addSearchParametersIfNeeded = function(config, isPagination) {
        if(!config.params){
            config.params = {};
        }

        config.params.page = $scope.pageToGet;

    }

    $scope.resetAnamenese = function(){
    	$scope.navactive = 'general';
        $scope.anamenese = {};        
        $scope.anamenese.admission = $scope.admission;                
    };

    $scope.selectedAnamenese = function (anamenese) {    
    	$scope.navactive = 'general';
    	$scope.anamenese = angular.copy(anamenese);    	
    }
    
    $scope.createAnamenese = function (newAnameneseForm) {
        if (!newAnameneseForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }
        
        $scope.lastAction = 'create';

        var url = $scope.url;

        var config = {};
        
        $scope.addSearchParametersIfNeeded(config, false);
        $scope.configAnameneseCreatePost();
        
        $scope.startDialogAjaxRequest();
               
        $http.post(url, $scope.anamenese, config)
            .success(function (data) {
            	
                $scope.finishAjaxCallOnSuccess(data, "#addAnamenesesModal", false);
            })
            .error(function(data, status, headers, config) {
            	$scope.handleErrorInDialogs(status);
            });
    };

    $scope.updateAnamenese = function (updateAnameneseForm) {
        if (!updateAnameneseForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }
        $scope.lastAction = 'update';
        
        var url = $scope.url + $scope.anamenese.id;

        var config = {};
        $scope.addSearchParametersIfNeeded(config, false);
        
        $scope.configAnameneseUpdatePost();
        
        $scope.startDialogAjaxRequest();
        
        $http.put(url, $scope.anamenese, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#updateAnamenesesModal", false);
            })
            .error(function(data, status, headers, config) { 
            	$scope.configAnameneseForm();
            	$scope.handleErrorInDialogs(status);           
            });
    };

    $scope.configAnameneseCreatePost = function()
    {
    	$scope.anamenese.createdate = parseDateTo('h');
    	$scope.anamenese.createtime = parseTimeTo('a');
    	$scope.configAnameneseUpdatePost();
    }
    
    $scope.configAnameneseUpdatePost = function()
    {
    	$scope.anamenese.updatedate = parseDateTo('h');
    	$scope.anamenese.updatetime = parseTimeTo('a');
    }
    
    $scope.getAdmissionSession();
}
