// app.js
var routerApp = angular.module('routerApp', ['ui.router', 'ngMaterial', 'ngMessages']);

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

        .state('rubros', {
            url: '/rubros/:jwttoken',
            templateUrl: 'templates/rubro.html',
            controller: 'rubroCtrl'

            , resolve: {
                user: ['User', '$stateParams', function (User, $stateParams) {
                    return User.checkAuthentication($stateParams.jwttoken);
                }]
                ,
                rubros: ['apiService', '$stateParams', function (apiService, $stateParams) {
                    return apiService.getRubros($stateParams.jwttoken);
                }]
                ,
                productos: ['apiService', '$stateParams', function (apiService, $stateParams) {
                    return apiService.getProductos($stateParams.jwttoken);
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

routerApp.factory('apiService', function ($http, $q, $state) {

    // var apiUrl = "/jwt/api/";
    var apiUrl = "/jwt2/api/";


    // API DE RUBROS

    function _getRubros(token) {
        console.log("getting rubros with token: " + token);
        return $http({
            url: apiUrl + "categorias.php",
            method: "GET",
            params: { token: token }
        });
    }

    function _deleteRubro(token, id) {
        console.log("deleting rubro with id: " + id + "and token: " + token);
        return $http({
            url: apiUrl + "categorias.php",
            method: "DELETE",
            params: { token: token, id: id }
        });
    }

    function _postRubro(token, rubro) {
        console.log("posting rubro token: " + token);
        return $http.post(apiUrl + "categorias.php",
            {
                token: token,
                id: rubro.id,
                nombre: rubro.nombre,
                descripcion: rubro.descripcion
            }
        );
    }


    // API DE PRODUCTOS

    function _getProductos(token) {
        console.log("getting productos with token: " + token);
        return $http({
            url: apiUrl + "products.php",
            method: "GET",
            params: { token: token }
        });
    }

    function _deleteProducto(token, id) {
        console.log("deletting producto with id: " + id);
        return $http({
            url: apiUrl + "products.php",
            method: "DELETE",
            params: { token: token, id: id}
        });
    }




    return {
        // RUBROS
        getRubros: _getRubros,
        deleteRubro: _deleteRubro,
        postRubro: _postRubro,

        // PRODUCTOS
        getProductos:_getProductos,
        deleteProducto: _deleteProducto

    }

})

routerApp.controller('adminCtrl', ['$scope', '$location', '$http', 'token', function ($scope, $location, $http, token) {

    console.log("adminCtrl");

    $scope.params.token = token;
    // console.log($scope.params.token);
    // var jwturl = 'LE HAGO UNA PEGADA A: app_client.php?token=' + token;
    // console.log(jwturl);
    // $http({
    //     url: 'app_client.php?token=',
    //     method: "GET",
    //     params: { token: token }
    // }).then(function (response) {
    //     var data = response.data;
    //     console.log(data);
    //     if (typeof (data.userId) !== 'undefined') { console.log("exitos"); }
    // })
    //     .catch(function (response) {
    //         console.error('error', response.status, response.data);
    //     })
    //     .finally(function () {

    //     });

}]);

routerApp.controller('mainCtrl', ['$scope', '$location', '$http', '$sce', function ($scope, $location, $http, $sce) {
    console.log("mainCtrl");
    $scope.params = {};

    function removeAccents(value) {
        return value
            .replace(/á/g, 'a')
            .replace(/é/g, 'e')
            .replace(/í/g, 'i')
            .replace(/ó/g, 'o')
            .replace(/ú/g, 'u')
            .replace(/Á/g, 'A')
            .replace(/É/g, 'E')
            .replace(/Í/g, 'I')
            .replace(/Ó/g, 'O')
            .replace(/Ú/g, 'U')
            .replace(/ñ/g, 'n')
            .replace(/Ñ/g, 'N');

    }

    $scope.ignoreAccentsProducto = function (item) {
        if (!$scope.query)
            return true;

        var fullItem = item.producto + ' ' + item.rubro + ' ' + item.marca + ' ' + item.nivel;
        var text = removeAccents(fullItem.toLowerCase());
        var search = removeAccents($scope.query.toLowerCase());
        var searchTextSplit = search.split(' ');

        for (var y = 0; y < searchTextSplit.length; y++) {
            if (text.indexOf(searchTextSplit[y]) == -1) {
                return false;
            }
        }
        return true;
    };

    $scope.ignoreAccentsRubro = function (item) {
        if (!$scope.query)
            return true;

        var fullItem = item.title;
        var text = removeAccents(fullItem.toLowerCase());
        var search = removeAccents($scope.query.toLowerCase());
        var searchTextSplit = search.split(' ');
        var count = 0;
        for (var y = 0; y < searchTextSplit.length; y++) {
            if (text.indexOf(searchTextSplit[y]) !== -1) {
                count++;
            }
        }
        if (count == searchTextSplit.length)
            return true;
        else
            return false;
    };

    $scope.renderHtml = function (html_code) {
        return $sce.trustAsHtml(html_code);
    };

}]);

routerApp.controller('rubroCtrl', ['$scope', '$location', '$http', 'apiService', 'token', 'rubros', 'productos', '$sce', '$mdDialog', function ($scope, $location, $http, apiService, token, rubros, productos, $sce, $mdDialog) {
    console.log("rubroCtrl");
    $scope.params.token = token;
    console.log(token);
    $scope.rubros = rubros.data;
    $scope.productos = productos.data;
    console.log($scope.rubros);
    console.log($scope.productos);

    function removeAccents(value) {
        return value
            .replace(/á/g, 'a')
            .replace(/é/g, 'e')
            .replace(/í/g, 'i')
            .replace(/ó/g, 'o')
            .replace(/ú/g, 'u')
            .replace(/Á/g, 'A')
            .replace(/É/g, 'E')
            .replace(/Í/g, 'I')
            .replace(/Ó/g, 'O')
            .replace(/Ú/g, 'U')
            .replace(/ñ/g, 'n')
            .replace(/Ñ/g, 'N');
    }

    $scope.ignoreAccentsRubro = function (item) {
        if (!$scope.query)
            return true;

        var fullItem = item.nombre;
        var text = removeAccents(fullItem.toLowerCase());
        var search = removeAccents($scope.query.toLowerCase());
        var searchTextSplit = search.split(' ');
        var count = 0;
        for (var y = 0; y < searchTextSplit.length; y++) {
            if (text.indexOf(searchTextSplit[y]) !== -1) {
                count++;
            }
        }
        if (count == searchTextSplit.length)
            return true;
        else
            return false;
    };

    $scope.prodctoEnRubro = function (productoRubroId, rubroId) {
        return (productoRubroId == rubroId);
    };

    $scope.renderHtml = function (html_code) {
        return $sce.trustAsHtml(html_code);
    };

    $scope.showConfirmDeleteRubro = function (ev, rubro) {
        // Appending dialog to document.body to cover sidenav in docs app
        var confirm = $mdDialog.confirm()
            .title('Seguro que quiere eliminar el rubro "' + rubro.nombre + '" ?')
            .ariaLabel('Lucky day')
            .targetEvent(ev)
            .ok('Eliminar')
            .cancel('cancelar');
        $mdDialog.show(confirm).then(function () {
            apiService.deleteRubro($scope.params.token, rubro.id);
            setTimeout(function () {
                $scope.$apply(function () {
                    var response = apiService.getRubros($scope.params.token);
                    response.success(function(data, status, headers, config) {
                        $scope.rubros=data;
                        console.log($scope.rubros);
                    });
                    response.error(function(data, status, headers, config) {
                        alert("ERROR");
                    });
                });
            }, 1000);
        }, function () {
            alert("no eliinar");
        });
    };

    $scope.showConfirmDeleteProducto = function (ev, producto) {
        // Appending dialog to document.body to cover sidenav in docs app
        var confirm = $mdDialog.confirm()
            .title('Seguro que quiere eliminar el rubro "' + producto.nombre + '" ?')
            .ariaLabel('Lucky day')
            .targetEvent(ev)
            .ok('Eliminar')
            .cancel('cancelar');
        $mdDialog.show(confirm).then(function () {
            apiService.deleteProducto($scope.params.token, producto.id);
            setTimeout(function () {
                $scope.$apply(function () {
                    var response = apiService.getProductos($scope.params.token);
                    response.success(function(data, status, headers, config) {
                        $scope.productos=data;
                        console.log($scope.productos);
                        console.log(response);

                    });
                    response.error(function(data, status, headers, config) {
                        alert("ERROR");
                    });
                });
            }, 1000);
        }, function () {
            alert("no eliinar");
        });
    };
}]);