using Toybox.WatchUi as Ui;


class RequestView extends Ui.View {
	
	hidden var _message;
	
	function initialize(message) {
		View.initialize();
		_message = message;
		System.println(message);
	}
	
	function onLayout(dc) {
		setLayout(Rez.Layouts.LoginLayout(dc));
		View.findDrawableById("message").setText(_message);
	}
	
	function onShow() {
	}
	
	function onUpdate(dc) {
		// Call the parent onUpdate function to redraw the layout
		View.onUpdate(dc);
	}
	
	// Called when this View is removed from the screen. Save the
	// state of this View here. This includes freeing resources from
	// memory.
	function onHide() {
	}
}