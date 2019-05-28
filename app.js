// app.js
var routerApp = angular.module('routerApp', ['ui.router']);

routerApp.config(function ($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/');

    $stateProvider

        // HOME STATES AND NESTED VIEWS ========================================
        .state('home', {
            url: '/home/:jwttoken',
            templateUrl: 'templates/home.html',
            controller: 'adminCtrl'
            ,resolve: {
                token: ['$stateParams', 
                    function ($stateParams) { return $stateParams.jwttoken; }]
            }
        })

        .state('productos', {
            url: '/productos',
            templateUrl: 'templates/productos.html',
            controller: 'adminCtrl'
            ,resolve: {
                token: ['$stateParams', 
                    function ($stateParams) { return $stateParams.jwttoken; }]
            }
        })

});

routerApp.factory('User',function($http,$q){
  
   
    
    function _checkAuthentication(){
        $http({
            url: 'app_client.php?token=',
            method: "GET",
            params: { token: token }
        }).then(function (response) {
            var data = response.data;
            console.log(data.userID);
            if (typeof(data.userID) === 'undefined') { console.log("exitos");
            throw new Error('NOT_AUTHENTICATED'); }
        })
            .catch(function (response) {
                console.error('error', response.status, response.data);
                throw new Error('NOT_AUTHENTICATED');
            })
            .finally(function () {
                console.error("finally");
                return $q.when(response.data.userId);
        
            })
            ;
        
        
    }
    
    
    return {
      checkAuthentication : _checkAuthentication }
    
  })
  
  routerApp.run(function($rootScope,$state){
  
  
    $rootScope.$on('$stateChangeError',function(ev,toState,toParams,fromState,fromParams,err){
      
      if(err.message === 'NOT_AUTHENTICATED'){
        console.log('not authenticated, sending to login')
        $location.path( "/login" )
          }
      
    })
    
    
  })  

routerApp.controller('adminCtrl', ['$scope', '$location', '$http', 'token', function ($scope, $location, $http, token) {
    console.log("adminCtrl");
    console.log(token);

    var jwturl = 'app_client.php?token=' + token;
    console.log(jwturl);
    $http({
        url: 'app_client.php?token=',
        method: "GET",
        params: { token: token }
    }).then(function (response) {
        var data = response.data;
        console.log(data);
        if (typeof(data.userId) !== 'undefined') { console.log("exitos"); }
    })
        .catch(function (response) {
            console.error('error', response.status, response.data);
        })
        .finally(function () {
            
        });
    
}]);
