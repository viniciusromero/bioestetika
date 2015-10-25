function LocationController($scope, $location) {
    if($location.$$absUrl.lastIndexOf('/patients') > 0){
        $scope.activeURL = 'patients';
    } else{
        $scope.activeURL = 'home';
    }
}