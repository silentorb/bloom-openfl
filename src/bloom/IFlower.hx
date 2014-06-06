package bloom;
import openfl.display.DisplayObject;

/**
 * @author Christopher W. Johnson
 */

interface IFlower 
{
	function get_element():DisplayObject;
  var x(get,set):Float;
	var y(get,set):Float;
	var width(get,set):Float;
	var height(get,set):Float;
}