module Update exposing (..)

import Messages exposing(Msg)
import Models exposing(Model, Resident)
import Routing exposing(parseLocation)
import Commands exposing (saveResidentCmd)
import RemoteData

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    --Error Handling for database connection etc
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
    --Comments above

    --Name change listener function, assigns to tmp attributes
    Messages.NameChange resident newName ->
      let nameChanged =
        {resident | tmpName = newName}

      in
        (model, saveResidentCmd nameChanged)

    --Age change listener function, assigns to tmp attributes
    Messages.AgeChange resident newAge ->
      let ageChanged = {resident | tmpAge = newAge}

      in
        (model, saveResidentCmd ageChanged)

    --Date of Birth change listener function, assigns to tmp attributes
    Messages.DobChange resident newDob ->
      let dobChanged = {resident | tmpDob = newDob}

      in
        (model, saveResidentCmd dobChanged)

    --Submits Changes made to name/age/and dob change to resident.
    Messages.SubmitEdit resident ->
      let submitedAgeResident =
        {resident
        | age = resident.tmpAge
        , name = resident.tmpName
        , dob = resident.tmpDob
        }

      in (model, saveResidentCmd submitedAgeResident)

--Sends changes to resident with matching ID
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
