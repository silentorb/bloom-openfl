package garden.flowers;
import bloom.Flower;
import garden.channels.Channel;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.events.*;
import garden.Garden;

/**
 * ...
 * @author Christopher W. Johnson
 */
class Link extends Flower<TextField>
{
	//var text:TextField;
	var channel:Channel;

	public function new(title:String = null, channel:Channel)
	{
		super();
		this.channel = channel;
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
		element.addEventListener(MouseEvent.CLICK, function(info) {
			this.channel.goto();
		});
	}

}