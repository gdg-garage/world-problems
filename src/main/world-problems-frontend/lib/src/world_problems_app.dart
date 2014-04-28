part of world_problems;

class WorldProblemsApp {
   
  Fetcher fetcher;
  PageView page;
  bool isInitialized;
  Queue<WorldProblem> problemsHistory; 
  
  WorldProblemsApp(this.fetcher){   
    isInitialized = false;
    problemsHistory = new Queue();
  } 
  
	void initialize(String buttonId, String firstId, String thirdId) { 
	  Element reload = querySelector(buttonId);
	  Element first = querySelector(firstId);
	  Element second = querySelector(thirdId);
	  page = new PageView(reload, first, second);
	  reload.onClick.listen((MouseEvent ev) {
	    print("Reload clicked.");
  	  refreshPair();
  	  ev.preventDefault();  // Prevent from reloading the page.
	  });   
	  isInitialized = true;
  }
	
  void start() { 
    if (!isInitialized) {
      throw new Exception("World problems not initialized");
    }
    
    refreshPair();
  }
  
  void refreshPair() {
    getRandomPair()
      .then((WorldProblemsPair pair) {
        print("Pair fetched.");
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