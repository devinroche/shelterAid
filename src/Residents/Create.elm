module Residents.Create exposing (..)

import Html exposing(..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing(Msg)
import Models exposing(Resident, Model)
import Routing exposing (residentsPath, createResidentPath, aboutPath)

--initialize view
view : Resident -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]

--set up small naviagtion
nav: Resident -> Html Msg
nav resident  =
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
            [ li[class ""][a[href residentsPath][text "Home"]]
            , li[class "is-active"][a[href createResidentPath][text "New Resident"]]
            , li[class ""][a[href aboutPath][text "About"]]
            ]
          ]
        ]
      ]
    ]

--body "container"
form : Resident -> Html Msg
form model=
    div [ class "box" ]
        [ h1 [class "title has-text-centered"] [text "Add Resident"]
        , editNewResident model
        ]

editNewResident: Resident -> Html Msg
editNewResident resident =
  let
    addNewResident = Messages.SaveNewResident resident
    newResidentName = Messages.NewResidentName
    newResidentAge = Messages.NewResidentAge
    newResidentDob = Messages.NewResidentDob

  in
    div [class "columns"]
    [ div[class "column is-6 is-offset-3"]
      [ div [class "card"]
        [ div [class "card-header"]
          [label [class "card-header-title"][text "Resident information"] ]
        , div [class "card-content"]
          [ div [class "content"]
            [ div [class "field"]
              [ input [ class "input is-medium", placeholder "name", onInput newResidentName] [] ]
            , div [class "field"]
              [ input [ class "input is-medium",  placeholder "age", onInput newResidentAge] [] ]
            , div [class "field"]
              [ input [ class "input is-medium",  placeholder "date of birth", onInput newResidentDob] [] ]
            , div [class "field"]
              [ h5[][text "*ID Generated on submit*"]]
            ]
          ]
        , div [class "card-footer"]
          [ a [ class "card-footer-item"][text "Clear"]
          , a [ class "card-footer-item", onClick addNewResident] [text "Submit"]
          ]
        ]
      ]
    ]

--Return to home button
listButton : Html Msg
listButton =
      a [ class "subtitle", href residentsPath]
        [ i [ class "" ] [], text "< Return Home" ]
