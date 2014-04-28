part of world_problems;

class PageView {
  final Element reload;
  final ProblemView first;
  final ProblemView third;
  PageView(this.reload, Element firstElement, Element thirdElement) :
    first = new ProblemView(firstElement),
    third = new ProblemView(thirdElement);
  
  
  void update(WorldProblemsPair pair) {
    first.update(pair.firstProblem);
    third.update(pair.thirdProblem);
  }
}