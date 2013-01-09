/**
 * common.js
 * Last Revision: 2009-11-25
 */

// Creating Namespace
var Common = {
	initialize: function() {
		// modify setTimeout function with carrying arguments
		var _st = window.setTimeout;
		window.setTimeout = function(fRef, mDelay) {
			if(typeof fRef == 'function'){
				var argu = Array.prototype.slice.call(arguments,2);
				var f = (function(){ fRef.apply(null, argu); });
				return _st(f, mDelay);
			}
			return _st(fRef,mDelay);    
		}
		
		// Array Remove - By John Resig (MIT Licensed), http://ejohn.org/blog/javascript-array-remove/
		Array.prototype.remove = function(from, to) {
		  var rest = this.slice((to || from) + 1 || this.length);
		  this.length = from < 0 ? this.length + from : from;
		  return this.push.apply(this, rest);
		};
		
		jQuery.fn.log = function (msg) {
			if(window.console != null) {
				console.log("%s: %o", msg, this);
			}
			return this;
		};
	}
};
Common.initialize();

/**
 * Module: Utils
 */
Common.Utils = (function()  {
	// Private members.

	return { // Public members.
		log: function(msg) {
			if(window.console != null) {
				console.log(msg);
			}
		},
		info: function(msg) {
			if(window.console != null) {
				console.info(msg);
			}
		},
		warn: function(msg) {
			if(window.console != null) {
				console.warn(msg);
			}
		},
		error: function(msg) {
			if(window.console != null) {
				console.error(msg);
			}
		},
		// int SCHEMA = 2, DOMAIN = 3, PORT = 5, PATH = 6, FILE = 8, QUERYSTRING = 9, HASH = 12
		parseUrl: function(url) {
			var regex = /^((http[s]?|ftp):\/)?\/?([^:\/\s]+)(:([^\/]*))?((\/\w+)*\/)([\w\-\.]+[^#?\s]+)(\?([^#]*))?(#(.*))?$/;
			return url.split(regex);
		},
		getDomain: function(url) {
			var tmp = url.match(/:\/\/(.[^/]+)/);
			if( tmp != null ) {
				return tmp[1];
			} else {
				return null;
			}
		},
		stripTags: function(str){
			return str.replace(/<\w+(\s+("[^"]*"|'[^']*'|[^>])+)?>|<\/\w+>/gi, '');
		},
		isIE67: function() { // check the current browser is IE6 or IE7?
			return ( navigator.userAgent.toLowerCase().indexOf("msie 7.0") >= 0
				|| navigator.userAgent.toLowerCase().indexOf("msie 6.0") >= 0 );
		},
		getFileExt: function(str) { // it will return file extension name. e.g. .gif, .jpg
			if( str != null ) {
				var index = str.lastIndexOf(".");
				if( index >= 0 ) {
					return str.substr(index);
				}
			}
			return null;
		},
		evalJson: function(str) { // return a json object by given json string
			return eval('(' + str + ')');
		},
		toint: function(str) {
			return Number(str);
		},
		validateUrl: function(value) { // reference from /js/jquery/validate/jquery.validate.js: url function
			return /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(value);		
		},
		validateEmail: function(value) { // reference from /js/jquery/validate/jquery.validate.js: email function
			return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(value);
		},
		// reference from /js/jquery/validate/additional-methods.js: alphanumeric function
		// 123_abc -> O
		// 123 gg -> X
		// 123%ff -> X
		validateAlphaNumeric: function(value) {
			return /^\w+$/i.test(value);
		},
		validateAlpha: function(value) { // reference from /js/jquery/validate/additional-methods.js: lettersonly function
			return /^[a-z]+$/i.test(value);
		},
		// 123 -> X
		// abc -> O
		// ab123 -> O
		validateAlphaLeadNumberic: function(value) {
			return /^[a-z]\w+$/i.test(value);
		},
		// reference from /js/jquery/validate/additional-methods.js: nowhitespace function
		validateNoWhiteSpace: function(value) {
			return /^\S+$/i.test(value);
		},
		// as like encodeURIComponent function, encoding special character instead only
		// ,/?:@&=+$#  →  %2C%2F%3F%3A%40%26%3D%2B%24%23
		encodeQueryStr: function(str) {
			str = str.replace(",", "%2C");
			str = str.replace("/", "%2F");
			str = str.replace("?", "%3F");
			str = str.replace(":", "%3A");
			str = str.replace("@", "%40");
			str = str.replace("&", "%26");
			str = str.replace("=", "%3D");
			str = str.replace("+", "%2B");
			str = str.replace("$", "%24");
			str = str.replace("#", "%23");
			return str;
		},
		getNow: function() { // get current time
			return new Date().getTime();
		},
		openWindow: function(url,ww,hh) { // open a new window, ww = window width, hh = window height
		  var w = 800, h = 600;
		  if (document.all) {
		    // the following is only available after onLoad
		    w = document.body.clientWidth;
		    h = document.body.clientHeight;
		  }
		  else if (document.layers) {
		    w = window.innerWidth;
		    h = window.innerHeight;
		  }
		  var popW = ww, popH = hh;
		  var leftPos = (w-popW)/2, topPos = (h-popH)/2;
		  var msgWindow = window.open(url,null,"height="+popH+",width="+popW+",top="+topPos+",left="+leftPos+",status=yes,toolbar=no,menubar=no,location=no,resize=yes,scrollable=yes,resizable=1,scrollbars=yes");
		  if(msgWindow.opener == null) msgWindow.opener = self;
		  return msgWindow;
		},
		// function to calculate local time
		// in a different city
		// given the timezone's UTC offset
		formatDate : function(dateTime, pattern, offset) {
		    // convert to msec
		    // add local time zone offset
		    // get UTC time in msec
		    var utc = dateTime.getTime() + (dateTime.getTimezoneOffset() * 60000);

		    // create new Date object for different timezone
    		// using supplied offset
    		var localTime = new Date(utc + (3600000 * offset));
    		var display = localTime.format(pattern);

    		// return time as a string
    		return display;
		},
		isObject: function(data) {
  			return (data && typeof data == "object");
		},
		getScreenWidth: function() {
			return document.documentElement.clientWidth;
		},
		getScreenHeight: function() {
			return document.documentElement.clientHeight;
		},
		displayFileSize: function(size) {
			var displayStr = "";
			if( size != null && typeof size == 'number') {
				if( size >= 1048576 ) {
					displayStr = (size/1048576).toFixed(2) + " MB";
				} else if( size >= 1024 ) {
					displayStr = (size/1024).toFixed(2) + " KB";
				} else {
					displayStr = (size) + " Bytes";
				}
			}
			return displayStr;
		},
		getMessage: function(key, params) {
			var fullKey = "Message." + key;
			try {
				var message = eval(fullKey);
				if (Common.Utils.isObject(params)) {
					for( var i=0; i<params.length; i++ ) {
						if( params[i] != null ) {
							var replaceStr = "{"+i+"}";
							while ( message.indexOf( replaceStr ) != -1 ) {
								message = message.replace( replaceStr, params[i] );
							}
						}
					}
				}
				return message;
			} catch (e) {
				this.warn('?' + fullKey);
				return '?' + fullKey;
			}
		},
		transObjToParamStr: function(obj) { // {aaa:"111", bbb:"222"} -> ?aaa=111&bbb=222
			var paramStr = "";
			for( key in obj ) {
				if( paramStr == "" ) {
					paramStr += "?";
				} else {
					paramStr += "&";
				}
				paramStr += key + "=" + obj[key];
			}
			return paramStr;
		},
		setUriParameter: function(uri, params) {
			if( uri != null ) {
				if( params != null && typeof params == 'object' ) { // set single parameter
					var pos = uri.indexOf("?");
					if( pos >= 0 ) {
						var prefix = uri.slice(0, pos);
						var paramStr = uri.slice(pos+1, uri.length);
						var paramArray = paramStr.split("&");
						
						var obj = {};
						for( var i=0; i<paramArray.length; i++ ) {
							var item = paramArray[i].split("=");
							obj[item[0]] = item[1];
						}
						for( key in params ) {
							obj[key] = params[key];
						}
						paramStr = this.transObjToParamStr(obj);
						return ( prefix + paramStr );
					} else {
						var paramStr = this.transObjToParamStr(params);
						return ( uri + paramStr );
					}
				} else {
					return uri;
				}
			} else {
				return null;
			}
		}
	};
})(); // Utils end
			
/**
 * Module: UI
 */
Common.UI = (function()  {
	// Private members.

	return { // Public members.
		createDonateButton: function() {
			var html = '<form name="_xclick" action="https://www.paypal.com/cgi-bin/webscr" method="post">'
				+'<input type="hidden" name="cmd" value="_xclick">'
				+'<input type="hidden" name="business" value="firestoke@gmail.com">'
				+'<input type="hidden" name="item_name" value="Donate">'
				+'<input type="hidden" name="currency_code" value="USD">'
				+'<input type="hidden" name="amount" value="">'
				+'<input type="image" src="https://www.paypal.com/en_US/i/btn/btn_donate_LG.gif" border="0" name="submit" alt="Make payments with PayPal - it\'s fast, free and secure!">'
				+'</form>';
			return html;
		}
	};
})(); // UI end

// alias
var utils = Common.Utils;
var log = utils.log;
var info = utils.info;
var warn = utils.warn;
var error = utils.error;

// testing code
//log( utils.transObjToParamStr({aaa:"111", bbb:"222"}) );
//log( utils.setUriParameter("index/?xxx=777&yyy=666", {aaa:"999", xxx:"111", bbb:"222"}) );
//log( utils.setUriParameter("index/", {aaa:"999", xxx:"111", bbb:"222"}) );
//log( utils.setUriParameter("index/", null) );
