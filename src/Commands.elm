module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Encode as Encode
import Json.Decode.Pipeline exposing (decode, required)
import Messages exposing (Msg)
import Models exposing (ResidentID, Resident)
import RemoteData

--Fetch Resident
fetchResidents: Cmd Msg
fetchResidents =
  Http.get fetchResidentsUrl residentsDecoder
    |> RemoteData.sendRequest
    |> Cmd.map Messages.OnFetchResidents

fetchResidentsUrl: String
fetchResidentsUrl =
  "http://localhost:4000/residents"

--Save Resident Edits
saveResidentUrl: ResidentID -> String
saveResidentUrl residentID =
  "http://localhost:4000/residents/" ++ residentID

saveResidentRequest: Resident -> Http.Request Resident
saveResidentRequest resident =
  Http.request
    { body = residentEncoder resident |> Http.jsonBody
    , expect = Http.expectJson residentDecoder
    , headers = []
    , method = "PATCH"
    , timeout = Nothing
    , url = saveResidentUrl resident.id
    , withCredentials = False
    }

saveResidentCmd: Resident -> Cmd Msg
saveResidentCmd resident =
  saveResidentRequest resident
    |> Http.send Messages.OnResidentSave

--Encode Changes to JSON database
residentEncoder: Resident ->Encode.Value
residentEncoder resident =
  let
    attributes =
      [ ( "name", Encode.string resident.name )
      , ( "dob", Encode.string resident.dob )
      , ( "age", Encode.string resident.age)
      , ( "id", Encode.string resident.id )
      , ( "tmpName", Encode.string resident.tmpName )
      , ( "tmpDob", Encode.string resident.tmpDob )
      , ( "tmpAge", Encode.string resident.tmpAge )
      ]

  in
    Encode.object attributes

--Decoder
residentsDecoder: Decode.Decoder (List Resident)
residentsDecoder =
  Decode.list residentDecoder

residentDecoder: Decode.Decoder Resident
residentDecoder =
  decode Resident
    |> required "name" Decode.string
    |> required "dob" Decode.string
    |> required "age" Decode.string
    |> required "id" Decode.string
    |> required "tmpName" Decode.string
    |> required "tmpDob" Decode.string
    |> required "tmpAge" Decode.string
