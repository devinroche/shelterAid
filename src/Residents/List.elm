module Residents.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Messages exposing (Msg)
import Models exposing (Resident)
import RemoteData exposing (WebData)
import Routing exposing (residentPath, newResidentPath)


view : WebData (List Resident)-> Html Msg
view response =
    div []
      [ nav
      , maybeList response
      ]

nav: Html Msg
nav =
  div [ class "hero is-primary is-bold" ]
    [ div [class "hero-body container"]
      [ h1[class "title is-2"][text "shelterAid"]
      , h2[class "subtitle"] [text "Home"]
      ]
    ]

list : List Resident -> Html Msg
list residents =
  div [class ""]
  [ div [class "columns"]
    [ div[class "column is-6"]
      [ div [class "has-text-centered subtitle "]
        [text "Residents"
        ]
        , listResident residents
        , addResident
      ]
    ]
  ]

listResident : List Resident -> Html Msg
listResident residents =
  div[class ""]
    [ table [class "table is-striped"]
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
    a [ class "btn regular"
      , href path
      ]
      [ i [class ""] []
      , text "Details"
      ]

addResident: Html Msg
addResident =
  let addResPath =
    newResidentPath

  in
    a [class "button regular"
      , href addResPath
      ]
      [i [class ""] []
      , text "New Resident"
      ]
