import { Elm } from "./main.elm";

var flags = {
  api: "http://localhost:4000",
}

Elm.Main.init({
  flags: flags,
});