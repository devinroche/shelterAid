module Residents.Edit exposing (..)

import Html exposing(..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
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
    div [ class "clearfix mb2 white bg-black p1" ]
        [listButton]


form : Resident -> Html.Html Msg
form resident =
    div [ class "m3" ]
        [ h1 [] [ text resident.name ]
        , formName resident
        ]


formName : Resident -> Html.Html Msg
formName resident =
    div
        [ class "clearfix py1 border"
        ]
        [ div [ class "col col-1 bold " ] [ text "Name: " ]
        , div [ class "col col-10" ]
            [ label [class "left-align"] [ text resident.name ]
            , nameEdit resident
            ]
        ]


nameEdit : Resident -> Html.Html Msg
nameEdit resident =
  --let
    --message = Messages.updateResident resident
  --in  onClick updateResident
    a [ class "form block col-6" ]
        [ input [ class "field block col-3 mt2", placeholder "Edit Name" ] []
        , button [class "btn btn-primary mt2"][text "submit"]
        ]

listButton : Html Msg
listButton =
      a
        [ class "btn regular"
        , href residentsPath
        ]
        [ i [ class "fa fa-chevron-left mr1" ] [], text "List" ]
