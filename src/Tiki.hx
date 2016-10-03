import tiki.*;
import tiki.Button;
import tiki.Menu;
import tiki.MenuItem;
import tiki.Message;
import tiki.Nav;
import tiki.NavLink;
import tiki.Table;
import tiki.TkElement;
import dots.EventHandler;
import doom.core.VNodes;
using thx.Nulls;
using thx.Options;
import thx.culture.Culture;

class Tiki {
  public static var defaultCulture: Culture = thx.culture.Embed.culture("en-us");

  public inline static function message(children: VNodes) return new Message(children);
  public inline static function button(children: VNodes) return new Button(children);
  public inline static function menu(children: Array<MenuItem>) return new Menu(children);
  public inline static function menuSeparator() return new MenuItem(Separator);
  public inline static function menuAction(children: VNodes, ?fn: EventHandler) return new MenuItem(Action(children, Options.ofValue(fn)));
  public inline static function menuLabel(children: VNodes) return new MenuItem(Label(children));
  public inline static function nav(children: Array<NavLink>) return new Nav(children);
  public inline static function navLink(p : NavLinkProps, children) return new NavLink(p, children);

  // Table Elements
  public static function table(?caption: TableCaption, ?thead: TableHead, ?tfoot: TableFoot, ?tbody: TableBody, ?tbodies: Array<TableBody>)
    return new Table({
      caption: Options.ofValue(caption),
      thead: Options.ofValue(thead),
      tfoot: Options.ofValue(tfoot),
      tbodies: Options.ofValue(tbody).toArray().concat(null == tbodies ? [] : tbodies)
    });

  public inline static function tcaption(children: VNodes) return new TableCaption(children);
  public inline static function tbody(rows: Array<TableRow>) return new TableBody(rows);
  public inline static function tfoot(rows: Array<TableRow>) return new TableFoot(rows);
  public inline static function thead(rows: Array<TableRow>) return new TableHead(rows);
  public inline static function tr(cells: Array<TableCell<Dynamic>>) return new TableRow(cells);
  public inline static function td(children: VNodes) return new TableDataCell(children);
  public inline static function th(children: VNodes) return new TableHeaderCell(children);
  // public inline static function cell(children: VNodes) return new Cell(TData(children));
  // public inline static function cellh(children: VNodes) return new Cell(THead(children));

  // Formatting Elements
  public inline static function num(value: Float, ?significantDigits: Int) return new Number({ value: value, format: thx.format.NumberFormat.number.bind(_, significantDigits, _), culture: defaultCulture });
  public inline static function int(value: Float, ?significantDigits: Int) return new Number({ value: value, format: thx.format.NumberFormat.integer, culture: defaultCulture });

  // Misc Elements
  public inline static function ribbon(children) return new Ribbon(children);

  // Keep? Remove? Make a class for each? group into common classes (eg. headers for h1,h2...) ?
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
