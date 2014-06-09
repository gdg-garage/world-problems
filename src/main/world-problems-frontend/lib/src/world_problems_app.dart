part of world_problems;

class WorldProblemsApp {

  Fetcher fetcher;
  PageView page;
  bool isInitialized;
  Queue<WorldProblem> firstProblemsHistory;
  Queue<WorldProblem> thirdProblemsHistory;
  final int maxHistory;

  DivElement _reloadDiv;
  AnchorElement reload;

  static const pulseAnimationDuration = const Duration(seconds: 1, milliseconds:
      200);

  WorldProblemsApp(this.fetcher, {this.maxHistory: 1}) {
    isInitialized = false;
    firstProblemsHistory = new Queue();
    thirdProblemsHistory = new Queue();
  }

  void initialize(String buttonId, String firstId, String thirdId) {
    reload = querySelector(buttonId);
    _reloadDiv = querySelector(".button"); // TODO: setting
    Element first = querySelector(firstId);
    Element second = querySelector(thirdId);
    page = new PageView(reload, first, second);
    reload.onClick.listen((MouseEvent ev) {
      _reloadDiv.classes.add("pulse");
      new Timer(pulseAnimationDuration, () {
        _reloadDiv.classes.remove("pulse");
      });
      refreshPair();
      ev.preventDefault(); // Prevent from reloading the page.
    });
    isInitialized = true;
  }

  void start() {
    if (!isInitialized) {
      throw new Exception("World problems not initialized");
    }
  }

  void refreshPair() {
    getRandomPair().then((WorldProblemsPair pair) {
      updatePage(pair);
    });
  }

  Future<WorldProblemsPair> getRandomPair() {
    return fetcher.fetchRandom(firstProblemsHistory, thirdProblemsHistory).then(
        (WorldProblemsPair pair) {
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
