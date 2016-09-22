package tiki;

import doom.core.AttributeValue;

class TikiElement<ElementType: TikiElement<Dynamic, T>, T> extends doom.html.Component<T> {
  var attributes: Map<String, AttributeValue>;

  public function new(props, attributes, children) {
    super(props, children);
    this.attributes = attributes;
    setStringAttribute("class", classes());
  }

  inline function self(): ElementType
    return cast this;

  // public function attribute(key, val): ElementType {
  //   attributes.set(key, val);
  //   return self();
  // }

  public function boolAttribute(key, val: Bool): ElementType {
    attributes.set(key, val);
    return self();
  }

  public function enableAttribute(key): ElementType
    return boolAttribute(key, true);

  public function disableAttribute(key): ElementType
    return boolAttribute(key, false);

  public function setStringAttribute(key, val: String): ElementType {
    attributes.set(key, val);
    return self();
  }

  public function appendStringAttribute(key, val: String): ElementType {
    var prev = attributes.get(key);

    return switch prev {
      case null, BoolAttribute(_), EventAttribute(_): setStringAttribute(key, val);
      case StringAttribute(s): setStringAttribute(key, s + " " + val);
    };
  }

  public function addClass(c: String): ElementType
    return appendStringAttribute("class", c);

  public function active()
    return addClass("active");

  public function disabled()
    return enableAttribute("disabled");

  // TODO: add `appendChildren`, `setChildren`, `addChild`
}
