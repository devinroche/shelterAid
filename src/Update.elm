module Update exposing (..)

import Messages exposing(Msg)
import Models exposing(Model, Resident)
import Routing exposing(parseLocation)
import Commands exposing (saveResidentCmd)
import RemoteData

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Messages.OnFetchResidents response ->
      ({model | residents = response}, Cmd.none)

    Messages.OnLocationChange location ->
      let newRoute =
        parseLocation location

      in
        ({model | route = newRoute}, Cmd.none)

    Messages.ChangeName resident newName ->
      let updatedResident =
        {resident | name = newName}

      in
        (model, saveResidentCmd updatedResident)

    Messages.OnResidentSave (Ok resident) ->
      (updateResident model resident, Cmd.none)

    Messages.OnResidentSave(Err error) ->
      (model, Cmd.none)

updateResident : Model -> Resident -> Model
updateResident model updatedResident =
  let
    pick currentResident =
      if updatedResident.name == currentResident.name then
        updatedResident
      else
        currentResident

    updateResidentList residents =
      List.map pick residents

    updatedResidents =
      RemoteData.map updateResidentList model.residents

  in
    {model | residents = updatedResidents}
