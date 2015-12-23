function LocationController($scope, $location) {
    if($location.$$absUrl.lastIndexOf('/patients') > 0){
        $scope.activeURL = 'patients';
    }
    else if ($location.$$absUrl.lastIndexOf('/admissions') > 0){
    	$scope.activeURL = 'admissions';
    }
    else{
        $scope.activeURL = 'home';
    }
}