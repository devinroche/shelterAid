module Residents.Edit exposing (..)

import Html exposing(..)
import Html.Attributes exposing (..)
import Messages exposing(Msg)
import Models exposing(Resident)

view : Resident -> Html.Html Msg
view model =
    div []
        [ nav model
        , form model
        ]


nav : Resident -> Html.Html Msg
nav model =
    div [ class "clearfix mb2 white bg-black p1" ]
        []


form : Resident -> Html.Html Msg
form resident =
    div [ class "m3" ]
        [ h1 [] [ text resident.name ]
        , formLevel resident
        ]


formLevel : Resident -> Html.Html Msg
formLevel resident =
    div
        [ class "clearfix py1"
        ]
        [ div [ class "col col-5" ] [ text "Level" ]
        , div [ class "col col-7" ]
            [ span [ class "h2 bold" ] [ text resident.name ]
            , btnLevelDecrease resident
            , btnLevelIncrease resident
            ]
        ]


btnLevelDecrease : Resident -> Html.Html Msg
btnLevelDecrease resident =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-minus-circle" ] [] ]


btnLevelIncrease : Resident -> Html.Html Msg
btnLevelIncrease resident =
    a [ class "btn ml1 h1" ]
        [ i [ class "fa fa-plus-circle" ] [] ]
