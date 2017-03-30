module View exposing (..)

import Html exposing (..)
import Messages exposing(Msg)
import Models exposing(Model)
import Models exposing(Model, ResidentID)
import Residents.List
import Residents.Edit
import RemoteData

view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
  case model.route of
    Models.ResidentsRoute ->
      Residents.List.view model.residents

    Models.ResidentsRoute id ->
      residentEditPage model id

    Models.NoMatchingRoute ->
      noViewFound

residentEditPage: Model -> ResidentID -> Html Msg
residentEditPage model residentID =
  case model.residents of
    RemoteData.NotAsked ->
      text ""

    RemoteData.Loading ->
      text "Loading....."

    RemoteData.Failure err ->
      text (toString err)

    RemoteData.Success residents ->
      let maybeResident =
        residents
          |> List.filter (\resident -> resident.id == residentID)
          |> List.head

      in
        case maybeResident of
          Just resident ->
            Resident.Edit.view resident

          Nothing ->
            noViewFound

noViewFound : Html msg
noViewFound =
  div[]
    [ text "View not found"
    ]
