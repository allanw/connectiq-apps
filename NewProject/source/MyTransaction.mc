using Toybox.Communications as Comm;
using Toybox.Application as App;
using Toybox.System as Sys;

class TransactionDelegate
{
	function handleError(error) {
	}
	
	function handleResponse(data) {
	}
}

// Base class for transactions to an OAuth API
class Transaction
{
	hidden var _action;
	hidden var _parameters;
	hidden var _delegate;
	
	// Constructor
	// @param delegate TransactionDelegate
	hidden function initialize(delegate) {
		_delegate = delegate;
	}
	
	// Executes the transaction
	function go() {
		var accessToken = App.getApp().getProperty("access_token");
		var url = $.ApiUrl + _action;
		
		Comm.makeWebRequest(
			url,
			_parameters,
			{
				:method=>Comm.HTTP_REQUEST_METHOD_GET,
				:headers=>{ "Authorization"=>"Bearer " + accessToken }
			},
			method(:onResponse)
		);
	}
	
	// Handles response from the server
	function onResponse(responseCode, data) {
		if(responseCode == 200) {
			Sys.println("response is OK!");
		} else {
			Sys.println("response not ok");
		}
	}
}