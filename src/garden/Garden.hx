package garden;
import bloom.Flower;
import bloom.IFlower;
import garden.channels.Trellis_Channel;
import garden.flowers.Link;
import bloom.List;
import haxe.ds.StringMap;
import metahub.Hub;
import metahub.schema.Schema;
import metahub.schema.Trellis;
import network.Http;
import flash.display.Sprite;
import openfl.display.DisplayObject;
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
	var schema:Schema;
	var main_view:Flower<Sprite>;

	public var remote:Http;

	public function new() {
		super();

		schema = new Schema();
		//var text = new TextField();
		//var format = new TextFormat();
			//text.text = "Frrog3";
    //format.font = "Arial";
    //format.size = 24;
    //format.color = 0xBBBBBB;
//text.x = 100;
//text.y = 100;
		//addChild(text);
    //text.setTextFormat(format);

			//text.text = "a";

		remote = new Http('localhost:8083');
		//var def = new Deferred<Dynamic>();
		//haxe.Timer.delay(function() def.resolve(null), 5000);
		//def.promise().then(function(i) {
			//trace('it worked');
		//});

		remote.login('cj', 'pass')
		.then(function(response) {
			trace('logged in');
			return remote.get_json('vineyard/schema')
			.then(function(response) {
				trace('populating list...');
				schema.load_trellises(response.trellises);
				trace('r', Reflect.fields(response));
				trace('trellises', Reflect.fields(response.trellises));
				populate_list(schema.trellises);
			});
		});
	}

	function populate_list(trellises:Array<Trellis>) {
		trace('hey');
		var list = new List();
		addChild(list.element);
		list.x = 10;
		list.y = 10;
	//list.add(new Link("A"));
		//list.add(new Link("B"));

		//var trellises:StringMap<Dynamic> = cast response.trellises;
		//trace('trellises', response);
		//for (trellis in trellises) {
			//list.add(new Link(trellis.name));
		//}
		for (trellis in trellises) {
			var channel = new Trellis_Channel(trellis, this);
			list.add(new Link(trellis.name, channel));
		}

		trace('done populating');
	}

	public function set_main_view(view:Flower<Sprite>) {
		if (main_view != null) {
			removeChild(main_view.element);
		}

		main_view = view;
		addChild(main_view.element);
		main_view.x = 200;
	}
}