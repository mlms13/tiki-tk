package tiki;

class BoxElement<ElementType: BoxElement<ElementType>> extends TkElement<ElementType> {
  public function info()
    return addClass("styled info");

  public function success()
    return addClass("styled success");

  public function danger()
    return addClass("styled danger");

  public function warning()
    return addClass("styled warning");

  public function contrast()
    return addClass("contrast");

  public function inverted()
    return addClass("inverted");

  public function hollow()
    return addClass("hollow");

  public function spacer()
    return addClass("spacer");
}
