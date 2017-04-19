--Add a new resident form

module NewRes exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Form exposing (Form)
import Form.Validate as Validate exposing (..)
import Form.Input as Input
import Messages exposing (Msg)
import Models exposing (Resident)
import RemoteData exposing (WebData)

view : WebData (NewRes Resident)-> Html Msg
view response =
    div []
      [ nav
      , maybeNew response
      ]

maybeNew : WebData (NewRes Resident) -> Html Msg
maybeNew response =
    case response of
      RemoteData.NotAsked ->
        text ""

      RemoteData.Loading ->
        text "Loading..."

      RemoteData.Success residents ->
        newResident

      RemoteData.Failure error ->
        text (toString error)

--Model
model : Model
model =
  Model "" "" "" ""
