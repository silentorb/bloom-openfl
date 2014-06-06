package bloom;
import openfl.display.DisplayObject;

/**
 * ...
 * @author Christopher W. Johnson
 */

class Flower<T:(DisplayObject)> implements IFlower
{
	public var element:T;
	
	public function get_element():DisplayObject {
		return element;
	}
	
	var _x:Float = 0;
	public var x(get,set) : Float;
  function get_x(){ return _x; } 
	function set_x(value) { 
		if (_x == value)
			return _x;
		
		_x = value;
		element.x = value;
		return _x;
	}
	
	var _y:Float = 0;
	public var y(get,set) : Float;
  function get_y(){ return _y; } 
	function set_y(value) { 
		if (_y == value)
			return _y;
		
		_y = value;
		element.y = value;
		return _y;
	} 

	var _width:Float = 0;
	public var width(get,set) : Float;
  function get_width(){ return _width; } 
	function set_width(value) { 
		if (_width == value)
			return _width;
		
		_width = value;
		return _width;
	}
	
	var _height:Float = 0;
	public var height(get,set) : Float;
  function get_height(){ return _height; } 
	function set_height(value) { 
		if (_height == value)
			return _height;
		
		_height = value;
		return _height;
	} 
	
	public function new() 
	{
		
	}
}