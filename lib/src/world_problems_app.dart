part of world_problems;

class WorldProblemsApp {
   
  Fetcher fetcher;
  PageView page;
  bool isInitialize;
  
  WorldProblemsApp(this.fetcher){   
    isInitialize = false;
  } 
  
	void initialize(String buttonId, String firstId, String thirdId) { 
	  Element reload = querySelector(buttonId);
	  Element first = querySelector(buttonId);
	  Element second = querySelector(buttonId);
	  page = new PageView(reload, first, second);
	  reload.onClick.listen((_) {
  	 refreshPair();
	  });   
	  isInitialize = true;
  }
	
  void start() { 
    if (!isInitialize) {
      throw new Exception("Worl problems not initialized");
    }
    
    refreshPair();
  }
  
  void refreshPair() {
    getRandomPair()
      .then((WorldProblemsPair pair) {
        updatePage(pair);           
      });
  }
  
  Future<WorldProblemsPair> getRandomPair() {
    return fetcher.fetchRandom();
  }
  
  void updatePage(WorldProblemsPair pair) {
    page.update(pair);
  }
  
  
}