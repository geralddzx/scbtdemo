angular_module
    .directive('ngBackImg', function(){
        return function (scope, element, attrs){
            var path = "images/" + attrs["ngBackImg"]
            element.css({
                'background-image': 'url(' + path +')',
                'background-size' : 'cover'
            })
        }
    })
    .directive('ngShowHide', function(){
        return function(scope, element, attrs){
            var target = $("#" + attrs["ngShowHide"])
            element.click(function(){
                if(target.css("display") == "hidden")
                    elementtarget.css("display", "initial")
                else {
                    target.css("display", "hidden")
                }
            })
        }
    })
    .directive('ngLink', function(){
        return function(scope, element, attrs){
            var path = attrs["ngLink"]
            element.click(function(){
                window.location = path
            })
            element.hover(function(){
                $(this).css('cursor','pointer');
            })
        }
    })
    .directive('scbtSubmit', ["$http", function ($http){
        return function (scope, element, attrs){
            element.submit(function(){
                var params = element.serializeJSON()
                var instructions = parseDirective(attrs["scbtSubmit"])
                var method = instructions[0]
                var path = instructions[1]
                var redirect = instructions[2]
                $http({method: method, url: path, data: params})
                    .success(function(data, status, headers, config) {
                        if (redirect){
                            window.location = "#" + redirect
                        } else {
                            window.history.back()
                        }
                        alert(data.message)
                    })
            })
        }
    }])
    .directive('scbtRemove', ["$http", "$route", function ($http, $route){
        return function (scope, element, attrs){
            element.click(function(){
                var instructions = parseDirective(attrs["scbtRemove"])
                var path = instructions[0]
                var warning = instructions[1]
                if (!warning || confirm(warning)){
                    $http.delete(path)
                        .success(function(data, status, headers, config) {
                            $route.reload()
                            alert(data.message)
                        })
                }
            })
        }
    }])
    .directive('scbtPut', ["$http", "$route", function ($http, $route){
        return function (scope, element, attrs){
            element.click(function(){
                var instructions = parseDirective(attrs["scbtPut"])
                var path = instructions[0]
                var params = instructions[1]
                $http.put(path + "?" + params)
                    .success(function(data, status, headers, config) {
                        $route.reload()
                        alert(data.message)
                    })
            })
        }
    }])