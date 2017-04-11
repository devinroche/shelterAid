module Messages exposing(..)

import Models exposing(Resident)
import RemoteData exposing (WebData)
import Navigation exposing(Location)
import Http

type Msg
  = OnFetchResidents (WebData (List Resident))
  | OnLocationChange Location
  | ChangeName Resident String
  | OnResidentSave (Result Http.Error Resident)
