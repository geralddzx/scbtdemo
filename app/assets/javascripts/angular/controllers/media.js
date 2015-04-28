angular_module
	.controller('mediaIndexCtrl', ['$scope', '$http', '$route',
		function ($scope, $http, $route) {
			$http.get('api/media').success(function(data) {
				$scope.media = data
				
			})

			// $scope.bootstrapClass = function(medium){
			// 	if (medium.slider){
			// 		return "success"
			// 	} else {
			// 		return ""
			// 	}
			// }
			$scope.pickFiles = function(){
				filepicker.pickMultiple({
					services: ['COMPUTER'],		
					container: 'window',
				}, function (blob){
					var media = blob.map(function(blobObj){
						return {
							filename: blobObj.filename,
							url: blobObj.url,
							mimetype: blobObj.mimetype,
							size: blobObj.size,
						}
					})
					$http.post("api/media", {media: media})
						.success(function (data, status, headers, config){
	                        alert(data.message)
	                        $route.reload()
	                    })
				})
			}
			$scope.removeFile = function(medium){
				filepicker.remove({url: medium.url}, function(){}, function (fpError){
					// alert(fpError)
				})
			}
		}
	])