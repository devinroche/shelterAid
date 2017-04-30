module Residents.Create exposing (..)

import Html exposing(..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing(Msg)
import Models exposing(Resident, latestId, Model)
import Routing exposing (residentsPath)

--initialize view
view : Resident -> Html Msg
view model =
    div []
        [ nav model
        , form model
        ]

--set up small naviagtion
nav : Resident -> Html Msg
nav model =
    div [ class "hero is-primary is-info is-bold" ]
      [ div [class "hero-body container"]
        [ h1 [class "title"] [text "Add Resident"]
        , listButton
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
              [ input [ class "input is-medium", placeholder "ID"] [] ]
            , div [class "field"]
              [ input [ class "input is-medium", placeholder "name", onInput newResidentName] [] ]
            , div [class "field"]
              [ input [ class "input is-medium",  placeholder "age", onInput newResidentAge] [] ]
            , div [class "field"]
              [ input [ class "input is-medium",  placeholder "date of birth", onInput newResidentDob] [] ]
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
