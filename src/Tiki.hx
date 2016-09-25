import tiki.Button;
import tiki.Message;
import tiki.Nav;
import tiki.NavLink;
import tiki.TkElement;
import doom.core.VNodes;
using thx.Nulls;

class Tiki {
  public inline static function message(children: VNodes) return new Message(children);
  public inline static function button(children: VNodes) return new Button(children);
  public inline static function nav(p : NavProps, children : Array<NavLink>) return new Nav(p, children);
  public inline static function navLink(p : NavLinkProps, children: VNodes) return new NavLink(p, children);

  public inline static function h1(children: VNodes): Element return new Element("h1", children);
  public inline static function h2(children: VNodes): Element return new Element("h2", children);
  public inline static function h3(children: VNodes): Element return new Element("h3", children);
  public inline static function h4(children: VNodes): Element return new Element("h4", children);
  public inline static function h5(children: VNodes): Element return new Element("h5", children);
  public inline static function h6(children: VNodes): Element return new Element("h6", children);

  public inline static function article(children: VNodes): Element return new Element("article", children);
  public inline static function div(children: VNodes): Element return new Element("div", children);
  public inline static function p(children: VNodes): Element return new Element("p", children);
  public inline static function section(children: VNodes): Element return new Element("section", children);
}
