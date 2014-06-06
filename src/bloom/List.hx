package bloom;

/**
 * ...
 * @author Christopher W. Johnson
 */

class List extends Flower
{
	var children = new Array<Flower>();
	var _height = 0.0;
	
	public function new() 
	{
		super();
		
	}
	
	public function add(child:Flower) {
		//trace('b', height, child.height);
		child.y = _height;
		_height += child.real_height();
		children.push(child);
		addChild(child);
	}
	
		override public function real_height() {
		return _height;
	}
}