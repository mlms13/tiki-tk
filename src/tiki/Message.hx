package tiki;

import doom.html.Html.*;

class Message extends doom.html.Component<MessageProps> {
  override function render() {
    return div(["class" => getClasses(classes(), props)], children);
  }

  static function getClasses(base : String, state : MessageProps) : String {
    var classes = [base];

    return classes.join(" ");
  }
}

// role="alert" ?
// .alert-link ?
// support fading
// default color?
// success, info, warning, danger
// .uk-alert-large for larger spacing?
// big icons on the left: http://semantic-ui.com/collections/message.html
// floating http://semantic-ui.com/collections/message.html#floating
// compact http://semantic-ui.com/collections/message.html#floating
// attached http://semantic-ui.com/collections/message.html#attached
// colored http://semantic-ui.com/collections/message.html#colored
// size http://semantic-ui.com/collections/message.html#colored
typedef MessageProps = {
  ?dismissible : Bool,
  ?onDismiss : Void -> Void
}
