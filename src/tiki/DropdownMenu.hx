package tiki;

import doom.html.Html.*;

class DropdownMenu extends TkComponent<DropdownMenuState> {
  var button: TkElement<Dynamic>;
  var menu: Menu;
  var bodyElement: js.html.Element;

  public function new(props: DropdownMenuState, button: TkElement<Dynamic>, menu: Menu) {
    super(props, []);
    this.button = button;
    this.menu = menu;

    this.bodyElement = dots.Dom.create("div");
    js.Browser.document.body.appendChild(bodyElement);
    Doom.browser.mount(menu.render(), bodyElement);

    button.click(function () {
      props.isOpen = !props.isOpen;
      props.change(props.isOpen);
      update(props);
    });
  }

  override function didMount() {
    if (props.isOpen) {
      bodyElement.style.display = "block";
    } else {
      bodyElement.style.display = "none";
    }
  }

  override function didUpdate() {
    if (props.isOpen) {
      bodyElement.style.display = "block";
    } else {
      bodyElement.style.display = "none";
    }

    this.element.
  }

  override function willUnmount() {
    bodyElement.parentNode.removeChild(bodyElement);
  }

  override function render(): doom.core.VNode {
    return button;
    // return props.isOpen ?
    //   div([button.render(), menu.render()]) :
    //   button.render();
  }
}

typedef DropdownMenuState = {
  isOpen: Bool,
  change: Bool -> Void
};
