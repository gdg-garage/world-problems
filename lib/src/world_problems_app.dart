part of world_problems;

class WorldProblemsApp {
   
  Fetcher fetcher;
  PageView page;
  bool isInitialize;
  
  WorldProblemsApp(this.fetcher){   
    isInitialize = false;
  } 
  
	void initialize(String buttonId) { 
	  Element reload = querySelector(buttonId);
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
    
  }
  
  void updatePage(WorldProblemsPair pair) {
    page.update(pair);
  }
  
  
}