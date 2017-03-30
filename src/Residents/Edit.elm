module Residents.Edit exposing (..)

import Html exposing(..)
import Html.Attributes exposing (..)
import Messages exposing(Msg)
import Models exposing(Resident)

view: Resident -> Html Msg
view model =
  div []
    [ nav model
    , form model
    ]

nav: Resident-> Html Msg
nav =
  div[class "clearfix mb2 p1"]
    []

form: Resident->Html Msg
form resident =
  div[]
    [ h1 [text resident.name ]
    , formEdit resident
    ]

formEdit: Resident -> Html Msg
formEdit resident =
  div []
    [ div [ class "col col-3"] [text "Name"]
    , div [class "col col-9"]
      [span [ class "bold" ] [ text resident.name ]
      , tfEditName resident
      ]
    ]

tfEditName: Resident -> Html Msg
tfEditName resident =
  a[ class "p1 m1 border"]
    [ input  []]
