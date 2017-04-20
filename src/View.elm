module View exposing (..)

import Html exposing (..)
import Messages exposing(Msg)
import Models exposing(Model)
import Models exposing(..)
import Residents.List
import Residents.Edit
import Residents.Create
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

    Models.ResidentRoute id ->
      residentEditPage model id

    --Models.NewResidentRoute ->
      --residentCreatePage model

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
            Residents.Edit.view resident

          Nothing ->
            noViewFound

--residentCreatePage: Model -> Resident -> Html Msg
--residentCreatePage model  resident=
  --case model.resident of
    --RemoteData.NotAsked ->
      --text ""

--    RemoteData.Loading ->
--      text "Loading....."

--    RemoteData.Failure err ->
--      text (toString err)

--    RemoteData.Success err ->
--      text (toString err)

noViewFound : Html msg
noViewFound =
  div[]
    [ text "View not found"
    ]
