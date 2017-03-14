package tiki;

class TkElement<ElementType: TkElement<ElementType>> extends doom.html.Element<ElementType> {
  // sizes
  public function mini()
    return addNSClass("size", "mini");
  public function tiny()
    return addNSClass("size", "tiny");
  public function small()
    return addNSClass("size", "small");
  public function medium()
    return addNSClass("size", "medium");
  public function large()
    return addNSClass("size", "large");
  public function big()
    return addNSClass("size", "big");
  public function huge()
    return addNSClass("size", "huge");
  public function massive()
    return addNSClass("size", "massive");

  // alignments
  public function left()
    return addNSClass("align", "left");
  public function right()
    return addNSClass("align", "right");
  public function center()
    return addNSClass("align", "center");
  public function justify()
    return addNSClass("align", "justify");
  public function justifyAll()
    return addNSClass("align", "justify-all");
  public function start()
    return addNSClass("align", "start");
  public function end()
    return addNSClass("align", "end");
  public function matchParent()
    return addNSClass("align", "match-parent");

  public function baseline()
    return addNSClass("valign", "baseline");
  public function sub()
    return addNSClass("valign", "sub");
  public function super()
    return addNSClass("valign", "super");
  public function textTop()
    return addNSClass("valign", "text-top");
  public function textBottom()
    return addNSClass("valign", "text-bottom");
  public function middle()
    return addNSClass("valign", "middle");
  public function top()
    return addNSClass("valign", "top");
  public function bottom()
    return addNSClass("valign", "bottom");
}

class Element extends TkElement<Element> {}
