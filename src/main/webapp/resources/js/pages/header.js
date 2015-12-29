function LocationController($scope, $location) {
    if($location.$$absUrl.lastIndexOf('/patients') > 0){
        $scope.activeURL = 'patients';
    }
    else if ($location.$$absUrl.lastIndexOf('/admissions') > 0){
    	$scope.activeURL = 'admissions';
    }
    else if ($location.$$absUrl.lastIndexOf('/anameneses') > 0){
    	$scope.activeURL = 'anameneses';
    }    
    else{
        $scope.activeURL = 'home';
    }
}