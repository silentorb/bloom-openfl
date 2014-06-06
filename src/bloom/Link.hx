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
	
	public function new(title:String = null)
	{	
		super();
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
	}
	
}