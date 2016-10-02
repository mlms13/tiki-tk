package tiki;

import doom.core.VNodes;
import doom.html.Html;
using thx.Functions;

class Menu extends TkElement<Menu> {
  public function new(children: Array<MenuItem>) {
    super("ul", children.map.fn((_: doom.core.VNode)));
  }

  public function addItem(item: MenuItem) {
    return append(item);
  }
}

class MenuItem extends TkElement<MenuItem> {
  public function new(item: MenuItemKind) {
    super("li", []);
    switch item {
      case Separator:
        addNSClass("menu", "separator");
      case Action(v, Some(f)):
        addNSClass("menu", "action");
        append(v);
        click(f);
      case Action(v, None):
        addNSClass("menu", "action");
        append(v);
        addClass("disabled");
      case Label(v):
        addNSClass("menu", "label");
        append(v);
    }
  }
}

enum MenuItemKind {
  Separator;
  Action(content: VNodes, action: haxe.ds.Option<dots.EventHandler>);
  Label(content: VNodes);
}
