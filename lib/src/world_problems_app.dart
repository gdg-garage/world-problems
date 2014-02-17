part of world_problems;

class WorldProblemsApp {
   
  Fetcher fetcher;
  bool isInitialize;
  
  WorldProblemsApp(this.fetcher){   
    isInitialize = false;
  } 
  
	void initialize(String buttonId) { 
	  Element reload = querySelector(buttonId);
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
    WorldProblemsPair pair = getRandomPair();
    updatePage(pair); 
  }
  
  WorldProblemsPair getRandomPair() {
    
  }
  
  void updatePage(WorldProblemsPair pair) {
    
  }
  
  
}