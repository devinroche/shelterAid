module Residents.Edit exposing (..)

import Html exposing(..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
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


form : Resident -> Html.Html Msg
form resident =
    div [ class "box" ]
        [ h1[class "title has-text-centered"] [text resident.name]
        , formName resident
        ]


formName : Resident -> Html.Html Msg
formName resident =
    div[ class "columns"]
      [ div [ class "column is-3 is-offset-3" ]
        [ text "Name: "
        , label [class ""] [ text resident.name ]
        ]
      , div [ class "column is-3 is-offset-1" ]
        [ nameEdit resident
        ]
      ]


nameEdit : Resident -> Html.Html Msg
nameEdit resident =
  let
    message = Messages.ChangeName resident content
  in
    div [ class "columns" ]
      [ input [ class "input", onInput message, placeholder "Edit Name" ] []
      , button [class "button is-success"][text "Submit"]
      ]


listButton : Html Msg
listButton =
      a [ class "btn regular"
        , href residentsPath
        ]
        [ i [ class "fa fa-chevron-left" ] [], text "  Return to List" ]
