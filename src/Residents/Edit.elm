module Residents.Edit exposing (..)

import Html exposing(..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing(Msg)
import Models exposing(Resident)
import Routing exposing (residentsPath)

--initialize view
view : Resident -> Html.Html Msg
view model =
    div []
        [ nav model
        , form model
        ]

--set up small naviagtion
nav : Resident -> Html.Html Msg
nav model =
    div [ class "hero is-primary is-bold" ]
      [ div [class "hero-body container"]
        [ h1 [class "title"] [text "Edit Information"]
        , listButton
        ]
      ]

--body "container"
form : Resident -> Html Msg
form resident =
    div [ class "box" ]
        [ h1 [class "title has-text-centered"] [text resident.name]
        , formName resident
        ]

--set up body
formName : Resident -> Html Msg
formName resident =
  div []
  [ div[ class "columns"]
    [ div [ class "column is-3 is-offset-3" ]
      [ userInformation resident
      ]
    , div [ class "column is-3 is-offset-1" ]
      [ editInfoContainer resident
      ]
    ]
  ]

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
  div [class "card"]
  [ table [class "table is-striped"]
    [ tr[class "subtitle"]
      [ td [] [text "Age: "]
      , td[] [ label [class ""] [ text resident.age ]]
      ]
    , tr[class "subtitle"]
      [ td [] [text "Date of Birth: "]
      , td[] [ label [class ""] [ text resident.dob ]]
      ]
    , tr[class "subtitle"]
      [ td [] [text "Identification: "]
      , td[] [ label [class ""] [ text resident.id ]]
      ]
    , tr[class "subtitle"]
      [ td [] [text "Tmp Name: "]
      , td[] [ label [class ""] [ text resident.tmpName ]]
      ]
    , tr[class "subtitle"]
      [ td [] [text "Tmp Age: "]
      , td[] [ label [class ""] [ text resident.tmpAge ]]
      ]
    , tr[class "subtitle"]
      [ td [] [text "Tmp Dob: "]
      , td[] [ label [class ""] [ text resident.tmpDob ]]
      ]
    ]
  ]


--Edit information container
editInfoContainer: Resident -> Html Msg
editInfoContainer resident =
  let
    nameChange = Messages.NameChange resident
    ageChange = Messages.AgeChange resident
    dobChange = Messages.DobChange resident
    submitEdit = Messages.SubmitEdit resident

  in
    div [class "card"]
    [ div [class "card-header"]
      [label [class "card-header-title"][text "Edit "]]
    , div [class "card-content"]
      [ div [class "content"]
        [ div [class "field"]
          [ input [ class "input", type_ "name", placeholder resident.name, onInput nameChange ] [] ]
        , div [class "field"]
          [ input [ class "input", type_ "age", placeholder resident.age, onInput ageChange ] [] ]
        , div [class "field"]
          [ input [ class "input", type_ "dob", placeholder resident.dob, onInput dobChange ] [] ]
        ]
      ]
    , div [class "card-footer"]
      [ a [ class "card-footer-item"][text "Clear" ]
      , a [ class "card-footer-item",  onClick (submitEdit)] [text "Submit"]
      ]
    ]
