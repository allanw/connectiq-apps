using Toybox.Application;
using Toybox.WatchUi as Ui;

const URL = "https://gorg.herokuapp.com/api/drinks";

class WaterLoggerApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    	makeRequest();
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new WaterLoggerView("hello world") ];
    }
    
    function onReceive(responseCode, data) {
    	Ui.switchToView(new WaterLoggerView(responseCode + " -- " + data), null, Ui.SLIDE_IMMEDIATE);
    }
    
    function makeRequest() {
    	var url = URL;
    	var params = {"name" => "My test beer"};
    	var options = {
    		:method => Communications.HTTP_REQUEST_METHOD_POST,
    		:headers => {
    		    		"Authorization" => "Bearer foobar"	
    			},
    		:responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
    	};
    	var responseCallback = method(:onReceive);
    	
    	Communications.makeWebRequest(url, params, options, method(:onReceive));
    }

}
