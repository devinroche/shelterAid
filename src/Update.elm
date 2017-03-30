module Update exposing (..)

import Messages exposing(Msg)
import Models exposing(Model)
import Routing exposing(parseLocation)

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Messages.OnFetchResidents response ->
      ({model | residents = response}, Cmd.none)

    Messages.OnLocationChange location ->
      let newRoute =
        parseLocation location

      in
        ({model | route = newRoute}, Cmd.none)
