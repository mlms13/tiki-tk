package tiki;

import doom.core.VNode;
import doom.core.VNodes;
import haxe.ds.Option;
using thx.Options;

class Table extends TkElement<Table> {
  public function new(contents: {
    caption: Option<TableCaption>,
    thead: Option<TableHead>,
    tfoot: Option<TableFoot>,
    tbodies: Array<TableBody>,
  }) {
    var children =
          (contents.caption.toArray().map(function(v): VNode return v))
            .concat(contents.thead.toArray().map(function(v): VNode return v))
            .concat(contents.tfoot.toArray().map(function(v): VNode return v))
            .concat(contents.tbodies.map(function(v): VNode return v));
    super("table", children.map(function(child): VNode return child));
  }
}

class TableCaption extends TkElement<TableCaption> {
  public function new(children)
    super("caption", children);
}
class TableContainer<ElementType: TkElement<ElementType>> extends TkElement<ElementType> {}
class TableHead extends TableContainer<TableHead> {
  public function new(rows: Array<TableRow>) {
    super("thead", rows.map(function(v): VNode return v));
  }
}
class TableFoot extends TableContainer<TableFoot> {
  public function new(rows: Array<TableRow>) {
    super("tfoot", rows.map(function(v): VNode return v));
  }
}
class TableBody extends TableContainer<TableBody> {
  public function new(rows: Array<TableRow>) {
    super("tbody", rows.map(function(v): VNode return v));
  }
}

class TableRow extends TkElement<TableRow> {
  public function new(cells: Array<TableCell<Dynamic>>)
    super("tr", cells.map(function(v): VNode return v));
}

class TableCell<TableCell: TkElement<TableCell>> extends TkElement<TableCell> {
  public function rowspan(rows: Int)
    return setStringAttribute("rowspan", '${rows < 1 ? 1 : rows}');
  public function colspan(cols: Int)
    return setStringAttribute("colspan", '${cols < 1 ? 1 : cols}');
}

class TableDataCell extends TableCell<TableDataCell> {
  public function new(children: VNodes)
    super("td", children);

  public function headers(ids: Array<String>)
    return setStringAttribute("headers", '${ids.join(" ")}');
}

class TableHeaderCell extends TableCell<TableHeaderCell> {
  public function new(children: VNodes)
    super("th", children);
}

// import doom.core.Renderable;
// import doom.core.VNode;
// import doom.core.VNodes;
// import doom.html.Html.*;
// import haxe.ds.Option;
// using thx.Arrays;
//
// class Table<Row> extends TkElement<Table<Row>> {
//   var rows: Array<Row>;
//   public function new(rows: Array<Row>) {
//     super("table", []);
//     this.rows = rows;
//   }
//
//   var columns: Array<Column<Row>> = [];
//   var currentColumn = -1;
//   public function column(cell: Row -> Cell) {
//     if(null != columns[++currentColumn])
//       return columns[currentColumn];
//     var col = new Column(this, cell);
//     columns[currentColumn] = col;
//     return col;
//   }
//
//   override function render(): VNode {
//     var maxHead = columns.map(function(c) return c.headerCells.length).max();
//     return table([
//       thead([for(i in 0...maxHead) tr(
//         columns.map(function(column) {
//           var cell = column.headerCells[i];
//           if(null == cell) return null;
//           return switch cell.type {
//             case null, None:
//               null;
//             case Empty:
//               th(["rowspan" => spanAttr(cell.spanRows),
//                   "colspan" => spanAttr(cell.spanCols)]);
//             case Content(cont):
//               th(["class" => "align-center",
//                   "rowspan" => spanAttr(cell.spanRows),
//                   "colspan" => spanAttr(cell.spanCols)], cont);
//           };
//         })
//       )]),
//       tbody(rows.map(function(row) {
//         return tr(columns.map(function(column): VNode {
//           return column.cell(row);
//         }));
//       }))
//     ]);
//   }
//
//   static function spanAttr(v: Int) {
//     return v <= 1 ? null : '$v';
//   }
// }

// class Column<Row> implements Renderable {
//   public var table(default, null): Table<Row>;
//   public var cell(default, null): Row -> Cell;
//   public var headerCells(default, null): Array<HeaderCell<Row>>;
//   // public var align(default, null): CellAlign;
//   public function new(table: Table<Row>, cell: Row -> Cell) {
//     this.table = table;
//     this.cell = cell;
//     this.headerCells = [];
//     // this.align = Left;
//   }
//
//   public function column(cell: Row -> Cell)
//     return table.column(cell);
//
//   public function header(cell: VNodes) {
//     var header = new HeaderCell(table, this, Content(cell));
//     headerCells.push(header);
//     return header;
//   }
//
//   public function noHeader() {
//     var header = new HeaderCell(table, this, None);
//     headerCells.push(header);
//     return header;
//   }
//
//   public function emptyHeader() {
//     var header = new HeaderCell(table, this, Empty);
//     headerCells.push(header);
//     return header;
//   }
//
//   public function render()
//     return table.render();
// }
//
// enum HeaderType {
//   None;
//   Empty;
//   Content(vnodes: VNodes);
// }
