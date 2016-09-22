package tiki;

import doom.html.Html;

class Nav extends doom.html.Component<NavProps> {
  override public function new(props: NavProps, children: Array<NavLink>) {
    super(props, children.map(function (c) {
      return Html.li(["class" => "nav-item"], c);
    }));
  }

  override function render() {
    return Html.nav(Html.ul(["class" => getClasses(props)], children));
  }

  static function getClasses(state : NavProps) : String {
    var classes = ["nav"];

    classes.push(switch state.layout {
      case Inline: "nav-inline";
      case Stacked: "nav-stacked";
      case Tabs: "nav-tabs";
      case Pills: "nav-pills";
      case null, Default: "";
    });

    if (state.stacked == true) {
      classes.push("nav-stacked");
    }

    return classes.join(" ");
  }
}

enum NavLayout {
  Inline;
  Stacked;
  Tabs;
  Pills;
  Default;
}

typedef NavProps = {
  ?layout: NavLayout,
  ?stacked: Bool
}
