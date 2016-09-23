package tiki;

import doom.html.Html;

class Nav extends TikiElement<Nav> {
  public function new(children: Array<NavLink>) {
    super(children.map(function (c) {
      return Html.li(["class" => "nav-item"], c);
    }));
  }

  override function render() {
    return Html.nav(Html.ul(attributes, children));
  }

  public function style(s: NavStyle) {
    return addClass(switch s {
      case Tabs: "tabs";
      case Pills: "pills";
      case Default: "";
    });
  }

  public function orientation(o: NavOrientation) {
    return addClass(switch o {
      case Inline: "inline";
      case Stacked: "stacked";
    });
  }
}

enum NavStyle {
  Tabs;
  Pills;
  Default;
}

enum NavOrientation {
  Inline;
  Stacked;
}
