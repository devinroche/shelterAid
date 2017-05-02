module Residents.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (Msg)
import Navigation exposing (reload)
import Models exposing (Resident, Model)
import RemoteData exposing (WebData)
import Html.Events exposing (onClick)
import Routing exposing (residentPath, createResidentPath, residentsPath)

view : WebData (List Resident)-> Html Msg
view response =
    div []
      [ nav
      , maybeList response
      ]
nav: Html Msg
nav =
  div [class "hero is-primary is-info"]
    [ div [ class "hero-body" ]
      [ div [class "container"]
        [ h1 [class "title is-2"][text "shelter Aid"]
        , h2 [class "subtitle"] [text "Edit Resident"]
        ]
      ]
    , div [class "hero-foot"]
      [ div[class "tabs is-boxed"]
        [ div[class "container"]
          [ ul[]
            [ li[class "is-active"][a[href residentsPath][text "Home"]]
            , li[class ""][a[href createResidentPath][text "New Resident"]]
            , li[class ""][a[][text "About"]]
            ]
          ]
        ]
      ]
    ]

list : List Resident -> Html Msg
list residents =
  div [class ""]
  [ div [class "columns"]
    [ div[class "column is-8 is-offset-2"]
      [ div [class "has-text-centered subtitle "]
        [ h2[class "title"][text "Residents"], hr[][]]
        , div[class "box"]
          [ listResident residents
          , hr[][]
          , createResidentBtn
          ]
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
          , th [] [ text "" ]
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
      , td[] [editResidentBtn resident]
      , td[] [deleteResidentBtn resident]
      ]

--Check if we can get data from server, if yes then list residents
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

--Edit residents button
editResidentBtn: Resident -> Html Msg
editResidentBtn resident=
  let editpath =
    residentPath resident.id

  in
    a [ class "button is-info is-outlined" , href editpath ]
      [ i [class ""] [] , text "Edit"]

--delete resident BUTTon
deleteResidentBtn: Resident -> Html Msg
deleteResidentBtn resident=
  let
    deleteMessage = Messages.DeleteResident resident
  in
    a [ class "button is-outlined is-danger", onClick deleteMessage ]
      [ i [class ""] [] , text "Delete" ]


--Add new resident button
createResidentBtn: Html Msg
createResidentBtn  =
  let createpath =
   createResidentPath

  in
    a [ class "button is-success regular", href createpath]
      [ i [class ""] [] , text "Add Resident" ]

btnStyle: Attribute Msg
btnStyle =
  style
    [

    ]
