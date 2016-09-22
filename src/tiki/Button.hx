package tiki;

import haxe.ds.Option;
using thx.Options;
using thx.Objects;

class Button extends doom.html.Component<ButtonProps> {
  override function render() {
    return doom.html.Html.button([
      "type" => "button",
      "class" => getClasses(classes(), props),
      "disabled" => props.disabled,
      "click" => props.click.get()
    ], children);
  }

  static function getClasses(base : String, state : ButtonProps) : String {
    var classes = [base];

    var styleClass = switch state.style {
      case Primary: "primary";
      case Success: "success";
      case Warning: "warning";
      case Danger: "danger";
      case Default: "default";
    };

    if (state.hollow == true)
      styleClass += "-hollow";

    classes.push(styleClass);

    if (state.active == true)
      classes.push("active");

    classes = classes.concat(switch state.size {
      case Small : ["small"];
      case Medium : [];
      case Large : ["large"];
    });

    return classes.join(" ");
  }

  public function style(s: ButtonStyle)
    return new Button(props.with(style, s), children);

  public function size(s: ButtonSize)
    return new Button(props.with(size, s), children);

  public function hollow()
    return new Button(props.with(hollow, true), children);

  public function active()
    return new Button(props.with(active, true), children);

  public function disabled()
    return new Button(props.with(disabled, true), children);

  public function click(fn: Void -> Void)
    return new Button(props.with(click, Some(fn)), children);
}

enum ButtonStyle {
  Default;
  Primary;
  Success;
  Warning;
  Danger;
}

enum ButtonSize {
  Small;
  Medium;
  Large;
}

typedef ButtonProps = {
  active: Bool,
  disabled: Bool,
  hollow: Bool,
  size: ButtonSize,
  style: ButtonStyle,
  click: Option<Void -> Void>
}
