import tiki.Button;
import tiki.Message;
import tiki.Nav;
import tiki.NavLink;

using thx.Nulls;

class Tiki {
  public inline static function message(children) return new Message(children);
  public inline static function button(children) return new Button(children);
  public inline static function nav(children: Array<NavLink>) return new Nav(children);
  public inline static function navLink(p : NavLinkProps, children) return new NavLink(p, children);
}
