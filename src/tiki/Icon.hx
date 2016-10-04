package tiki;

class Icon extends TkEmptyElement<Icon> {
  public function new(iconClass: String) {
    super('i');
    addClass(iconClass);
  }
}
