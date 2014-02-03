import "dart:html";

main() {
  Element reload = querySelector("#reload");
  reload.onClick.listen((_) {
    print("Hi");
  });
  
  
}


