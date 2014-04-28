part of world_problems;

class Fetcher {

  final String apiUrl;
  
  Fetcher(this.apiUrl);
  
  Future<WorldProblemsPair> fetchRandom([Iterable<WorldProblem> firstIgnore,
                                         Iterable<WorldProblem> thirdIgnore]) {
    var completer = new Completer();
    
    String url;
    if (firstIgnore != null && firstIgnore.length > 0 &&
        thirdIgnore != null && thirdIgnore.length > 0) {
      if (firstIgnore.length > 1 || thirdIgnore.length > 1) {
        throw new Exception("Longer ignore list than 1 not implemented.");
      }
      url = "$apiUrl?ignore_first=${firstIgnore.single.id}"
            "&ignore_third=${thirdIgnore.single.id}";
    } else {
      url = apiUrl;
    }
    
    HttpRequest.getString(url)
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