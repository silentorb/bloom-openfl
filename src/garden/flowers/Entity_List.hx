package garden.flowers;
import bloom.Flower;
import bloom.List;
import garden.channels.Entity_Channel;
import garden.Query;
import metahub.schema.Trellis;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.display.Sprite;

/**
 * ...
 * @author Christopher W. Johnson
 */
class Entity_List extends Flower<Sprite> {
	var title:String;
	var query:Query;

	public function new(title:String,query:Query, garden:Garden) {
		super();
		this.title = title;
		this.query = query;
		element = new Sprite();
		var text = new TextField();
		text.text = title;

		var format = new TextFormat();
    format.font = "Arial";
    format.size = 24;
    //format.color = 0xBBBBBB;
    text.setTextFormat(format);
		element.addChild(text);
		
		query.run(garden.remote)
		.then(function(response) {
			var list = new List();
			list.element.y = 30;
			var objects = response.objects;
			element.addChild(list.element);
			for (i in Reflect.fields(objects)) {
				var entity = Reflect.field(objects, i);
				var channel = new Entity_Channel(query.trellis, query.trellis.get_identity(entity));
				var link = new Link(entity.name, channel);
				list.add(link);
			}
		});
		
		
		
		
	}

}