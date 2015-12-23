function patientsController($scope, $http, $filter) {
    $scope.pageToGet = 0;
    
    $scope.state = 'busy';

    $scope.lastAction = '';

    $scope.url = "/bioestetika/protected/patients/";       
    
    $scope.errorOnSubmit = false;
    $scope.errorIllegalAccess = false;
    $scope.displayMessageToUser = false;
    $scope.displayValidationError = false;
    $scope.displaySearchMessage = false;
    $scope.displaySearchButton = true;
    $scope.displayCreatePatientButton = false;
    $scope.patient = {}

    $scope.searchFor = ""

    $scope.getPatientList = function () {
        var url = $scope.url;
        $scope.lastAction = 'list';

        $scope.startDialogAjaxRequest();

        var config = {params: {page: $scope.pageToGet}};
        
        $http.get(url, config)
            .success(function (data) {            	
                $scope.finishAjaxCallOnSuccess(data, null, false);
            })
            .error(function () {
                $scope.state = 'error';
                $scope.displayCreatePatientButton = false;                
            });
    }
    
    $scope.populateTable = function (data) {
        if (data.pagesCount > 0) {
            $scope.state = 'list';

            $scope.page = {source: data.patients, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalPatients : data.totalPatients};

            if($scope.page.pagesCount <= $scope.page.currentPage){
                $scope.pageToGet = $scope.page.pagesCount - 1;
                $scope.page.currentPage = $scope.page.pagesCount - 1;
            }

            $scope.displayCreatePatientButton = true;
            $scope.displaySearchButton = true;
        } else {
            $scope.state = 'noresult';
            $scope.displayCreatePatientButton = true;

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

        if($scope.searchFor){
            $scope.searchPatient($scope.searchFor, true);
        } else{
            $scope.getPatientList();
        }
    };

    $scope.exit = function (modalId) {
        $(modalId).modal('hide');

        $scope.patient = {};
        $scope.errorOnSubmit = false;
        $scope.errorIllegalAccess = false;
        $scope.displayValidationError = false;
    }

    $scope.finishAjaxCallOnSuccess = function (data, modalId, isPagination) {
    	$("#loadingModal").modal('hide');
    	$scope.populateTable(data);        
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

    $scope.resetPatient = function(){
        $scope.patient = {};
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

    $scope.selectedPatient = function (patient) {
    	var selectedPatient = angular.copy(patient);
    	
    	//format date of birth
    	var dateObj = new Date(selectedPatient.dob);
    	selectedPatient.dob = $filter('date')(dateObj,'dd/MM/yyyy');
    	
        $scope.patient = selectedPatient;
    }
    
    $scope.addPatientSession = function (patient)
    {
    	$scope.lastAction = 'addPatientSession';
    	
    	var url = $scope.url + $scope.lastAction
    	
    	$http.put(url, patient)
    	
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

    $scope.deletePatient = function () {
        $scope.lastAction = 'delete';

        var url = $scope.url + $scope.patient.id;

        $scope.startDialogAjaxRequest();

        var params = {searchFor: $scope.searchFor, page: $scope.pageToGet};

        $http({
            method: 'DELETE',
            url: url,
            params: params
        }).success(function (data) {
                $scope.resetPatient();
                $scope.finishAjaxCallOnSuccess(data, "#deletePatientsModal", false);
            }).error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.resetSearch = function(){
        $scope.searchFor = "";
        $scope.pageToGet = 0;
        $scope.getPatientList();
        $scope.displaySearchMessage = false;
    }

    //$scope.getPatientList();
}
