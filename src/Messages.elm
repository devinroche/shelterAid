module Messages exposing(..)

import Models exposing(Resident)
import RemoteData exposing (WebData)
import Navigation exposing(Location)

type Msg
  = OnFetchResidents (WebData (List Resident))
  | OnLocationChange Location
