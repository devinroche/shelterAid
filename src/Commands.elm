module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Messages exposing (Msg)
import Models exposing (ResidentID, Resident)
import RemoteData

fetchResidents: Cmd Msg
fetchResidents =
  Http.get fetchResidentsUrl residentsDecoder
    |> RemoteData.sendRequest
    |> Cmd.map Messages.OnFetchResidents


fetchResidentsUrl: String
fetchResidentsUrl =
  "http://localhost:4000/residents"


residentsDecoder: Decode.Decoder (List Resident)
residentsDecoder =
  Decode.list residentDecoder


residentDecoder: Decode.Decoder Resident
residentDecoder =
  decode Resident
    |> required "name" Decode.string
    |> required "dob" Decode.string
    |> required "age" Decode.string
    |> required "ID" Decode.string
