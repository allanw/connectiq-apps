using Toybox.Application;
using Toybox.WatchUi as Ui;

const URL = "https://jsonplaceholder.typicode.com/posts/1";

class NewProjectApp extends Application.AppBase {

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
        return [ new RequestView("hello world") ];
    }
    
    function onReceive(responseCode, data) {
    	Ui.switchToView(new RequestView(responseCode + " -- " + data), null, Ui.SLIDE_IMMEDIATE);
    }
    
    function makeRequest() {
    	var url = URL;
    	var params = null;
    	var options = {
    		:method => Communications.HTTP_REQUEST_METHOD_GET,
    		:responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON	
    	};
    	var responseCallback = method(:onReceive);
    	
    	Communications.makeWebRequest(url, params, options, method(:onReceive));
    }

}