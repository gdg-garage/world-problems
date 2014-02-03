import "package:unittest/unittest.dart";
import "package:world_problems/world_problems.dart";
import "package:unittest/html_config.dart";

import "dart:html";

void main() {
  useHtmlConfiguration();
  
  group("World Problems", () {
    ProblemsApp app;
    
    setUp(() {
//      Element button = new ButtonElement();
//      var el1 = new DivElement();
//      var el2 = new DivElement();
      var pageView = new PageView(el1, el2, button);
      var fetcher = new Fetcher("heegergeer");
      app = new ProblemsApp(pageView, fetcher);
    });    
    
//    test("start of app", () {
//      Element el = new ParagraphElement();
//      var pModel = new ProblemModel();
//      var pView = new ProblemView(el, pModel);
//      pView.render();
//    });
    
    test("start of app", () {
      expect(app.start(), returnsNormally);
    });
  });
}