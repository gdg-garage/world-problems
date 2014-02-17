part of world_problems;

class WorldProblemsApp {
   
  Fetcher fetcher;
  PageView page;
  bool isInitialize;
  Queue<WorldProblem> problemsHistory; 
  
  WorldProblemsApp(this.fetcher){   
    isInitialize = false;
    problemsHistory = new Queue();
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
    fetcher.fetchRandom(problemsHistory)
      .then((WorldProblemsPair pair) {
        problemsHistory.add(pair.firstProblem);
        problemsHistory.add(pair.thirdProblem);
        return pair;
    });
    
    
    return fetcher.fetchRandom();
  }
  
  void updatePage(WorldProblemsPair pair) {
    page.update(pair);
  }
  
  
}