// app.js
var routerApp = angular.module('routerApp', ['ui.router']);

routerApp.config(function ($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/home/');

    $stateProvider

        // HOME STATES AND NESTED VIEWS ========================================
        .state('home', {
            url: '/home/:jwttoken',
            templateUrl: 'templates/home.html',
            controller: 'adminCtrl'
            , resolve: {
                user: ['User', '$stateParams', function (User, $stateParams) {
                    return User.checkAuthentication($stateParams.jwttoken);
                }]
                ,
                token: ['$stateParams',
                    function ($stateParams) { return $stateParams.jwttoken; }]
            }
        })

        .state('productos', {
            url: '/productos/:jwttoken',
            templateUrl: 'templates/productos.html',
            controller: 'adminCtrl'

            , resolve: {
                user: ['User', '$stateParams', function (User, $stateParams) {
                    return User.checkAuthentication($stateParams.jwttoken);
                }]
                ,
                token: ['$stateParams',
                    function ($stateParams) { return $stateParams.jwttoken; }]
            }

        })

        .state('login', {
            url: '/login',
            templateUrl: 'templates/login.html'
        })

});

routerApp.factory('User', function ($http, $q, $state) {



    function _checkAuthentication(token) {
        console.log("checking authentication with token: " + token);
        $http({
            url: 'app_client.php?token=',
            method: "GET",
            params: { token: token }
        }).then(function (response) {
            var data = response.data;
            console.log(data);
            if (typeof (data.userId) === 'undefined') {
                console.log("no identificado, mando al login");
                $state.go('login');
            }
            else { return $q.when(response.data.userId); }

        })
            .catch(function (response) {
                console.error('error', response.status, response.data);
                $state.go('login');
            });
    }
    return {
        checkAuthentication: _checkAuthentication
    }

})

routerApp.controller('adminCtrl', ['$scope', '$location', '$http', 'token', function ($scope, $location, $http, token) {
    console.log("adminCtrl");


    $scope.params.token = token;
    console.log($scope.params.token);
    var jwturl = 'LE HAGO UNA PEGADA A: app_client.php?token=' + token;
    console.log(jwturl);
    $http({
        url: 'app_client.php?token=',
        method: "GET",
        params: { token: token }
    }).then(function (response) {
        var data = response.data;
        console.log(data);
        if (typeof (data.userId) !== 'undefined') { console.log("exitos"); }
    })
        .catch(function (response) {
            console.error('error', response.status, response.data);
        })
        .finally(function () {

        });

}]);

routerApp.controller('mainCtrl', ['$scope', '$location', '$http', function ($scope, $location, $http) {
    console.log("mainCtrl");
    $scope.params = {};
}]);
