module About exposing (..)

import Html exposing(..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing(Msg)
import Routing exposing (residentsPath, createResidentPath, aboutPath)

--initialize view
view : Html Msg
view =
  div []
    [ nav
    , aboutBody
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
            [ li[class ""][a[href residentsPath][text "Home"]]
            , li[class ""][a[href createResidentPath][text "New Resident"]]
            , li[class "is-active"][a[href aboutPath][text "About"]]
            ]
          ]
        ]
      ]
    ]

aboutBody: Html Msg
aboutBody =
  div[class "columns"]
  [div[class "column is-8 is-offset-2"] [about]]

about: Html Msg
about =
  div[class ""]
  [ div [class ""]
    [ h3[class "title"][text "The Project"]
    , p[][text "The goal of this project was to learn a new language and use it to develop an application."]
    , p[][text "Our program was required to relate to Environmental Sustainability, Healthcare, STEM Eductaton"]
    , p[][text "Homelessness and Housing, or Civic Engagement."]
    , hr[][]
    , h4[class "subtitle"][text "The Problem: Homelessness in Spokane"]
    , ul[]
      [ li[][text "-  There are about 1,033 homeless individuals in Spokane."]
      , li[][text "-  17% of all people in Spokane County fell below the poverty line."]
      , li[][text "-  25% of Spokane Homeless are children"]
      ]
    , hr[][]
    , h3[class "subtitle"][text "Breaking Shelter Aid"]
    , p[][text "There are a few known bugs."]
    , ul[]
      [ li[][text "-  User ids are just error codes pushed into the database."]
      , li[][text "-  If you delete the last resident and add another the database will crash."]
      ]
    , hr[][]
    , p[class "subtitle"][text "Future Extensions"]
    , ul[]
      [ li[][text "-  Allow custom headshots"]
      , li[][text "-  Improve ID generator"]
      , li[][text "-  Login/Logout of shelter page"]
      ]
    , hr[][]
    ]
  ]
