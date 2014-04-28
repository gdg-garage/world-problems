import "package:unittest/unittest.dart";
import "package:world_problems/world_problems.dart";
import "package:unittest/html_config.dart";

void main() {
  useHtmlConfiguration();
  group("Fetcher test", () {
    Fetcher fetcher;
    
    setUp(() {
      String url = "data/sample_data.json";
      fetcher = new Fetcher(url);
    });    
    
    test("Return a valid pair from server", () {
      var problemPairFuture = fetcher.fetchRandom();
      problemPairFuture.then(expectAsync1((WorldProblemsPair problemPair) {
        expect(problemPair.firstProblem, isNotNull);
        expect(problemPair.thirdProblem, isNotNull);
      }));
      
    });
  
  });
}