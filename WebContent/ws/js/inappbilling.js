/*
* Copyright (C) 2012 by Guillaume Charhon
*/
var inappbilling = {
	
	// Initialize the plugin
	init: function (success, fail) {
		 return cordova.exec( success, fail,
				 "InAppBillingPlugin",
				 "init", ["MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlLbdD5XSBXV1sMzIHVfLoJoKWX/W20gF29Tbv27pFtHkd24eT9h7fQhUzjuiJyVC4dfldRgYs9gC5bhRg2EWvWHAYq2FBNK6cq7TYlnKdbVXVnS6wfhTPI6vsK7yUVWCZILbTJM+cYFa35IT0NS2hpospdgnjTpUntex4Vhhe7Af6OCz9BrDa6rtrfLO3XwKFM2u0cxI5U/wAifR1W4WT0h7dlyc/SpHLo2YSUo7snBUBiD9si3H41V9HDcP8U3PLbKzR8N6IoHNrGwL8CmQRvugWRSyOUGHgqQ00+uCYrf8lRC5CTNsZyih5O9HYdNhvteftDSt5kZv10Mn1FeiSQIDAQAB"]); 
	},
	// purchase an item
	 purchase: function (success, fail, productId) {
		 return cordova.exec( success, fail,
				 "InAppBillingPlugin",
				 "purchase", [productId]);
	 },
	// get already own items
	 getOwnItems: function (success, fail) { 
		 return cordova.exec( success, fail,
				 "InAppBillingPlugin",
				 "ownItems", ["null"]); 
	 },
};