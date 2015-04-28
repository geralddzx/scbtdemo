angular_module
	.controller('usersIndexCtrl', ['$scope', '$http',
		function ($scope, $http) {
			$http.get('api/users').success(function(data) {
				$scope.users = data
			})
			$scope.bootstrapClass = {
				master: "info",
				admin: "warning",
				student: "",
			}
		}
	])
	.controller('usersShowCtrl', ['$scope', '$http', "$routeParams",
		function ($scope, $http, $routeParams) {
			var path = "api/users/" + $routeParams.id
			$http.get(path).success(function(data) {
				$scope.user = data
				$scope.userReferral = data.referral
			})
		}
	])