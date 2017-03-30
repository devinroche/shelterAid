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
  { name: String
  , dob: String
  , age: String
  , id: ResidentID
  }

type Route
  = ResidentsRoute
  | ResidentRoute ResidentID
  | NoMatchingRoute
