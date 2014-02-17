import "package:world_problems/world_problems.dart";

import "dart:html";

main() {
  String fetchUrl = "";
  Fetcher fetcher = new Fetcher(fetchUrl);
  
  WorldProblemsApp app = new WorldProblemsApp(fetcher);  
  app.initialize('#reload-button'); 
  app.start();
}


