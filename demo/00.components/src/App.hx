import doom.core.VNode;
import doom.core.VNodes;
import Tiki.*;
import js.Browser.*;
import thx.format.NumberFormat.integer;
import thx.format.NumberFormat.fixed;

class App extends doom.html.Component<{}> {
  override function render(): VNode {
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
        inlineExample([button("Default")]),
        inlineExample([button("Primary").style(Primary)]),
        inlineExample([button("Success").style(Success)]),
        inlineExample([button("Warning").style(Warning)]),
        inlineExample([button("Danger").style(Danger)]),
      ]),
      demoSection("Hollow Buttons", [
        inlineExample([button("Default").hollow()]),
        inlineExample([button("Primary").style(Primary).hollow()]),
        inlineExample([button("Success").style(Success).hollow()]),
        inlineExample([button("Warning").style(Warning).hollow()]),
        inlineExample([button("Danger").style(Danger).hollow()]),
      ]),
      demoSection("Disabled Buttons", [
        inlineExample([button("Default").disabled()]),
        inlineExample([button("Primary").style(Primary).disabled()]),
        inlineExample([button("Success").style(Success).disabled()]),
        inlineExample([button("Warning").style(Warning).disabled()]),
        inlineExample([button("Danger").style(Danger).disabled()]),
      ]),
      demoSection("Basic Nav", [
        nav({ orientation: Inline }, [
          navLink({ href: "#" }, "Foo"),
          navLink({ href: "#" }, "Bar"),
          navLink({ href: "#" }, "Baz")
        ])
      ]),
      demoSection("Nav Pills", [
        nav({ style: Pills }, [
          navLink({ href: "#" }, "Foo"),
          navLink({ href: "#" }, "Bar"),
          navLink({ href: "#" }, "Baz")
        ])
      ]),
      demoSection("Nav Tabs", [
        nav({ style: Tabs }, [
          navLink({ href: "#" }, "Foo"),
          navLink({ href: "#" }, "Bar"),
          navLink({ href: "#" }, "Baz")
        ])
      ]),
      demoSection("Nav Stacked", [
        nav({ orientation: Stacked}, [
          navLink({ href: "#" }, "Foo"),
          navLink({ href: "#" }, "Bar"),
          navLink({ href: "#" }, "Baz")
        ])
      ]),
      demoSection("Messages", [
        message(["Default message"]),
        message(["Info message"]).style(Info),
        message(["Success message"]).style(Success),
        message(["Warning message"]).style(Warning),
        message(["Danger message with dismissible"]).style(Danger).dismissible(function() console.log("message closed"))
      ]),
      demoSection("Tables", [
        table(tableContent())
          .column(function(r): VNodes return "X")
            .emptyHeader()
            .header("X")
          .column(function(r): VNodes return r.city)
            .emptyHeader().rowspan(2)
          .column(function(r): VNodes return r.state)
            .emptyHeader()
            .header("state")
          .column(function(r): VNodes return integer(r.population))
            .header("numbers").colspan(2)
            .header("population")
          .column(function(r): VNodes return fixed(r.landArea, 1))
            .noHeader()
            .header("area")
      ])
    ]);
  }

  function demoSection(title: String, children: VNodes) {
    return section([
      h2(title).addClass("section-title"),
      div(children).addClass("section-body")
    ]).addClass("demo-section");
  }

  function inlineExample(children: VNodes) {
    return div(children).addClass("example-inline");
  }

  function fillerText() {
    return p("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean
              sed hendrerit libero, et tempor orci. Nam facilisis neque at diam
              blandit, vitae lacinia erat imperdiet.");
  }

  static function tableContent() return [
    {
      city: "Seattle",
      state: "WA",
      population: 652405,
      landArea: 83.9
    },
    {
      city: "New York",
      state: "NY",
      population: 8405837,
      landArea: 302.6
    },
    {
      city: "Boston",
      state: "MA",
      population: 645966,
      landArea: 48.3
    },
    {
      city: "Kansas City",
      state: "MO",
      population: 467007,
      landArea: 315
    }
  ];
}
