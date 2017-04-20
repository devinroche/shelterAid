module Residents.Create exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Models exposing (Resident)
import Routing exposing (residentsPath)

view : Resident -> Html Msg
view model =
  div []
    [ nav model
    , form model
    ]

nav : Resident -> Html Msg
nav model =
  div [ class "hero is-primary is-bold" ]
    [ div [class "hero-body container"]
      [ h1 [class "title"] [text "New Resident"]
      , returnBtn
      ]
    ]

form: Resident -> Html Msg
form resident =
  div []
  [ input [placeholder "Name" ] []
  , input [placeholder "Date of Birth" ] []
  , input [placeholder "Age" ] []
  , input [placeholder "ID" ] []
  ]

returnBtn : Html Msg
returnBtn =
  a [ class "btn regular"
    , href residentsPath
    ]
    [ i [ class "fa fa-chevron-left" ] [], text "  Return to Home" ]
