package tiki;

class TkElement<ElementType: TkElement<ElementType>> extends doom.html.Element<ElementType> {}

class Element extends TkElement<Element> {}
