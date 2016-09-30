package tiki;

class TkEmptyElement<ElementType: TkEmptyElement<ElementType>> extends doom.html.EmptyElement<ElementType> {

}

class EmptyElement extends TkEmptyElement<EmptyElement> {}
