module Routing exposing(..)

import Navigation exposing(Location)
import Models exposing(ResidentID, Route(..))
import UrlParser exposing(..)

matchers: Parser (Route -> a) a
matchers =
  oneOf
    [ map ResidentsRoute top
    , map ResidentsRoute (s "residents" </> string)
    , map ResidentsRoute (s "residents")
    ]

parseLocation: Location -> Route
parseLocation location =
  case (parseHash matchers location) of
    Just route ->
      route

    Nothing ->
      NoMatchingRoute
