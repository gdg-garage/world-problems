import "package:unittest/unittest.dart";
import "package:world_problems/world_problems.dart";
import "package:unittest/html_config.dart";

void main() {
  
  group("Fetcher test", () {
    Fetcher fetcher;
    
    setUp(() {
      String url = "";
      fetcher = new Fetcher(url);
    });    
    
    test("Return a valid pair from server", () {
      var problemPair = fetcher.fetchRandom();
      expect(problemPair.firstProblem, isNotNull);
      expect(problemPair.thirdProblem, isNotNull);
    });
  
  });
}