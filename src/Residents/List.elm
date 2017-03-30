module Residents.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import Models exposing (Resident)
import RemoteData exposing (WebData)

view : WebData (List Resident)-> Html Msg
view response =
    div []
      [ nav
      , maybeList response
      ]

nav: Html Msg
nav =
  div []
    [ div [] [ text "Residents" ] ]

list : List Resident -> Html Msg
list residents =
    div []
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Name" ]
                    , th [] [ text "DOB" ]
                    , th [] [ text "Age" ]
                    , th [] [ text "ID" ]
                    , th [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map residentRow residents)
            ]
        ]

residentRow : Resident -> Html Msg
residentRow resident =
    tr []
      [ td [] [ text resident.name ]
      , td [] [ text resident.dob ]
      , td [] [ text resident.age ]
      , td [] [ text resident.id]
      , td[]
            []
      ]

maybeList : WebData (List Resident) -> Html Msg
maybeList response =
    case response of
      RemoteData.NotAsked ->
        text ""

      RemoteData.Loading ->
        text "Loading..."

      RemoteData.Success residents ->
        list residents

      RemoteData.Failure error ->
        text (toString error)
