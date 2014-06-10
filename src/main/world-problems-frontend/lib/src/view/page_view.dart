part of world_problems;

class PageView {
  final Element reload;
  final ProblemView first;
  final ProblemView third;
  PageView(this.reload, Element firstElement, Element thirdElement)
      : first = new ProblemView(firstElement),
        third = new ProblemView(thirdElement);

  void update(WorldProblemsPair pair) {
    first.update(pair.firstProblem, withTweening: true);
    third.update(pair.thirdProblem, withTweening: true);
  }

  /// Will start tweening text of both problems to a random string. This
  /// continues until [update] is called (with new [WorldProblemsPair]).
  void startReloadTweening() {
    _startReloadProblemViewTween(first);
    _startReloadProblemViewTween(third);
  }

  static final int SPACE_CHAR = " ".runes.single;
  static final List<int> LETTERS = "abcdefghijklmnopqrstuvwxyz".runes.toList(
      growable: false);
  static final Random _random = new Random();

  void _startReloadProblemViewTween(ProblemView view) {
    StringBuffer random = new StringBuffer();
    String from = view.text.text;
    from.runes.forEach((int char) {
      if (char == SPACE_CHAR) {
        random.writeCharCode(SPACE_CHAR);
      } else {
        random.writeCharCode(LETTERS[_random.nextInt(LETTERS.length)]);
      }
    });
    view.startRandomTextTweening(from, random.toString(), true);
  }
}
