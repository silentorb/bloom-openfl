package bloom;
import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * ...
 * @author Christopher W. Johnson
 */
class Link extends Flower<TextField>
{
	//var text:TextField;
	var garden:Garden;
	
	public function new(title:String = null, garden:Garden)
	{	
		super();
		this.garden = garden;
		var text = element = new TextField();
		if (title != null)
			text.text = title;
			
		var format = new TextFormat();
    format.font = "Arial";
    format.size = 24;
    //format.color = 0xBBBBBB;
    text.setTextFormat(format);
		text.selectable = false;

		//trace('a', text.text);
		this.height = text.textHeight;
		
		//element.addChild(text);
		addEventListener(MouseEvent.CLICK, function() {
			
		});
	}
	
}