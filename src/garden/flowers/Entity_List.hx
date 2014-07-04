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
	var trellis:Trellis;

	public function new(trellis:Trellis, garden:Garden) {
		super();
		this.trellis = trellis;
		element = new Sprite();
				var text = new TextField();
			text.text = trellis.name;

		var format = new TextFormat();
    format.font = "Arial";
    format.size = 24;
    //format.color = 0xBBBBBB;
    text.setTextFormat(format);
		element.addChild(text);
		
		var query = new Query(trellis);
		query.run(garden.remote)
		.then(function(response) {
			var list = new List();
			var objects = response.objects;
			element.addChild(list.element);
			for (i in Reflect.fields(objects)) {
				var entity = Reflect.field(objects, i);
				var channel = new Entity_Channel(trellis, trellis.get_identity(entity));
				var link = new Link(entity.name, channel);
				list.add(link);
			}
		});
		
		
		
		
	}

}