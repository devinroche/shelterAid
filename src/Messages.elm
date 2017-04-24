module Messages exposing(..)

import Models exposing(Resident)
import RemoteData exposing (WebData)
import Navigation exposing(Location)
import Http

type Msg
  = OnFetchResidents (WebData (List Resident))
  | OnLocationChange Location
  | ChangeAge Resident Int
  | EditResident Resident String String Int
  | NameChange Resident String
  | SubmitEdit Resident
  --| DobChange String
  --| AgeChange Int
  | OnResidentSave (Result Http.Error Resident)
