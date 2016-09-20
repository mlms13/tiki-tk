package tiki;

class Button extends doom.html.Component<ButtonProps> {
  override function render() {
    return doom.html.Html.button([
      "type" => "button",
      "class" => getClasses(classes(), props),
      "disabled" => props.disabled == true,
      "click" => props.click
    ], children);
  }

  static function getClasses(base : String, state : ButtonProps) : String {
    var classes = [base];

    var styleClass = switch state.type {
      case Primary: "primary";
      case Success: "success";
      case Warning: "warning";
      case Danger: "danger";
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
      case Large : ["large"];
      case Small : ["small"];
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
