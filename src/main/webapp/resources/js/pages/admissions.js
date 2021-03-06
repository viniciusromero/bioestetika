function admissionsController($scope, $http, $filter) {
    $scope.pageToGet = 0;

    $scope.state = 'busy';
    $scope.statedetails = '';
    
    $scope.lastAction = '';

    $scope.url = "/bioestetika/protected/admissions/";
    $scope.urlanamenese = "/bioestetika/protected/anameneses/";
    
    $scope.errorOnSubmit = false;
    $scope.errorIllegalAccess = false;
    $scope.displayMessageToUser = false;
    $scope.displayValidationError = false;
    $scope.displaySearchMessage = false;
    $scope.displaySearchButton = true;
    $scope.displayCreateAdmissionButton = false;
    
    $scope.admission = {};
    
    $scope.getPatientSession = function () {
        $scope.lastAction = 'list';               
        
        $http.get($scope.url)
            .success(function (data) {            	
            	$scope.patient = data;            	
            	if ($scope.patient.id > 0) {
            		$scope.getAdmissionList();
            	}
            	else {
            		$scope.state = 'nosession';
            	}
            })
            .error(function () {
                $scope.state = 'error';
                $scope.displayCreateAdmissionButton = false;
            });
    }
    
    $scope.getAdmissionList = function () {
        if (!($scope.patient.id)) {            
            return;
        }
        
    	var url = $scope.url + 'patient/' + $scope.patient.id;
        $scope.lastAction = 'list';               
        
        $scope.startDialogAjaxRequest();
        
        var config = {params: {page: $scope.pageToGet}};        
        $http.get(url, config)
            .success(function (data) {            	
                $scope.finishAjaxCallOnSuccess(data, null, false);
            })
            .error(function () {
                $scope.state = 'error';
                $scope.displayCreateAdmissionButton = false;
            });
    }
    
    $scope.populateTable = function (data) {
        if (data.pagesCount > 0) {
            $scope.state = 'list';

            $scope.page = {source: data.admissions, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalAdmissions : data.totalAdmissions};

            if($scope.page.pagesCount <= $scope.page.currentPage){
                $scope.pageToGet = $scope.page.pagesCount - 1;
                $scope.page.currentPage = $scope.page.pagesCount - 1;
            }

            $scope.displayCreateAdmissionButton = true;
            $scope.displaySearchButton = true;
        } else {
            $scope.state = 'noresult';
            $scope.displayCreateAdmissionButton = true;

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

        $scope.getAdmissionList();        
    };

    $scope.exit = function (modalId) {
        $(modalId).modal('hide');

        $scope.admission = {};
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

    $scope.resetAdmission = function(){
        $scope.admission = {};        
        $scope.admission.patient = $scope.patient;
    };

    $scope.selectedAdmission = function (admission) {    	
    	$scope.admission = angular.copy(admission);
    	$scope.configAdmissionForm();
    }
    
    $scope.addAdmissionSession = function (admission)
    {    	
    	$scope.lastAction = 'addAdmissionSession';
    	var url = $scope.url + $scope.lastAction
     	$http.post(url, admission);
    	$scope.stateLn = 'selected';
    }
    
    $scope.createAdmission = function (newAdmissionForm) {
        if (!newAdmissionForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }
        
        $scope.lastAction = 'create';

        var url = $scope.url;

        var config = {};
        
        $scope.addSearchParametersIfNeeded(config, false);
        $scope.configAdmissionPost();
        
        $scope.startDialogAjaxRequest();
               
        $http.post(url, $scope.admission, config)
            .success(function (data) {
            	
                $scope.finishAjaxCallOnSuccess(data, "#addAdmissionsModal", false);
            })
            .error(function(data, status, headers, config) {
            	$scope.configAdmissionForm();
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.updateAdmission = function (updateAdmissionForm) {
        if (!updateAdmissionForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }
        $scope.lastAction = 'update';
        
        var url = $scope.url + $scope.admission.id;

        var config = {};
        $scope.addSearchParametersIfNeeded(config, false);
        
        $scope.configAdmissionPost();
        
        $scope.startDialogAjaxRequest();
        
        $http.put(url, $scope.admission, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#updateAdmissionsModal", false);
            })
            .error(function(data, status, headers, config) { 
            	$scope.configAdmissionForm();
            	$scope.handleErrorInDialogs(status);           
            });
    };

    $scope.configAdmissionPost = function()
    {
    	$scope.admission.admdate = parseDateTo($scope.admission.admdate);
    	$scope.admission.admtime = parseTimeTo($scope.admission.admtime);
    	$scope.admission.dischgdate = parseDateTo($scope.admission.dischgdate);
    	$scope.admission.dischgtime = parseTimeTo($scope.admission.dischgtime);
    }
    
    $scope.configAdmissionForm = function()
    {    	
    	$scope.admission.admdate = parseDateFrom($scope.admission.admdate);
    	$scope.admission.dischgdate = parseDateFrom($scope.admission.dischgdate);    	
    	$scope.admission.admtime = parseTimeFrom($scope.admission.admtime);    	
    	$scope.admission.dischgtime = parseTimeFrom($scope.admission.dischgtime);
    }
    
    $scope.getPatientSession();
}
