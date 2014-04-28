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
  
  void update(WorldProblem problem) {
    text.text = problem.text;
    author.text = "– ${problem.author}";  // TODO: move mdash to HTML
    sourceAnchor.href = problem.url;
    sourceAnchor.text = problem.source;
  }
}