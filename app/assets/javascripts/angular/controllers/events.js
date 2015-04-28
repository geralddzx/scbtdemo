angular_module
	.controller('eventsIndexCtrl', ['$scope', '$http',
		function ($scope, $http) {
			$http.get('api/events').success(function(data) {
				if ($scope.displayFilter){
					data = data.filter(function(event){
						if (event.display){	return true	}
					})
				}
				$scope.events = data
			})
		}
	])
	.controller('eventsShowCtrl', ['$scope', '$http', "$routeParams",
		function ($scope, $http, $routeParams) {
			var path = "api/events/" + $routeParams.id
			$http.get(path).success(function(data) {
				$scope.event = data
				$scope.htmlContent = data.content
			})
		}
	])