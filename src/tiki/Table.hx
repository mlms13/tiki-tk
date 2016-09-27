package tiki;

import doom.core.VNode;
import doom.core.VNodes;
import doom.html.Html.*;
import haxe.ds.Option;

class Table<Row> extends TkComponent<TableProps<Row>> {
  var columns: Array<Column<Row>> = [];
  public function addColumn(cell: Row -> VNodes) {
    var col = new Column(this, cell);
    columns.push(col);
    return col;
  }

  override function render(): VNode {
    return table([
      thead(tr(
        columns.map(function(column) {
          return switch column.headerCell {
            case Some(cell):
              th(["class" => "align-center"], cell);
            case None:
              th();
          };
        })
      )),
      tbody(props.map(function(row) {
        return tr(columns.map(function(column) {
          return td(column.cell(row));
        }));
      }))
    ]);
  }
}

class Column<Row> {
  public var table(default, null): Table<Row>;
  public var cell(default, null): Row -> VNodes;
  public var headerCell(default, null): Option<VNodes>;
  public var align(default, null): CellAlign;
  public function new(table: Table<Row>, cell: Row -> VNodes) {
    this.table = table;
    this.cell = cell;
    this.headerCell = None;
    this.align = Left;
  }

  public function addColumn(cell: Row -> VNodes)
    return table.addColumn(cell);

  public function header(cell: VNodes) {
    headerCell = Some(cell);
    return this;
  }

  public function left() {
    align = Left;
    return this;
  }

  public function center() {
    align = Center;
    return this;
  }

  public function right() {
    align = Right;
    return this;
  }
}

typedef TableProps<Row> = Array<Row>;

enum CellAlign {
  Left;
  Right;
  Center;
}
