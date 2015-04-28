angular_module
	.controller('inquiriesIndexCtrl', ['$scope', '$http',
		function ($scope, $http) {
			$scope.bootstrapClass = function(inquiry){
				if (inquiry.read){
					return "success"
				} else {
					return "warning"
				}
			}
			$http.get('api/inquiries').success(function(data) {
				$scope.inquiries = data
			})
		}
	])