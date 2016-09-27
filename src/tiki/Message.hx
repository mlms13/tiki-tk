package tiki;

import doom.html.Html.*;
import js.html.Element;
import js.html.Event;
using thx.Objects;
import dots.Dom;
import dots.EventHandler;
import dots.Query;
import tiki.TkElement;

class Message extends TkElement<Message> {
  public function new(children) {
    super("div", children);
    setStringAttribute("role", "message");
  }

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
        .click(fn)
        .render()
    );
}

enum MessageStyle {
  Info;
  Success;
  Warning;
  Danger;
}
