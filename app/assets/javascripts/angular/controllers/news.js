angular_module
	.controller('newsIndexCtrl', ['$scope', '$http', 'filterFilter',
		function ($scope, $http, filterFilter) {
			$http.get('api/news').success(function(data) {
				$scope.updateItems = function(query){
					$scope.news = filterFilter(data, query)
					$scope.totalItems = $scope.news.length
				}
				$scope.updateItems()
			})
		}
	])
	.controller('newsShowCtrl', ['$scope', '$http', "$routeParams",
		function ($scope, $http, $routeParams) {
			var path = "api/news/" + $routeParams.id
			$http.get(path).success(function(data) {
				$scope.news = data
				$scope.htmlContent = data.content
			})
		}
	])