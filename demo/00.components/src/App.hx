import doom.core.VChild;
import doom.core.VChildren;
import doom.html.Html.*;
import Tiki.*;
import tiki.Button;

class App extends doom.html.Component<{}> {
  override function render() {
    return article([
      demoSection("Typography", [
        h1("h1 heading"),
        fillerText(),
        h2("h2 heading"),
        fillerText(),
        h3("h3 heading"),
        fillerText(),
        h4("h4 heading"),
        fillerText(),
        h5("h5 heading"),
        fillerText(),
        h6("h6 heading"),
        fillerText(),
      ]),
      demoSection("Buttons", [
        inlineExample([button({
          type: Default,
          click: function () {}
        }, "Default")]),
        inlineExample([button({
          type: Primary,
          click: function () {}
        }, "Primary")]),
        inlineExample([button({
          type: Success,
          click: function () {}
        }, "Success")]),
        inlineExample([button({
          type: Warning,
          click: function () {}
        }, "Warning")]),
        inlineExample([button({
          type: Danger,
          click: function () {}
        }, "Danger")]),
      ])
    ]);
  }

  function demoSection(title : String, children : VChildren) : VChild {
    return section([
      "class" => "demo-section"
    ], [
      h2([ "class" => "section-title" ], title),
      div([ "class" => "section-body" ], children)
    ]);
  }

  function inlineExample(children : VChildren) : VChild {
    return div([ "class" => "example-inline"], children);
  }

  function fillerText() : VChild {
    return p("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean
              sed hendrerit libero, et tempor orci. Nam facilisis neque at diam
              blandit, vitae lacinia erat imperdiet.");
  }
}
