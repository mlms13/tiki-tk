class Main {
  public static function main() {
    Doom.browser.mount(new App({}), js.Browser.document.querySelector("#root"));
    doom.html.Css.save("demo/00.components/www/components.css");
  }
}
