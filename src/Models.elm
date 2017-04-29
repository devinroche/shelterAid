module Models exposing(..)

import RemoteData exposing(WebData)

type alias Model =
  { residents: WebData (List Resident)
  , route: Route
  }

initialModel: Route -> Model
initialModel route =
  { residents = RemoteData.Loading
  , route = route
  }

type alias ResidentID =
  String

type alias Resident =
  { name : String
  , dob : String
  , age : String
  , id: ResidentID
  , tmpName : String
  , tmpDob : String
  , tmpAge : String
  }

type Route
  = ResidentsRoute
  | ResidentRoute ResidentID
  | NoMatchingRoute
