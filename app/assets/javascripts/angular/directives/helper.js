var parseDirective = function (dir){
	var dir = dir.split("|")
	var result = []
	dir.forEach(function (attr){
		result.push($.trim(attr))
	})
	return result
}