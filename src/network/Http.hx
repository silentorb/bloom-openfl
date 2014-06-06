package network;
import promhx.Promise.Promise;
import haxe.Json;

/**
 * ...
 * @author Christopher W. Johnson
 */
class Http {
	var server_url:String;

	public function new(server_url:String) {
		this.server_url = server_url;
	}

	public function create_url(path:String):String {
		return 'http://' + server_url + '/' + path;
	}

  public function get(url:String):Promise<Dynamic> {
		return http(url, null, false);
	}

	public function post(url:String, data:Dynamic):Promise<Dynamic> {
		return http(url, data, true);
	}

  function http(url:String, data:Dynamic, post:Bool):Promise<Dynamic> {
    var promise = new Promise<Dynamic>();
    var r = new haxe.Http(create_url(url));
    r.onError = function(response) {
      promise.reject(response);
    }
    r.onData = function(response) {
			trace('http', response);
      promise.resolve(Json.parse(response));
    }
		if (post)
			r.setPostData(Json.stringify(data));

		r.setHeader('Content-Type', 'application/json');
    r.request(post);
    return promise;
  }

	public function login(name:String, password:String):Promise<Dynamic> {
		return post('vineyard/login', { name: name, pass: password } );
	}
}