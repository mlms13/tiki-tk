package tiki;

class BoxElement<ElementType: BoxElement<ElementType>> extends TkElement<ElementType> {
  public function style(st: BoxStyle)
    return addClass(switch st {
      case Info:    "info";
      case Success: "success";
      case Danger:  "danger";
      case Warning: "warning";
    });

  public function contrast()
    return addClass("contrast");

  public function inverted()
    return addClass("inverted");

  public function hollow()
    return addClass("hollow");

  public function spacer()
    return addClass("spacer");
}
