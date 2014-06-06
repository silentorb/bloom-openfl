package bloom;
import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * ...
 * @author Christopher W. Johnson
 */
class Link extends Flower
{
	var text:TextField;
	
	public function new(title:String = null)
	{	
		super();
		text = new TextField();
		if (title != null)
			text.text = title;
			
		var format = new TextFormat();
    //format.font = "Courier";
    format.size = 24;
    format.color = 0xBBBBBB;
    text.setTextFormat(format);

		trace('a', text.text);
		this.height = text.textHeight;
		
		addChild(text);
	}
	
	override public function real_height() {
		return text.textHeight;
	}
	
}