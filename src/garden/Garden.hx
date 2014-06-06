package garden;
import bloom.Link;
import bloom.List;
import haxe.ds.StringMap;
import network.Http;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import promhx.Deferred;
import promhx.Promise;
import vineyard.Vineyard;

/**
 * ...
 * @author Christopher W. Johnson
 */

class Garden extends Sprite{
	var vineyard:Vineyard;
	
	public function new() {
		super();
		//var text = new TextField();
		//var format = new TextFormat();
			//text.text = "Frrog3";
    //format.font = "Arial";
    //format.size = 24;
    //format.color = 0xBBBBBB;
//text.x = 100;
//text.y = 100;
			//text.text = "a";
    //text.setTextFormat(format);
		//
		//addChild(text);
		var http = new Http('localhost:3000');
		//var def = new Deferred<Dynamic>();
		//haxe.Timer.delay(function() def.resolve(null), 5000);
		//def.promise().then(function(i) {
			//trace('it worked');
		//});

		http.login('cj', 'pass')
		.then(function(response) {
			trace('logged in');
			return http.get_json('vineyard/schema')
			.then(function(response) {
				trace('populating list...');
				populate_list(response);
			});
		});
	}
	
	function populate_list(response) {
		var list = new List();
		//list.add(new Link("A"));
		//list.add(new Link("B"));
		
		//var trellises:StringMap<Dynamic> = cast response.trellises;
		//trace('trellises', response);
		//for (trellis in trellises) {
			//list.add(new Link(trellis.name));
		//}
		
		for (i in Reflect.fields(response.trellises)) {
			var trellis = Reflect.field(response.trellises, i);
			list.add(new Link(i));
		}
		
		
		addChild(list);

		trace('done populating');
	}

}