// Creating angular module and injecting dependency
var grievancesystem = angular.module('grievancesystem',['ngRoute',
														'ui.grid',
														'ui.grid.autoResize',
														'ui.grid.cellNav',
														'ui.bootstrap',
														'ui.grid.pagination',
														'ngCookies']);

angular.module('grievancesystem').constant('API_URL','http://127.0.0.1:8000/');
/*
var grievancesystem = angular.module('grievancesystem',['ngRoute',
														'ui.grid',
														'ui.grid.edit',
														'ui.grid.cellNav',
														'ui.grid.autoResize',
														'ui.bootstrap',
														'ui.grid.pagination']);
*/

grievancesystem.config(function ($routeProvider) {
	
	$routeProvider.when('/',{
		templateUrl:'/views/templates/login.php',
		controller:'appController'
	})
	.when('/aicte',{
		templateUrl:'/views/templates/aicteTemplate.php',
		controller:'aicteController'
	})
	.when('/ombudsman',{
		templateUrl:'partials/ombudsmanDashboard.html',
		controller:'ombudsmanController'
	})
	.when('/principal',{
		templateUrl:'partials/principalDashboard.html',
		controller:'principalController'
	})
	.when('/committee',{
		templateUrl:'partials/committeeDashboard.html',
		controller:'committeeController'
	})
	.when('/student',{
		templateUrl:'/views/templates/studentTemplate.php',
		controller:'studentController'
	})	
	.otherwise({
		redirectTo:'/'
	})
})

