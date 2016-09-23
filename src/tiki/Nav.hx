package tiki;

import doom.html.Html;

class Nav extends doom.html.Component<NavProps> {
  override public function new(props: NavProps, children: Array<NavLink>) {
    super(props, children.map(function (c) {
      return Html.li(["class" => "nav-item"], c);
    }));
  }

  override function render() {
    return Html.nav(Html.ul(["class" => getClasses(classes(), props)], children));
  }

  static function getClasses(base: String, state: NavProps): String {
    var classes = [base];

    classes.push(switch state.style {
      case Tabs: "tabs";
      case Pills: "pills";
      case null, Default: "";
    });

    classes.push(switch state.orientation {
      case null, Inline: "inline";
      case Stacked: "stacked";
    });

    return classes.join(" ");
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

typedef NavProps = {
  ?style: NavStyle,
  ?orientation: NavOrientation
}
