package bloom;
import openfl.display.Sprite;

/**
 * ...
 * @author Christopher W. Johnson
 */

class List extends Flower<Sprite>
{
	var children = new Array<IFlower>();
	
	public function new() 
	{
		super();
		element = new Sprite();
	}
	
	public function add(child:IFlower) {
		trace('b', height, child.height);
		//child.y = height;
		child.y = height;
		_height += child.height;
		children.push(child);
		element.addChild(child.get_element());
		//addChild(child);
	}
}