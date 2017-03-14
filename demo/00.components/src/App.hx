import doom.core.VNode;
import doom.core.VNodes;
import tiki.FontAwesome.*;
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
        inlineExample([button("Primary").primary()]),
        inlineExample([button("Success").success()]),
        inlineExample([button("Warning").warning()]),
        inlineExample([button("Danger").danger()]),
      ]),
      demoSection("Hollow Buttons", [
        inlineExample([button("Default").hollow()]),
        inlineExample([button("Primary").primary().hollow()]),
        inlineExample([button("Success").success().hollow()]),
        inlineExample([button("Warning").warning().hollow()]),
        inlineExample([button("Danger").danger().hollow()]),
      ]),
      demoSection("Disabled Buttons", [
        inlineExample([button("Default").disabled()]),
        inlineExample([button("Primary").primary().disabled()]),
        inlineExample([button("Success").success().disabled()]),
        inlineExample([button("Warning").warning().disabled()]),
        inlineExample([button("Danger").danger().disabled()]),
      ]),
      demoSection("Button Sizes", [
        inlineExample([button("mini").mini()]),
        inlineExample([button("tiny").tiny()]),
        inlineExample([button("small").small()]),
        inlineExample([button("medium")]), // equivalent to .medium
        inlineExample([button("large").large()]),
        inlineExample([button("big").big()]),
        inlineExample([button("huge").huge()]),
        inlineExample([button("massive").massive()]),
      ]),
      demoSection("Button Sizes - Compact", [
        inlineExample([button("mini").mini().compact()]),
        inlineExample([button("tiny").tiny().compact()]),
        inlineExample([button("small").small().compact()]),
        inlineExample([button("medium").compact()]), // equivalent to .medium
        inlineExample([button("large").large().compact()]),
        inlineExample([button("big").big().compact()]),
        inlineExample([button("huge").huge().compact()]),
        inlineExample([button("massive").massive().compact()]),
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
      demoSection("Icons", [
        twitter(),
        foursquare(),
        thumbsUp(),
        button(android())
      ]),
      demoSection("Menu", [
        menu([
          menuLabel(h6("Heading")),
          menuAction("Open...", function () {}),
          menuAction("Save As...").disabled(),
          menuSeparator(),
          menuAction("Exit", function () {js.Browser.window.close(); })
        ])
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
