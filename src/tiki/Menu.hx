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
