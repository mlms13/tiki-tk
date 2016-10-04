package tiki;

import haxe.ds.Option;
using thx.Options;
using thx.Objects;

class Button extends TkElement<Button> {
  public function new(children) {
    super("button", children);
    setStringAttribute("type", "button");
  }

  public function primary()
    return addNSClass("style", "primary");
  public function success()
    return addNSClass("style", "success");
  public function warning()
    return addNSClass("style", "warning");
  public function danger()
    return addNSClass("style", "danger");

  public function hollow()
    return addClass("hollow");

  public function compact()
    return addClass("compact");
}
