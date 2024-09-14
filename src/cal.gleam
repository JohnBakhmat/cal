import gleam/int
import gleam/io
import lustre
import lustre/element
import lustre/element/html
import lustre/event

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

  html.div([], [
    html.button([event.on_click(Increment)], [element.text("+")]),
    element.text(counter),
    html.button([event.on_click(Decrement)], [element.text("-")]),
  ])
}
