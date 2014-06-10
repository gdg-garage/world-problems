part of world_problems;

class ProblemView {
  Element text;
  Element author;
  AnchorElement sourceAnchor;

  ProblemView(Element el) {
    text = el.querySelector(".text");
    author = el.querySelector(".author");
    sourceAnchor = el.querySelector(".url");
  }

  void update(WorldProblem problem, {bool withTweening: false}) {
    if (!withTweening) {
      if (_timer != null) {
        _timer.cancel();
        _timer = null;
      }
      text.text = problem.text;
    } else {
      startRandomTextTweening(text.text, problem.text, false);
    }
    author.text = "– ${problem.author}"; // TODO: move mdash to HTML
    sourceAnchor.href = problem.url;
    sourceAnchor.text = problem.source;
  }

  static const Duration TWEENING_REFRESH_RATE = const Duration(milliseconds: 20
      );
  static const num TWEENING_STEP = 0.02;
  static const num TWEENING_KEEP_RUNNING_STOP = 0.5;
  Timer _timer;

  void startRandomTextTweening(String from, String to, bool keepRunning) {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    
    num progress = 0;
    _timer = new Timer.periodic(TWEENING_REFRESH_RATE, (Timer t) {
      text.text = interpolate(from, to, progress);
      if (keepRunning && progress < TWEENING_KEEP_RUNNING_STOP ||
          !keepRunning && progress < 1) {
        progress += TWEENING_STEP;
      }
      if (!keepRunning && progress >= 1) {
        text.text = to;
        t.cancel();
        _timer = null;
      }
    });
  }
}
