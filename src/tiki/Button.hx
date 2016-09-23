package tiki;

import haxe.ds.Option;
using thx.Options;
using thx.Objects;

class Button extends TikiElement<Button> {
  override function render() {
    setStringAttribute("type", "button");
    return doom.html.Html.button(attributes, children);
  }

  public function style(s: ButtonStyle) {
    return addClass(switch s {
      case Primary: "primary";
      case Success: "success";
      case Warning: "warning";
      case Danger: "danger";
    });
  }

  public function size(s: ButtonSize) {
    return addClass(switch s {
      case Small : "small";
      case Medium : "";
      case Large : "large";
    });
  }

  public function hollow()
    return addClass("hollow");
}

enum ButtonStyle {
  Primary;
  Success;
  Warning;
  Danger;
}

enum ButtonSize {
  Small;
  Medium;
  Large;
}
