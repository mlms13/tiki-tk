package tiki;

import doom.core.Renderable;
import doom.core.VNode;
import doom.core.VNodes;
import doom.html.Html.*;
import haxe.ds.Option;
using thx.Arrays;

class Table<Row> extends TkElement<Table<Row>> {
  var rows: Array<Row>;
  public function new(rows: Array<Row>) {
    super("table", []);
    this.rows = rows;
  }

  var columns: Array<Column<Row>> = [];
  var currentColumn = -1;
  public function column(cell: Row -> Cell) {
    if(null != columns[++currentColumn])
      return columns[currentColumn];
    var col = new Column(this, cell);
    columns[currentColumn] = col;
    return col;
  }

  override function render(): VNode {
    var maxHead = columns.map(function(c) return c.headerCells.length).max();
    return table([
      thead([for(i in 0...maxHead) tr(
        columns.map(function(column) {
          var cell = column.headerCells[i];
          if(null == cell) return null;
          return switch cell.type {
            case null, None:
              null;
            case Empty:
              th(["rowspan" => spanAttr(cell.spanRows),
                  "colspan" => spanAttr(cell.spanCols)]);
            case Content(cont):
              th(["class" => "align-center",
                  "rowspan" => spanAttr(cell.spanRows),
                  "colspan" => spanAttr(cell.spanCols)], cont);
          };
        })
      )]),
      tbody(rows.map(function(row) {
        return tr(columns.map(function(column): VNode {
          return column.cell(row);
        }));
      }))
    ]);
  }

  static function spanAttr(v: Int) {
    return v <= 1 ? null : '$v';
  }
}

class Cell extends TkElement<Cell> {
  public function new(kind: CellKind) {
    switch kind {
      case TData(content): super("td", content);
      case THead(content): super("th", content);
    }
  }

  public function colspan(columns: Int) {
    if(columns < 1) columns = 1;
    return setStringAttribute("colspan", '$columns');
  }

  public function rowspan(rows: Int) {
    if(rows < 1) rows = 1;
    return setStringAttribute("rowspan", '$rows');
  }
}

enum CellKind {
  TData(content: VNodes);
  THead(content: VNodes);
}

class Column<Row> implements Renderable {
  public var table(default, null): Table<Row>;
  public var cell(default, null): Row -> Cell;
  public var headerCells(default, null): Array<HeaderCell<Row>>;
  // public var align(default, null): CellAlign;
  public function new(table: Table<Row>, cell: Row -> Cell) {
    this.table = table;
    this.cell = cell;
    this.headerCells = [];
    // this.align = Left;
  }

  public function column(cell: Row -> Cell)
    return table.column(cell);

  public function header(cell: VNodes) {
    var header = new HeaderCell(table, this, Content(cell));
    headerCells.push(header);
    return header;
  }

  public function noHeader() {
    var header = new HeaderCell(table, this, None);
    headerCells.push(header);
    return header;
  }

  public function emptyHeader() {
    var header = new HeaderCell(table, this, Empty);
    headerCells.push(header);
    return header;
  }

  public function render()
    return table.render();
}

class HeaderCell<Row> implements Renderable {
  public var table(default, null): Table<Row>;
  public var parent(default, null): Column<Row>;
  public var type(default, null): HeaderType;
  public var spanCols(default, null): Int = 1;
  public var spanRows(default, null): Int = 1;
  // public var align(default, null): CellAlign;
  public function new(table, parent, type) {
    this.table = table;
    this.parent = parent;
    this.type = type;
    // align = Center;
  }


  public function colspan(columns: Int) {
    if(columns < 1) columns = 1;
    spanCols = columns;
    return this;
  }

  public function rowspan(rows: Int) {
    if(rows < 1) rows = 1;
    spanRows = rows;
    return this;
  }

  public function header(cell: VNodes)
    return parent.header(cell);

  public function noHeader()
    return parent.noHeader();

  public function emptyHeader()
    return parent.emptyHeader();

  public function column(cell: Row -> Cell)
    return table.column(cell);

  public function render()
    return table.render();
}

enum HeaderType {
  None;
  Empty;
  Content(vnodes: VNodes);
}
