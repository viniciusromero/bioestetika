function admissionsController($scope, $http) {
    $scope.pageToGet = 0;

    $scope.state = 'busy';
    $scope.statedetails = '';
    
    $scope.lastAction = '';

    $scope.url = "/bioestetika/protected/admissions/";
    
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
        
    	var url = $scope.url + '/' + $scope.patient.id;
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

        $scope.getPatientList();        
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

        if($scope.searchFor){
            config.params.searchFor = $scope.searchFor;
        }
    }

    $scope.resetAdmission = function(){
        $scope.admission = {};
    };

    $scope.listAnameneses = function(admission){
    	if ($scope.statedetails == ''){
    		
    		
    		$scope.statedetails = 'list';
    	}
    	else{
    		$scope.statedetails = '';
    	}
    };
    
    $scope.createPatient = function (newPatientForm) {
        if (!newPatientForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'create';

        var url = $scope.url;

        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $scope.addSearchParametersIfNeeded(config, false);

        $scope.startDialogAjaxRequest();

        $http.post(url, $.param($scope.patient), config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#addPatientsModal", false);
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.selectedAdmission = function (admission) {
    	var selectedAdmission = angular.copy(admission);
        $scope.admission = selectedAdmission;
    }
    
    $scope.updatePatient = function (updatePatientForm) {
        if (!updatePatientForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'update';

        var url = $scope.url + $scope.patient.id;

        $scope.startDialogAjaxRequest();

        var config = {}

        $scope.addSearchParametersIfNeeded(config, false);

        $http.put(url, $scope.patient, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#updatePatientsModal", false);
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.searchPatient = function (searchPatientForm, isPagination) {
        if (!($scope.searchFor) && (!searchPatientForm.$valid)) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'search';

        var url = $scope.url + 'nome/'+ $scope.searchFor;
        $scope.startDialogAjaxRequest();

        var config = {};

        if($scope.searchFor){
            $scope.addSearchParametersIfNeeded(config, isPagination);
        }

        $http.get(url, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#searchPatientsModal", isPagination);
                $scope.displaySearchMessage = true;
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };
    
    $scope.getPatientSession();
}
