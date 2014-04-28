part of world_problems;

class WorldProblem {
  
  int id;
  String text;
  String author;
  String source;
  String url;
  String submitter;
  
  WorldProblem(this.id, this.text, this.author, this.source, this.url, 
      this.submitter);
  
  WorldProblem.fromMap(Map data) :
      id = data["id"], text = data["text"], author = data["author"],
      source = data["source"], url = data["url"], 
      submitter = data["submitter"];
//    "id": 1,
//    "text": "Asked for the all black 5s & got the gold one I hate my parents smfh I hate my life guess I'm staying with the 5 http://pic.twitter.com/jMA40WXrXy",
//    "author": "ronald h",
//    "source": "Twitter",
//    "url": "https://twitter.com/ogronald/status/415707014875348992",
//    "submitter": "filiph"
}
    
  