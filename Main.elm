module Main exposing (..)

import Html exposing (Html, div, text, program)
import Messages exposing (Msg)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Commands exposing (fetchResidents)
import Routing
import Navigation exposing (Location)

init: Location -> (Model, Cmd Msg)
init location =
  let
    currentRoute = Routing.parseLocation location

  in
    (initialModel currentRoute, fetchResidents)

subscriptions: Model ->Sub Msg
subscriptions model=
  Sub.none

main: Program Never Model Msg
main =
  Navigation.program Messages.OnLocationChange
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }
