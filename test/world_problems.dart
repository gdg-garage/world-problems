import "package:unittest/unittest.dart";
import "package:world_problems/world_problems.dart";
import "package:unittest/html_config.dart";

import "dart:html";

void main() {
  useHtmlConfiguration();
  
  group("World Problems", () {
    WorldProblemsApp worldApplication;
    
    setUp(() {
      worldApplication = new WorldProblemsApp();
    });    
    
    test("start of app", () {
      expect(worldApplication.start(), returnsNormally);
    });
    
    
  });
}