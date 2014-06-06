package garden;
import network.Http;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

/**
 * ...
 * @author Christopher W. Johnson
 */

class Garden extends Sprite{

	public function new() {
		super();

		var debug = new TextField();
		debug.multiline = true;
		debug.text = "Hello\nWorld";
		addChild(debug);

		var format = new TextFormat();
    format.font = "Courier";
//trace('hello');
    format.size = 24;
    format.color = 0xBBBBBB;
    debug.setTextFormat(format);

		var http = new Http('localhost:3000');

		http.login('cj', 'pass')
		.then(function(response) {
			//trace('great');
			var r = haxe.Json.stringify(response);
			//debug.text = r;
		}).catchError(
		function(response) {
			debug.text = haxe.Json.stringify(response);
		});
	}

}