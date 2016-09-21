import tiki.Button;
import tiki.Message;
import tiki.Nav;
import tiki.NavLink;

using thx.Nulls;

class Tiki {
  public inline static function button(p : ButtonProps, children) return new Button(p, children);
  public inline static function message(?p : MessageProps, children) return new Message(p.or({}), children);
  public inline static function nav(p : NavProps, children : Array<NavLink>) return new Nav(p, children);
  public inline static function navLink(p : NavLinkProps, children) return new NavLink(p, children);
}
