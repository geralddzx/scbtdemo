angular_module.factory('httpInterceptor', ['$q', function($q) {
  return {
    request: function(config) {
      // do something on success
      return config;
    },

    // optional method
    requestError: function(rejection) {
      // do something on error
      if (canRecover(rejection)) {
        return responseOrNewPromise
      }
      return $q.reject(rejection);
    },



    // optional method
    response: function(response) {
      return response;
    },

    // optional method
    responseError: function(rejection) {
      var message = rejection.data.message || rejection.data
      if(rejection.status == 401){
        window.location = "/"
        alert(message)
      } else if(rejection.status == 404){
        alert("Not found! Another user could have deleted the object, page will refresh")
        window.location.reload()
      } else {
        alert(message)
      }
      return $q.reject(rejection);
    }
  };
}]);