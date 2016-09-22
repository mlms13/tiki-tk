import tiki.Button;
import tiki.Nav;
import tiki.NavLink;

class Tiki {
  public inline static function button(children) return new Button({
    active: false,
    disabled: false,
    hollow: false,
    size: Medium,
    style: Default,
    click: None
  }, children);
  public inline static function nav(p : NavProps, children : Array<NavLink>) return new Nav(p, children);
  public inline static function navLink(p : NavLinkProps, children) return new NavLink(p, children);
}
