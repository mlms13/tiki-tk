package tiki;

import doom.core.AttributeValue;
import doom.core.VNodes;
import dots.EventHandler;
import js.html.Event;

class TikiElement<ElementType: TikiElement<Dynamic, T>, T> extends doom.html.Component<T> {
  var attributes: Map<String, AttributeValue>;

  public function new(props, attributes, children) {
    super(props, children);
    this.attributes = attributes;
    setStringAttribute("class", classes());
  }

  inline function self(): ElementType
    return cast this;

  public function setBoolAttribute(name, val: Bool): ElementType {
    attributes.set(name, val);
    return self();
  }

  public function enableAttribute(name): ElementType
    return setBoolAttribute(name, true);

  public function disableAttribute(name): ElementType
    return setBoolAttribute(name, false);

  public function setStringAttribute(name, val: String): ElementType {
    attributes.set(name, val);
    return self();
  }

  public function appendStringAttribute(name, val: String): ElementType {
    return switch attributes.get(name) {
      case null, BoolAttribute(_), EventAttribute(_): setStringAttribute(name, val);
      case StringAttribute(s): setStringAttribute(name, s + " " + val);
    };
  }

  public function setEventAttribute(name, val: EventHandler) {
    attributes.set(name, EventAttribute(val.toCallback()));
    return self();
  }

  public function appendEventAttribute(name, fn: EventHandler) {
    return switch attributes.get(name) {
      case null, BoolAttribute(_), StringAttribute(_): setEventAttribute(name, fn);
      case EventAttribute(f): setEventAttribute(name, function(e : Event) {
        f(cast e);
        fn(cast e);
      });
    };
  }

  public function click(fn: EventHandler)
    return appendEventAttribute("click", fn);

  public function ariaLabel(value: String)
    return setStringAttribute("aria-label", value);

  public function role(value: String)
    return setStringAttribute("role", value);

  public function addClass(c: String): ElementType
    return appendStringAttribute("class", c);

  public function active()
    return addClass("active");

  public function disabled()
    return enableAttribute("disabled");

  public function prepend(children: VNodes)
    return setChildren(children.concat(this.children));

  public function append(children: VNodes)
    return setChildren(this.children.concat(children));

  public function setChildren(children: VNodes) {
    this.children = children;
    return self();
  }
}
