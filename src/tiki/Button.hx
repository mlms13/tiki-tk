package tiki;

class Button extends doom.html.Component<ButtonProps> {
  override function render() {
    return doom.html.Html.button([
      "type" => "button",
      "class" => getClasses(props),
      "disabled" => props.disabled == true,
      "click" => props.click
    ], children);
  }

  static function getClasses(state : ButtonProps) : String {
    var classes = ["btn"];

    var styleClass = switch state.type {
      case Primary: "btn-primary";
      case Success: "btn-success";
      case Warning: "btn-warning";
      case Danger: "btn-danger";
      case null, Default: "";
    };

    if (state.hollow == true)
      styleClass += "-hollow";

    classes.push(styleClass);

    if (state.active == true)
      classes.push("active");

    if (state.disabled == true)
      classes.push("disabled");

    classes = classes.concat(switch state.size {
      case Large : ["btn-large"];
      case Small : ["btn-small"];
      case null, Default : [];
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

enum ButtonSize {
  Large;
  Small;
  Default;
}

typedef ButtonProps = {
  ?active : Bool,
  ?disabled : Bool,
  ?hollow : Bool,
  ?size : ButtonSize,
  ?type : ButtonType,
  click : Void -> Void // TODO: provide event and target?
}
