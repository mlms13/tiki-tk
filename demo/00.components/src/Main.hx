class Main {
  public static function main() {
    Doom.browser.mount(new App({}), js.Browser.document.querySelector("#root"));
  }
}
