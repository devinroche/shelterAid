module Messages exposing(..)

import Models exposing(Resident)
import RemoteData exposing (WebData)
import Navigation exposing(Location)
import Http

type Msg
  = OnFetchResidents (WebData (List Resident))
  | OnLocationChange Location
  | AgeChange Resident String
  | NameChange Resident String
  | DobChange Resident String
  | SubmitEdit Resident
  | NewResidentName String
  | NewResidentAge String
  | NewResidentDob String
  | SaveNewResident Resident
  | DeleteResident Resident
  | OnResidentDeleted (Result Http.Error Resident)
  | OnResidentSave (Result Http.Error Resident)
  | OnResidentCreated (Result Http.Error Resident)
