import "package:world_problems/world_problems.dart";

main() {
  String fetchUrl = "../test/data/sample_data.json";
  Fetcher fetcher = new Fetcher(fetchUrl);
  
  WorldProblemsApp app = new WorldProblemsApp(fetcher);  
  app.initialize('#reload-button', '.first-world', '.third-world'); 
  app.start();
}


