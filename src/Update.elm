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

    Messages.OnResidentSave (Ok resident) ->
      (updateResident model resident, Cmd.none)

    Messages.OnResidentSave(Err error) ->
      (model, Cmd.none)

    Messages.NameChange resident newName ->
      let nameChanged =
        {resident | tmpName = newName}

      in
        (model, saveResidentCmd nameChanged)

    Messages.AgeChange resident newAge ->
      let ageChanged = {resident | tmpAge = newAge}

      in
        (model, saveResidentCmd ageChanged)


    Messages.SubmitEdit resident ->
      let submitedAgeResident =
        {resident
        | age = resident.tmpAge
        , name = resident.tmpName
        , dob = resident.tmpDob
        }

      in (model, saveResidentCmd submitedAgeResident)


updateResident : Model -> Resident -> Model
updateResident model editedResident =
  let
    pick currentResident =
      if editedResident.id == currentResident.id then
        editedResident
      else
        currentResident

    updateResidentList residents =
      List.map pick residents

    updatedResidents =
      RemoteData.map updateResidentList model.residents

  in
    {model | residents = updatedResidents}
