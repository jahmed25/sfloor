function emailValidation(email) {
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(email);
}
var app = angular.module('checkout', []);
app.controller('checkCtrl', function ($scope, checkService) {
	$scope.submitForm=function (frm){
		frm.$dirty=true;
		alert(frm.$valid)
	}
	
});
app.service('checkService', function ($http) {
	this.validate = function (scope) {
		$.ajax({ method: 'POST', url: path+'sfloor/pages/AjaxService.aspx'})
			.success(function (msg) {
					alert(1)
			});
		};
});
