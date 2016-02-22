import Doom.*;
import doom.Node;
import Tiki.*;
import tiki.Button;

class App extends Doom {
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
        inlineExample([button({ type: Default }, "Default")]),
        inlineExample([button({ type: Primary }, "Primary")]),
        inlineExample([button({ type: Success }, "Success")]),
        inlineExample([button({ type: Warning }, "Warning")]),
        inlineExample([button({ type: Danger }, "Danger")]),
      ])
    ]);
  }

  function demoSection(title : String, children : Array<Node>) : Node {
    return section([
      "class" => "demo-section"
    ], [
      h2([ "class" => "section-title" ], title),
      div([ "class" => "section-body" ], children)
    ]);
  }

  function inlineExample(children : Array<Node>) : Node {
    return div([ "class" => "example-inline"], children);
  }

  function fillerText() : Node {
    return p("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean
              sed hendrerit libero, et tempor orci. Nam facilisis neque at diam
              blandit, vitae lacinia erat imperdiet.");
  }
}
