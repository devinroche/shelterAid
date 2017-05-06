module Residents.Edit exposing (..)

import Html exposing(..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing(Msg)
import Models exposing(Resident)
import Routing exposing (residentsPath, createResidentPath, aboutPath)

--initialize view
view : Resident -> Html.Html Msg
view model =
    div []
        [ nav model
        , form model
        ]

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
            , li[class ""][a[href createResidentPath][text "New Resident"]]
            , li[class ""][a[][text "About"]]
            , li[class "is-active"][a[href aboutPath][text "Edit"]]
            ]
          ]
        ]
      ]
    ]

--Return to home button
listButton : Html Msg
listButton =
      a [ class "subtitle button is-dark", href residentsPath]
        [ i [ class "" ] [], text "Back" ]

--body "container"
form : Resident -> Html Msg
form resident =
    div [ class "box" ]
        [ formName resident ]

--set up body
formName : Resident -> Html Msg
formName resident =
  div []
  [ div[ class "columns"]
    [ div [ class "column is-6 is-offset-1" ]
      [ userInformation resident
      ]
    , div [ class "column is-4 is-offset-1" ]
      [ editInfoContainer resident
      ]
    ]
  ]

--User information table
userInformation : Resident -> Html Msg
userInformation resident =
  div[class "media"]
  [ div[class "media-left"]
    [ div[class "image"]
      [ p [class "image"]
        [ img[imgStyle,src (resident.img)][] ]
      ]
    ]
  , div[class "media-content"]
    [ div [class "content"]
      [ p[titleStyle][text resident.name]
      , hr[hrStyle][]
      , p[subtitleStyle][text ("Age: " ++ resident.age)]
      , hr[hrStyle][]
      , p[subtitleStyle][text ("Date of Birth: " ++ resident.dob)]
      , hr[hrStyle][]
      , p[subtitleStyle][text ("ID: " ++ resident.id)]
      , hr[hrStyle][]
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
    div [class "box"]
    [ div [class ""]
      [ div [class "field"]
        [ input [ class "input is-medium", type_ "name", placeholder "Name", onInput nameChange ] [] ]
      , div [class "field"]
        [ input [ class "input is-medium", type_ "age", placeholder "Age", onInput ageChange ] [] ]
      , div [class "field"]
        [ input [ class "input is-medium", type_ "dob", placeholder "Date of Birth", onInput dobChange ] [] ]

      , div [class "field"]
        [ div [class "control"]
          [ a [ class "button is-medium is-success",  onClick (submitEdit)] [text "Submit Changes"]]
        ]
      ]
    ]


--STYLES FOR ABOVE
imgStyle: Attribute Msg
imgStyle =
  style
    [ ("height", "256px"), ("width", "auto")]

hrStyle: Attribute Msg
hrStyle =
  style
    [ ("padding-top", "0")
    , ("margin-top", "0")
    ]

titleStyle: Attribute Msg
titleStyle =
  style
    [ ("color", "#363636")
    , ("font-size", "2rem")
    , ("font-weight", "300")
    , ("line-height", "1.125")
    , ("margin-bottom", "10px")
    ]

subtitleStyle: Attribute Msg
subtitleStyle =
  style
    [ ("color", "#4a4a4a")
    , ("font-size", "1.25rem")
    , ("font-weight",  "300")
    , ("line-height", "1.25")
    , ("margin-bottom", "10px")
    , ("margin-top", "25px")
    ]
