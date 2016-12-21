'use strict';

/**
 * The implementation with service memory cache.
 * Not as good as the promise + local storage implementation. 
 */
angular.module('user.services', [])
.factory('userService', [ '$http', 'API', function($http, API, ) {
	
	var service = {
			users : [], 
			groups : [],
			userInSync : false,
			groupInSync : false,
	};

	/**
	 * query users
	 */
	service.getAll = function() {
		// start a new http request if cache is not in sync
		if(!service.userInSync){
			console.log('querying users');
			return $http.get(API + 'users')
				.then(function(response) {
					console.log('users returned from db=>' + response.data)
				angular.copy(response.data, service.users);
				service.userInSync = true;
			});	
		} else {
			console.log('use users in cache');
		}
	};
	
	/**
	 * get user by id
	 */
	service.get = function(id) {
		
		if(_.isArray(service.users) && !_.isEmpty(service.users)) {
			console.log('service get user in cache by id = %s', id);
			
			return _.find(service.users, function(item) {
				return item.pk == id;
			});
		} else {
			console.log('service query user by id = %s', id);
			return $http.get(API + 'users/' + id).then(function(response) {
				return response.data;
			});
		}
	};
	
	/**
	 * query groups
	 */
	service.getGroups = function() {
		// start a new http request if cache is not in sync
		if(!service.groupInSync){
			console.log('querying groups from DB');
			return $http.get(API + 'groups')
				.then(function(response) {
					console.log('groups returned from db=>' + response.data)
				angular.copy(response.data, service.groups);
				service.groupInSync = true;
			});	
		} else {
			console.log('use groups in cache');
		}
	};
	
	/**
	 * create a new user
	 */
	service.create = function(user) {
		var promise =  $http.post(API + 'users', user).then(function(response){
			service.users.push(response.data);
			service.userInSync = true;
		});

		return promise;
	};
	
	/**
	 * update a user by id
	 */
	service.update = function(user, id) {
		console.log('service put user by id = %s', id);
		var promise =  $http.put(API + 'users/' + id, user).success(function(data){
			//service.users.push(data);
			
			console.log('put return res=%j', data);
			return data;
		});

		return promise;
	};
	
	/**
	 * delete a user by pk
	 */
	service.deleteById = function(id) {
		return $http.delete(API + 'users/' + id).then(function(response) {
			return response.data;
		});
	};
	
	/**
	 * get users by groups
	 */
//	service.getByGroup = function(groupId) {
//		console.log('service get users by group.pk = %s', groupId);
//		return $http.get(API + 'group/' + slug).success(function(data) {
//			angular.copy(data, service.users);
//		});
//	};
	

	

	
	return service;
}]);