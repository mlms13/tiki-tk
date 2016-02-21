package tiki;

class Button extends Doom {
  // TODO: api click
  @:state(Default) var type : ButtonType;
  // TODO: hollow
  // TODO: sizes
  // TODO: active
  // TODO: disabled

  override function render() {
    return Doom.button([
      "type" => "button",
      "class" => getClasses()
    ], children);
  }

  function getClasses() : String {
    var classes = ["btn"];

    classes.push(switch type {
      case Primary: "btn-primary";
      case Success: "btn-success";
      case Warning: "btn-warning";
      case Danger: "btn-danger";
      case Default: "";
    });

    return classes.join(" ");
  }
}

enum ButtonType {
  Default;
  Primary;
  Success;
  Warning;
  Danger;
}
