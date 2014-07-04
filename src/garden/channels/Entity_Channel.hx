package garden.channels;
import metahub.schema.Trellis;

/**
 * ...
 * @author Christopher W. Johnson
 */
class Entity_Channel implements Channel {
	var trellis:Trellis;
	var id:Dynamic;

	public function new(trellis:Trellis, id:Dynamic) {
		this.trellis = trellis;
		this.id = id;
	}

	public function goto() {

	}
}