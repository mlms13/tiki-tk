package tiki;

class NavLink extends doom.html.Component<NavLinkProps> {

  override function render() {
    return doom.html.Html.a([
      "class" => getClasses(classes(), props),
      "href" => props.href
    ], children);
  }

  static function getClasses(base: String,  state: NavLinkProps): String {
    var classes = [base];

    if (state.active == true)
      classes.push("active");

    if (state.disabled == true)
      classes.push("disabled");

    return classes.join(" ");
  }
}

typedef NavLinkProps = {
  ?active: Bool,
  ?disabled: Bool,
  ?href: String,
  ?click: Void -> Void
}
