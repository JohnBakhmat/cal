import gleam/int
import lustre
import lustre/attribute.{class}
import lustre/element.{text}
import lustre/element/html.{body, button, div, h1}
import lustre/event.{on_click}

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

type Model =
  Int

fn init(_flags) -> Model {
  0
}

type Msg {
  Increment
  Decrement
}

fn update(model: Model, msg: Msg) -> Model {
  case msg {
    Increment -> model + 1
    Decrement -> model - 1
  }
}

fn view(model: Model) -> element.Element(Msg) {
  let counter = int.to_string(model)

  body(
    [
      class(
        "frappe grid place-items-center w-screen h-screen bg-base text-white",
      ),
    ],
    [
      div([class("flex flex-col items-center gap-4 text-4xl")], [
        button(
          [
            on_click(Increment),
            class(
              "px-3 py-1 bg-white shadow-lg hover:bg-emerald-300 duration-150 rounded-md text-black",
            ),
          ],
          [text("+")],
        ),
        h1([class("text-black")], [text(counter)]),
        button(
          [
            on_click(Decrement),
            class(
              "px-3 py-1 bg-white shadow-lg hover:bg-emerald-300 duration-150 rounded-md text-black",
            ),
          ],
          [text("-")],
        ),
      ]),
    ],
  )
}
