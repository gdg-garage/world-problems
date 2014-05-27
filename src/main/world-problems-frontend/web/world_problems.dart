import "package:world_problems/world_problems.dart";

main() {
  String DEBUG_URL = "../test/data/sample_data.json";
  String fetchUrl = "/_ah/api/problems/v1/random";
  Fetcher fetcher = new Fetcher(DEBUG_URL);
  
  WorldProblemsApp app = new WorldProblemsApp(fetcher);  
  app.initialize('#reload-button', '.first-world', '.third-world'); 
  app.start();
}


