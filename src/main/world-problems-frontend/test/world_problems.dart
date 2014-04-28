import "package:unittest/unittest.dart";
import "package:world_problems/world_problems.dart";
import "package:unittest/html_config.dart";

void main() {
  useHtmlConfiguration();
  
  group("World Problems", () {
    WorldProblemsApp worldApplication;
    
    setUp(() {
      String url = "data/sample_data.json";
      var fetcher = new Fetcher(url);
      worldApplication = new WorldProblemsApp(fetcher);
    });    
    
    test("start of app", () {
      expect(worldApplication.start(), returnsNormally);
    });
    
    
  });
}