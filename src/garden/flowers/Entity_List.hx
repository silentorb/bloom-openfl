package garden.flowers;
import bloom.Flower;
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

	public function new(trellis:Trellis) {
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
	}

}