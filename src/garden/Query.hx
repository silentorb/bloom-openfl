package garden;
import metahub.schema.Trellis;
import network.Http;
import promhx.Promise;
import haxe.Json;

/**
 * ...
 * @author Christopher W. Johnson
 */
class Query {

	public var trellis:Trellis;

	public function new(trellis:Trellis) {
		this.trellis = trellis;
	}

	public function render():String {
		var data = {
			trellis: trellis.name
		};
		return Json.stringify(data);
	}
	
	public function run(remote:Http):Promise<Dynamic> {
		var json = render();
		return remote.post('vineyard/query', json)
			.then(function(info) {
			return Json.parse(info.response);
		});
	}

}