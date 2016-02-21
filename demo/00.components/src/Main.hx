class Main {
  public static function main() {
    Doom.mount(App.with(), js.Browser.document.querySelector("#root"));
  }
}
