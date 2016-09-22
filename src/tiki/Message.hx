package tiki;

import doom.html.Html.*;
using thx.Objects;

class Message extends doom.html.Component<MessageProps> {
  override function render() {
    if(props.closed)
      return dummy();
    var prefix = if(props.dismissible == true) {
      [
        button(["type" => "button", "class" => "close", "aria-label" => "Close", "click" => close], [
          span(["aria-hidden" => true], "×")
        ])
      ];
    } else {
      [];
    }
    return div(["class" => getClasses(classes(), props)], prefix.concat(children));
  }

  function close() {
    update(props.with(closed, true));
  }

  static function getClasses(base: String, state: MessageProps): String {
    var classes = [base];
    switch state.type {
      case Info: classes.push("info");
      case Success: classes.push("success");
      case Danger: classes.push("danger");
      case Warning: classes.push("warning");
      case null, Default: // nothing
    };

    return classes.join(" ");
  }
}

// role="alert" ?
// .alert-link ?
// support fading
// .uk-alert-large for larger spacing?
// big icons on the left: http://semantic-ui.com/collections/message.html
// floating http://semantic-ui.com/collections/message.html#floating
// compact http://semantic-ui.com/collections/message.html#floating
// attached http://semantic-ui.com/collections/message.html#attached
// colored http://semantic-ui.com/collections/message.html#colored
// size http://semantic-ui.com/collections/message.html#colored
typedef MessageProps = {
  ?closed: Bool,
  ?type: MessageType,
  ?dismissible: Bool,
  ?onDismiss: Void -> Void
}

enum MessageType {
  Default;
  Info;
  Success;
  Warning;
  Danger;
}
