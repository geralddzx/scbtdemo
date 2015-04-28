angular_module
    .filter('pageFilter', function (){
        return function (data, currentPage, itemsPerPage){
			data = data || []
            currentPage = currentPage || 1
            itemsPerPage = itemsPerPage || data.length
            var startIndex = itemsPerPage * (currentPage - 1)
            return data.slice(startIndex, startIndex + itemsPerPage)
        }
    })
    .filter('trustedHtml', ['$sce', function($sce){
		return function(html) {
			return $sce.trustAsHtml(html)
		}
	}])