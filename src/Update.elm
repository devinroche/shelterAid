module Update exposing (..)

import Messages exposing(Msg)
import Models exposing(Model, Resident)
import Routing exposing(parseLocation)
import Commands exposing (saveResidentCmd, newResidentCmd)
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

    --Save resident
    Messages.OnResidentSave (Ok resident) ->
      (updateResident model resident, Cmd.none)

    Messages.OnResidentSave(Err error) ->
      (model, Cmd.none)

    --Creates new resident
    Messages.OnResidentCreated (Ok resident) ->
      (addToResidents model resident, Cmd.none)

    Messages.OnResidentCreated (Err error) ->
      (model, Cmd.none)

    Messages.NewResidentName name ->
      let newRes =
        Resident name model.newResident.age model.newResident.dob "" "" "" ""

      in
        ( { model | newResident = newRes }, Cmd.none )

    Messages.NewResidentAge age ->
      let newRes =
        Resident model.newResident.name age model.newResident.dob "" "" "" ""

      in
        ( { model | newResident = newRes }, Cmd.none )

    Messages.NewResidentDob dob ->
      let newRes =
        Resident model.newResident.name model.newResident.age dob "" "" "" ""

      in
        ( { model | newResident = newRes }, Cmd.none )

    Messages.SaveNewResident resident ->
      ({model|newResident = resident}, newResidentCmd resident)

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

--add new resident to db
addToResidents: Model -> Resident -> Model
addToResidents model newResident =
  let
    pick currentResident =
      if newResident.id == currentResident.id then
        newResident

      else
        currentResident

    updateResidentList residents =
      List.append (List.map pick residents) [newResident]

    updatedResidents =
      RemoteData.map updateResidentList model.residents

  in
    {model | residents = updatedResidents }
