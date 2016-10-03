package tiki;

import thx.culture.Culture;
import thx.format.NumberFormat;
using thx.Objects;

// NumberFormat.fixed.bind(_, null, _)

class Number extends TkEmptyElement<Number> {
  var options: NumberOptions;
  public function new(options : NumberOptions) {
    this.options = options;
    super("span");
  }

  override function render()
    return doom.html.Html.el("span", attributes, gen());

  public function culture(cult: Culture) {
    options = options.with(culture, cult);
    return self();
  }

  public function binary(?significantDigits: Int) {
    options = options.with(format, NumberFormat.binary.bind(_, significantDigits, _));
    return self();
  }

  public function currency(?precision: Int, ?symbol: String) {
    options = options.with(format, NumberFormat.currency.bind(_, precision, symbol, _));
    return self();
  }

  public function decimal(?significantDigits: Int) {
    options = options.with(format, NumberFormat.decimal.bind(_, significantDigits, _));
    return self();
  }

  public function fixed(?precision: Int) {
    options = options.with(format, NumberFormat.fixed.bind(_, precision, _));
    return self();
  }

  public function exponential(?precision: Int, ?digits: Int, ?symbol: String) {
    options = options.with(format, NumberFormat.exponential.bind(_, precision, digits, symbol, _));
    return self();
  }

  public function general(?significantDigits: Int) {
    options = options.with(format, NumberFormat.general.bind(_, significantDigits, _));
    return self();
  }

  public function hex(?significantDigits: Int) {
    options = options.with(format, NumberFormat.hex.bind(_, significantDigits, _));
    return self();
  }

  public function integer() {
    options = options.with(format, NumberFormat.integer);
    return self();
  }

  public function number(?precision: Int) {
    options = options.with(format, NumberFormat.number.bind(_, precision, _));
    return self();
  }

  public function octal(?significantDigits: Int) {
    options = options.with(format, NumberFormat.octal.bind(_, significantDigits, _));
    return self();
  }

  public function percent(?decimals: Int) {
    options = options.with(format, NumberFormat.percent.bind(_, decimals, _));
    return self();
  }

  public function permille(?decimals: Int) {
    options = options.with(format, NumberFormat.permille.bind(_, decimals, _));
    return self();
  }

  public function customFormat(?pattern: String) {
    options = options.with(format, NumberFormat.customFormat.bind(_, pattern, _));
    return self();
  }

  public function format(?pattern: String) {
    options = options.with(format, NumberFormat.format.bind(_, pattern, _));
    return self();
  }

  function gen()
    return options.format(options.value, options.culture);
}

typedef NumberOptions = {
  value: Float,
  format: Float -> Culture -> String,
  culture: Culture
}
