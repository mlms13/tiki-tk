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
        message(["Success message hollow"]).style(Success).hollow(),
        message(["Success message contrast"]).style(Success).contrast(),
        message(["Success message inverted"]).style(Success).inverted(),
        message(["Success message inverted / contrast"]).style(Success).inverted().contrast(),
        message(["Success message hollow / contrast"]).style(Success).hollow().contrast(),
        message(["Warning message"]).style(Warning),
        message(["Danger message with dismissible"]).style(Danger).dismissible(function() console.log("message closed"))
      ]),
      demoSection("Tables", [
        table(
          tcaption("some caption here"),
          thead([
            tr([th([]).colspan(2),       th("numbers").center().colspan(2)]),
            tr([th("city"),              th("state").center(),  th("population").right(),                th("land area").right()])
          ]),
          tfoot([
            tr([th([]),                  th("totals:").right(), th(int(10171215)).right(),               th(num(749.8, 1)).right()])
          ]),
          tbody([
            tr([th("Seattle"),           td("WA").center(),     td(int(652405)).right(),                 td(num(83.9, 1)).right()]),
            tr([th("New York").style(Success)
                .contrast().inverted(),  td("NY").center(),     td(int(8405837)).right().style(Warning), td(num(302.6, 1)).right()]),
            tr([th("Boston"),            td("MA").center(),     td(int(645966)).right(),                 td(num(48.3, 1)).right().style(Danger)]),
            tr([th("Kansas City"),       td("MO").center(),     td(int(467007)).right().style(Info),     td(num(315.0, 1)).right()]),
          ])
        ),
        table(
          tbody([
            tr([th("Seattle"),     td("WA").center(), td(int(652405)).right(),  td(num(83.9, 1)).right()]),
            tr([th("New York"),    td("NY").center(), td(int(8405837)).right(), td(num(302.6, 1)).right()]),
            tr([th("Boston")
              .hollow()
              .style(Danger),      td("MA").center(), td(int(645966)).right(),  td(num(48.3, 1)).right()]),
            tr([th("Kansas City"), td("MO").center(), td(int(467007)).right(),  td(num(315.0, 1)).right()]),
          ])
        ),
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
            tr([th("New York"),    td("NY").center(), td(int(8405837)).right().style(Success), td(num(302.6, 1)).right()]),
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
            tr([th("New York"),    td("NY").center(), td(int(8405837)).right().style(Success), td(num(302.6, 1)).right()]),
            tr([th("Boston"),      td("MA").center(), td(int(645966)).right(),  td(num(48.3, 1)).right()]),
            tr([th("Kansas City"), td("MO").center(), td(int(467007)).right(),  td(num(315.0, 1)).right()]),
          ])
        ).style(Danger)
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

  // static function tableContent() return [
  //   {
  //     city: "Seattle",
  //     state: "WA",
  //     population: 652405,
  //     landArea: 83.9
  //   },
  //   {
  //     city: "New York",
  //     state: "NY",
  //     population: 8405837,
  //     landArea: 302.6
  //   },
  //   {
  //     city: "Boston",
  //     state: "MA",
  //     population: 645966,
  //     landArea: 48.3
  //   },
  //   {
  //     city: "Kansas City",
  //     state: "MO",
  //     population: 467007,
  //     landArea: 315
  //   }
  // ];

  // table(tableContent())
  //   .column(function(r) return cell("x"))
  //     .emptyHeader()
  //     .header("x")
  //   .column(function(r) return cell(r.city))
  //     .emptyHeader()
  //     .rowspan(2)
  //   .column(function(r) return cell(r.state))
  //     .emptyHeader()
  //     .header("state")
  //   .column(function(r) return cell(integer(r.population)))
  //     .header("numbers").colspan(2)
  //     .header("population")
  //   .column(function(r) return cell(fixed(r.landArea, 1)))
  //     .noHeader()
  //     .header("area")
}
