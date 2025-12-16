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
    		    		"Authorization" => "Bearer fyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16Y3pNMFE0TWtRMU9EWTNNVEUwTVVORlJqUTNNa1F4TlRoQk1qTkNSRUV6TkRsR05qRkVPUSJ9.eyJpc3MiOiJodHRwczovL2FsbGFudy5hdXRoMC5jb20vIiwic3ViIjoiMVVKUjQxOGhIYUxjYXdVenYxWlBjOTBWNUtTc3VzcWxAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vZ29yZy5oZXJva3VhcHAuY29tL2FwaSIsImlhdCI6MTU5MjI5MzIzMywiZXhwIjoxNTkyMzc5NjMzLCJhenAiOiIxVUpSNDE4aEhhTGNhd1V6djFaUGM5MFY1S1NzdXNxbCIsImd0eSI6ImNsaWVudC1jcmVkZW50aWFscyJ9.aj6OSJaovG7L2YLVw6j6mTZzLk2K_w-xKyvCj_WboUgB02FtstHnAhegkdn0GlVTn4tqP6G-C0FlOi6Hp8eTw-h_sG25wevFxJG_WS2830UoRo4aEtvSqn5bL2Lh1S63DKgXKXF6tQRwADaDizg16MBtsnpZC3haySG5MG-1-TpX8G46rxwCJZIiMj2HBVY531ozr3EZ_ew9TEYqOMJWXwj38M1fNU6jpIwNomXI_bSvlOZvsDXO-RumjhcUDZ1HvEHX4I8seuyDt8ReApNP735VR7SQg5WgdNroaHRfUhrbipGf0x_N_O-O4EzDNGGFuqD0zzKOEWYU_mk1Y9v6rQ"	
    			},
    		:responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
    	};
    	var responseCallback = method(:onReceive);
    	
    	Communications.makeWebRequest(url, params, options, method(:onReceive));
    }

}