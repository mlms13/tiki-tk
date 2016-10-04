package tiki;

class TkEmptyElement<ElementType: TkEmptyElement<ElementType>> extends doom.html.EmptyElement<ElementType> {
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
}

class EmptyElement extends TkEmptyElement<EmptyElement> {}
