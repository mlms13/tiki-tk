import tiki.Button;
import tiki.Menu;
import tiki.MenuItem;
import tiki.Message;
import tiki.Nav;
import tiki.NavLink;
import tiki.TkElement;
import dots.EventHandler;
import doom.core.VNodes;
using thx.Nulls;
import thx.Options;

class Tiki {
  public inline static function message(children: VNodes) return new Message(children);
  public inline static function button(children: VNodes) return new Button(children);
  public inline static function menu(children: Array<MenuItem>) return new Menu(children);
  public inline static function menuSeparator() return new MenuItem(Separator);
  public inline static function menuAction(children: VNodes, ?fn: EventHandler) return new MenuItem(Action(children, Options.ofValue(fn)));
  public inline static function menuLabel(children: VNodes) return new MenuItem(Label(children));
  public inline static function nav(children: Array<NavLink>) return new Nav(children);
  public inline static function navLink(p : NavLinkProps, children) return new NavLink(p, children);

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
