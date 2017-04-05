module Residents.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg)
import Models exposing (Resident)
import RemoteData exposing (WebData)
import Routing exposing (residentPath)


view : WebData (List Resident)-> Html Msg
view response =
    div []
      [ nav
      , maybeList response
      ]

nav: Html Msg
nav =
  div [class "clearfix mb2 white bg-black"]
    [ div [class "left p2"] [ text "Residents" ] ]

list : List Resident -> Html Msg
list residents =
    div []
        [ table [class "table is-stripped"]
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
            [editButton resident]
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

editButton: Resident -> Html Msg
editButton resident=
  let path =
    residentPath resident.id

  in
    a
      [ class "btn regular"
      , href path
      ]
      [i [class "fa fa-pencil mr1"] [], text "Edit"]
