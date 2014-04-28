part of world_problems;

class WorldProblemsApp {
   
  Fetcher fetcher;
  PageView page;
  bool isInitialized;
  Queue<WorldProblem> firstProblemsHistory;
  Queue<WorldProblem> thirdProblemsHistory;
  final int maxHistory;
  
  WorldProblemsApp(this.fetcher, {this.maxHistory: 1}){   
    isInitialized = false;
    firstProblemsHistory = new Queue();
    thirdProblemsHistory = new Queue();
  } 
  
	void initialize(String buttonId, String firstId, String thirdId) { 
	  Element reload = querySelector(buttonId);
	  Element first = querySelector(firstId);
	  Element second = querySelector(thirdId);
	  page = new PageView(reload, first, second);
	  reload.onClick.listen((MouseEvent ev) {
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
        updatePage(pair);           
      });
  }
  
  Future<WorldProblemsPair> getRandomPair() {
    return fetcher.fetchRandom(firstProblemsHistory, thirdProblemsHistory)
      .then((WorldProblemsPair pair) {
        firstProblemsHistory.addLast(pair.firstProblem);
        if (firstProblemsHistory.length > maxHistory) {
          firstProblemsHistory.removeFirst();
        }
        thirdProblemsHistory.addLast(pair.thirdProblem);
        if (thirdProblemsHistory.length > maxHistory) {
          thirdProblemsHistory.removeFirst();
        }
        return pair;
    });
  }
  
  void updatePage(WorldProblemsPair pair) {
    page.update(pair);
  }
}