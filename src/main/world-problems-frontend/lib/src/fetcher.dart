part of world_problems;

class Fetcher {

  final String apiUrl;
  
  Fetcher(this.apiUrl);
  
  Future<WorldProblemsPair> fetchRandom([Iterable<WorldProblem> ignore]) {
    var completer = new Completer();
    
    HttpRequest.getString(apiUrl)
      .then((String json) {
        var problemPair = parseList(convertJsonToList(json));
        completer.complete(problemPair);
      });
    
    return completer.future;
  }
  
  List<Map> convertJsonToList(String json) {
    Map<String,List> itemsMap = JSON.decode(json);
    return itemsMap["items"];
  }
  
  WorldProblemsPair parseList(list) {
    var firstProblem = new WorldProblem.fromMap(list[0]);
    var thirdProblem = new WorldProblem.fromMap(list[1]);
    return new WorldProblemsPair(firstProblem, thirdProblem);
  }
}