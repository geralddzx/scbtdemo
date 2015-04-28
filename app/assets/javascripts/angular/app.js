var angular_module = angular.module("angular", [
	"ngRoute",
	"ngAnimate",
	"templates",
	'ui.bootstrap',
	'textAngular',
])
	.run(["$rootScope", "$http", function($rootScope, $http) {
		var variables = window.scbt
		Object.keys(scbtVars).forEach(function(key){
			$rootScope[key] = window.scbtVars[key]
		})
		$rootScope.http = $http
	}])
	.config(["$httpProvider", function($httpProvider){
		$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
		$httpProvider.interceptors.push('httpInterceptor')
	}])
	.config(["$provide", function($provide){
		$provide.decorator('taOptions', ['taRegisterTool', '$delegate', '$http', function(taRegisterTool, taOptions, $http){
			taRegisterTool('uploadImage', {
				buttontext: 'Upload File',
				action: function(deferred, restoreSelection){
					var editor = this.$editor()
					filepicker.pick({
						services: ['COMPUTER'],
						container: 'window',
					}, function (blob){
						$http.post("api/media", {
							medium: {
								filename: blob.filename,
								url: blob.url,
								mimetype: blob.mimetype,
								size: blob.size,
							}
						})
						.success(function (data, status, headers, config){
	                        alert(data.message)
	                        if (blob.mimetype.match("image")){
	                        	editor.wrapSelection("insertImage", blob.url, true)
	                        } else {
	                        	var element = document.createElement("a")
	                        	element.innerHTML = blob.filename
	                        	element.href = blob.url
	                        	editor.wrapSelection("insertHTML", element.outerHTML, true)
	                        }
	                        deferred.resolve()
	                        restoreSelection()
	                    })
	                    .error(function (){
	                    	deferred.resolve()
	                        restoreSelection()
	                    })
					}, function (blob){
						deferred.resolve()
	                    restoreSelection()
					});
					return false
				}
			})
			taOptions.toolbar = [
            	['h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'p', 'pre', 'quote'],
				['bold', 'italics', 'underline', 'strikeThrough', 'ul', 'ol', 'redo', 'undo', 'clear'],
				['justifyLeft', 'justifyCenter', 'justifyRight', 'indent', 'outdent'],
				['uploadImage', 'insertImage','insertLink', 'insertVideo', 'wordcount', 'charcount'],
        	]
			return taOptions
		}])
	}])
	.config(["$routeProvider", 
		function($routeProvider){
			$routeProvider.
			when("/news", {
				templateUrl: 'news/index.html',
				controller: 'newsIndexCtrl'
			}).
			when("/news/new", {
				templateUrl: 'news/new.html',
			}).
			when("/news/:id/edit", {
				templateUrl: 'news/edit.html',
				controller: 'newsShowCtrl'
			}).
			when("/news/:id", {
				templateUrl: 'news/show.html',
				controller: 'newsShowCtrl'
			}).
			when("/events", {
				templateUrl: 'events/index.html',
				controller: 'eventsIndexCtrl'
			}).
			when("/events/new", {
				templateUrl: 'events/new.html',
			}).
			when("/events/:id/edit", {
				templateUrl: 'events/edit.html',
				controller: 'eventsShowCtrl'
			}).
			when("/events/:id", {
				templateUrl: 'events/show.html',
				controller: 'eventsShowCtrl'
			})
		}
	])


var scbt = angular.module("scbt", ["angular"])
	.config(["$routeProvider", 
		function($routeProvider){
			$routeProvider.
			when("/inquiries/new", {
				templateUrl: 'inquiries/new.html',
			}).
			when("/about-us", {
				templateUrl: 'home/about-us/about-us.html',
			}).
			when("/about-us/why-stanford", {
				templateUrl: 'home/about-us/why-stanford.html',
			}).
			when("/about-us/canadore-at-stanford", {
				templateUrl: 'home/about-us/canadore-at-stanford.html',
			}).
			when("/admissions", {
				templateUrl: 'home/admissions/admissions.html',
			}).
			when("/admissions/requirements", {
				templateUrl: 'home/admissions/requirements.html',
			}).
			when("/student-services", {
				templateUrl: 'home/student-services/student-services.html',
			}).
			when("/contact-us", {
				templateUrl: 'home/contact-us/contact-us.html',
			}).
			otherwise({
				templateUrl: 'home/home.html'
			})
		}
	])

var scbtAdmin = angular.module("scbt-admin", [
	"angular",
])
	.config(["$routeProvider", 
		function($routeProvider){
			$routeProvider.
			when("/users", {
				templateUrl: 'admin/users/index.html',
				controller: "usersIndexCtrl",
			}).
			when("/users/new", {
				templateUrl: 'admin/users/new.html',
			}).
			when("/users/:id/edit", {
				templateUrl: 'admin/users/edit.html',
				controller: "usersShowCtrl",
			}).
			when("/inquires", {
				templateUrl: 'inquiries/index.html',
				controller: "inquiriesIndexCtrl",
			}).
			when("/media", {
				templateUrl: 'media/index.html',
				controller: "mediaIndexCtrl",
			})
		}
	])