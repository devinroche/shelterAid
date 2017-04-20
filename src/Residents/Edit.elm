module Residents.Edit exposing (..)

import Html exposing(..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Messages exposing(Msg)
import Models exposing(Resident)
import Routing exposing (residentsPath)

view : Resident -> Html.Html Msg
view model =
    div []
        [ nav model
        , form model
        ]


nav : Resident -> Html.Html Msg
nav model =
    div [ class "hero is-primary is-bold" ]
      [ div [class "hero-body container"]
        [ h1 [class "title"] [text "Edit Information"]
        , listButton
        ]
      ]


form : Resident -> Html Msg
form resident =
    div [ class "box" ]
        [ h1 [class "title has-text-centered"] [text resident.name]
        , formName resident
        ]


formName : Resident -> Html Msg
formName resident =
  div []
  [ div[ class "columns"]
    [ div [ class "column is-3 is-offset-3" ]
      [ userInformation resident
      ]
    , div [ class "column is-3 is-offset-1" ]
      [ btnIncreaseAge resident
      , btnDecreaseAge resident
      ]
    ]
  ]

btnIncreaseAge : Resident -> Html Msg
btnIncreaseAge resident =
  let
    message =
      Messages.ChangeAge resident 1
  in
    a[ class "", onClick message ]
      [ i [ class "fa fa-plus-circle" ] [] ]

btnDecreaseAge : Resident -> Html Msg
btnDecreaseAge resident =
  let
    message =
      Messages.ChangeAge resident -1
  in
    a[ class "", onClick message ]
      [ i [ class "fa fa-minus-circle" ] [] ]

--Return to home button
listButton : Html Msg
listButton =
      a [ class "btn regular"
        , href residentsPath
        ]
        [ i [ class "fa fa-chevron-left" ] [], text "  Return to List" ]

--User information table
userInformation : Resident -> Html Msg
userInformation resident =
  div []
  [ table [class "table is-striped"]
    [ tr[class "subtitle"]
      [ td [] [text "Age: "]
      , td[] [ label [class ""] [ text (toString resident.age) ]]
      ]
    , tr[class "subtitle"]
      [ td [] [text "Date of Birth: "]
      , td[] [ label [class ""] [ text resident.dob ]]
      ]
    , tr[class "subtitle"]
      [ td [] [text "Identification: "]
      , td[] [ label [class ""] [ text resident.id ]]
      ]
    ]
  ]
