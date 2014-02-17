part of world_problems;

class Fetcher {
  /// Top-level URL of the API.
  final String url;
  
  Fetcher(this.url);
  
  Future<WorldProblemsPair> fetchRandom([Iterable<WorldProblem> ignore]) {
    var completer = new Completer();
    
    HttpRequest.getString(url)
      .then((String json) {
        print(json.length);
        List<Map> list = JSON.decode(json);
        assert(list.length == 2);
        var first = new WorldProblem.fromMap(list[0]);
        var third = new WorldProblem.fromMap(list[1]);
        var problems = new WorldProblemsPair(first, third);
        completer.complete(problems);
      });
//      .catchError((Error error) {
//        print(error.toString());
//      });
    
    return completer.future;
  }
}