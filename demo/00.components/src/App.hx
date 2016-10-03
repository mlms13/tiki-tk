import doom.core.VNode;
import doom.core.VNodes;
import Tiki.*;
import tiki.DropdownMenu; // TODO: move this to Tiki.*
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
        nav([
          navLink({ href: "#" }, "Foo"),
          navLink({ href: "#" }, "Bar"),
          navLink({ href: "#" }, "Baz")
        ]).orientation(Inline)
      ]),
      demoSection("Nav Tabs", [
        nav([
          navLink({ active: true, href: "#" }, "Foo"),
          navLink({ href: "#" }, "Bar"),
          navLink({ href: "#" }, "Baz")
        ]).orientation(Inline).style(Tabs)
      ]),
      demoSection("Nav Pills", [
        nav([
          navLink({ href: "#" }, "Foo"),
          navLink({ active: true, href: "#" }, "Bar"),
          navLink({ href: "#" }, "Baz")
        ]).orientation(Inline).style(Pills)
      ]),
      demoSection("Nav Stacked", [
        nav([
          navLink({ href: "#" }, "Foo"),
          navLink({ href: "#" }, "Bar"),
          navLink({ active: true, href: "#" }, "Baz")
        ]).orientation(Stacked).style(Pills)
      ]),
      demoSection("Messages", [
        message(["Default message"]),
        message(["Info message"]).info(),
        message(["Success message"]).success(),
        message(["Success message hollow"]).success().hollow(),
        message(["Success message contrast"]).success().contrast(),
        message(["Success message inverted"]).success().inverted(),
        message(["Success message inverted / contrast"]).success().inverted().contrast(),
        message(["Success message hollow / contrast"]).success().hollow().contrast(),
        message(["Warning message"]).warning(),
        message(["Danger message with dismissible"]).danger().dismissible(function() console.log("message closed"))
      ]),
      demoSection("Tables", [
        table(
          tcaption("some caption here"),
          thead([
            tr([
              th([]).colspan(2),
              th("numbers").center().colspan(2)]),
            tr([th("city"),
              th("state").center(),
              th("population").right(),
              th("land area").right()])
          ]),
          tfoot([
            tr([
              th([]),
              th("totals:").right(),
              th(int(10171215)).right(),
              th(num(749.8, 1)).right()])
          ]),
          tbody([
            tr([
              th(ribbon("Seattle")),
              td("WA").center(),
              td(int(652405)).right(),
              td(num(83.9, 1)).right()]),
            tr([
              th("New York").success().contrast().inverted(),
              td("NY").center(),
              td(int(8405837)).right().warning(),
              td(num(302.6, 1)).right()]),
            tr([
              th("Boston"),
              td("MA").center(),
              td(int(645966)).right(),
              td(num(48.3, 1)).right().danger()]),
            tr([
              th("Kansas City"),
              td("MO").center(),
              td(int(467007)).right().info(),
              td(num(315.0, 1)).right()]),
          ])
        ),
        table(
          tbody([
            tr([
              th("Seattle"),
              td("WA").center(),
              td(int(652405)).right(),
              td(num(83.9, 1)).right()]),
            tr([
              th("New York"),
              td("NY").center(),
              td(int(8405837)).right(),
              td(num(302.6, 1)).right()]),
            tr([
              th("Boston").hollow().danger(),
              td("MA").center(),
              td(int(645966)).right(),
              td(num(48.3, 1)).right()]),
            tr([
              th("Kansas City"),
              td("MO").center(),
              td(int(467007)).right(),
              td(num(315.0, 1)).right()]),
          ])
        ),
        table(
          thead([
            tr([
              th("city"),
              th("state").center(),
              th("population").right(),
              th("land area").right()])
          ]),
          tfoot([
            tr([
              th([]),
              th("totals:").right(),
              th(int(10171215)).right(),
              th(num(749.8, 1)).right()])
          ]),
          tbody([
            tr([th("Seattle"),     td("WA").center(), td(int(652405)).right(),  td(num(83.9, 1)).right()]),
            tr([th("New York"),    td(ribbon("NY")).center(), td(int(8405837)).right(), td(num(302.6, 1)).right()]),
            tr([th("Boston"),      td("MA").center(), td(int(645966)).right(),  td(num(48.3, 1)).right()]),
            tr([th("Kansas City"), td("MO").center(), td(int(467007)).right(),  td(num(315.0, 1)).right()]),
          ])
        ).collapsing(),
        table(
          thead([
            tr([th("city"), th("state").center(), th("population").right(), th("land area").right()])
          ]),
          tfoot([
            tr([th([]), th("totals:").right(), th(int(10171215)).right(), th(num(749.8, 1)).right()])
          ]),
          tbody([
            tr([th("Seattle"),     td("WA").center(), td(int(652405)).right(),  td(num(83.9, 1)).right()]),
            tr([th("New York"),    td("NY").center(), td(int(8405837)).right(), td(num(302.6, 1)).right()]),
            tr([th("Boston"),      td("MA").center(), td(int(645966)).right(),  td(num(48.3, 1)).right()]),
            tr([th("Kansas City"), td("MO").center(), td(int(467007)).right(),  td(num(315.0, 1)).right()]),
          ])
        ).collapsing().frameless(),
        table(
          thead([
            tr([th("city"), th("state").center(), th("population").right(), th("land area").right()])
          ]),
          tfoot([
            tr([th([]), th("totals:").right(), th(int(10171215)).right(), th(num(749.8, 1)).right()])
          ]),
          tbody([
            tr([th("Seattle"),     td("WA").center(), td(int(652405)).right(),  td(num(83.9, 1)).right()]),
            tr([th("New York"),    td("NY").center(), td(int(8405837)).right(), td(num(302.6, 1)).right()]),
            tr([th("Boston"),      td("MA").center(), td(int(645966)).right(),  td(num(48.3, 1)).right()]),
            tr([th("Kansas City"), td("MO").center(), td(int(467007)).right(),  td(num(315.0, 1)).right()]),
          ])
        ).collapsing().frameless().plain(),
        table(
          thead([
            tr([th("city"), th("state").center(), th("population").right(), th("land area").right()])
          ]),
          tbody([
            tr([th("Seattle"),     td("WA").center(), td(int(652405)).right(),  td(num(83.9, 1)).right()]),
            tr([th("New York"),    td("NY").center(), td(int(8405837)).right().success(), td(num(302.6, 1)).right()]),
            tr([th("Boston"),      td("MA").center(), td(int(645966)).right(),  td(num(48.3, 1)).right()]),
            tr([th("Kansas City"), td("MO").center(), td(int(467007)).right(),  td(num(315.0, 1)).right()]),
          ])
        ).collapsing().frameless().plain().compact(),
        table(
          thead([
            tr([th("city"), th("state").center(), th("population").right(), th("land area").right()])
          ]),
          tbody([
            tr([th("Seattle"),     td("WA").center(), td(int(652405)).right(),  td(num(83.9, 1)).right()]),
            tr([th("New York"),    td("NY").center(), td(int(8405837)).right().success(), td(num(302.6, 1)).right()]),
            tr([th("Boston"),      td("MA").center(), td(int(645966)).right(),  td(num(48.3, 1)).right()]),
            tr([th("Kansas City"), td("MO").center(), td(int(467007)).right(),  td(num(315.0, 1)).right()]),
          ])
        ).danger()
      ]),
      demoSection("Menu", [
        menu([
          menuLabel(h6("Heading")),
          menuAction("Open...", function () {}),
          menuAction("Save As...").disabled(),
          menuSeparator(),
          menuAction("Exit", function () {js.Browser.window.close(); })
        ])
      ]),
      demoSection("Dropdown Menu", [
        new DropdownMenu({ isOpen: false, change: function (_) {} },
          button("Click me please!"),
          menu([
            menuLabel(h6("Heading")),
            menuAction("Open...", function () {}),
            menuAction("Save As...").disabled(),
            menuSeparator(),
            menuAction("Exit", function () {js.Browser.window.close(); })
        ]))
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
}
