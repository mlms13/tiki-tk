package tiki;

import doom.html.Html.*;
import js.html.Element;
import js.html.Event;
using thx.Objects;
import dots.Dom;
import dots.EventHandler;
import dots.Query;
import tiki.TikiElement;

class Message extends TikiElement<Message> {
  public function new(children) {
    super(children);
    setStringAttribute("role", "message");
  }

  override function render()
    return div(attributes, children);

  public function style(st: MessageStyle)
    return addClass(switch st {
      case Info:    "info";
      case Success: "success";
      case Danger:  "danger";
      case Warning: "warning";
    });

  public function dismissible(fn: EventHandler)
    return prepend(
      Tiki.button(span(["aria-hidden" => true], "×"))
        .addClass("close")
        .ariaLabel("Close")
        .click(close(selector(), fn))
        .render()
    );

  static function close(refClass: String, fn: EventHandler) {
    return function(e: Event) {
      e.preventDefault();
      var message = Query.closest(cast e.target, refClass);
      Dom.remove(message);
      fn(e);
    };
  }
}

enum MessageStyle {
  Info;
  Success;
  Warning;
  Danger;
}
