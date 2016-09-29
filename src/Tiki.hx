import tiki.Button;
import tiki.Message;
import tiki.Nav;
import tiki.NavLink;
import tiki.Table;
import tiki.TkElement;
import doom.core.VNodes;
using thx.Nulls;
using thx.Options;

class Tiki {
  public inline static function message(children: VNodes) return new Message(children);
  public inline static function button(children: VNodes) return new Button(children);
  public inline static function nav(p : NavProps, children : Array<NavLink>) return new Nav(p, children);
  public inline static function navLink(p : NavLinkProps, children: VNodes) return new NavLink(p, children);

  public static function table(?caption: TableCaption, ?colgroup: ColGroup, ?colgroups: Array<ColGroup>, ?thead: TableHead, ?tfoot: TableFoot, ?tbody: TableBody, ?tbodies: Array<TableBody>)
    return new Table({
      caption: Options.ofValue(caption),
      colgroups: Options.ofValue(colgroup).toArray().concat(null == colgroups ? [] : colgroups),
      thead: Options.ofValue(thead),
      tfoot: Options.ofValue(tfoot),
      tbodies: Options.ofValue(tbody).toArray().concat(null == tbodies ? [] : tbodies)
    });
    
  public inline static function tcaption() return new TableCaption();
  public inline static function colgroup() return new ColGroup();
  public inline static function tbody() return new TableBody();
  public inline static function tfoot() return new TableFoot();
  public inline static function thead() return new TableHead();
  // public inline static function cell(children: VNodes) return new Cell(TData(children));
  // public inline static function cellh(children: VNodes) return new Cell(THead(children));

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
