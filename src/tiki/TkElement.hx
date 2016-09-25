package tiki;

class TkElement<ElementType: TkElement<ElementType>> extends doom.html.Element<ElementType> {
  public function active()
    return addClass("active");
}

class Element extends TkElement<Element> {}
