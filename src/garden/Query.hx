package garden;
import metahub.schema.Trellis;

/**
 * ...
 * @author Christopher W. Johnson
 */
class Query{

	public var trellis:Trellis;

	public function new(trellis:Trellis) {
		this.trellis = trellis;
	}

	public function render():String {
		return "";
	}

}