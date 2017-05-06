module Models exposing(..)

import RemoteData exposing(WebData)

type alias Model =
  { residents: WebData (List Resident)
  , route: Route
  , newResident : Resident
  }

initialModel: Route -> Model
initialModel route =
  { residents = RemoteData.Loading
  , newResident = Resident "" "" "" "" "" "" "" ""
  , route = route
  }

type alias ResidentID =
  String

type alias Resident =
  { name : String
  , dob : String
  , age : String
  , id: ResidentID
  , img: String
  , tmpName : String
  , tmpDob : String
  , tmpAge : String
  }

type Route
  = ResidentsRoute
  | ResidentRoute ResidentID
  | CreateResidentRoute
  | AboutRoute
  | NoMatchingRoute
