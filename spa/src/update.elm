module Update exposing (..)

import Model exposing (Model)


type Msg
    = ButtonClick


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ButtonClick ->
            { model
                | counter = model.counter + 1
            }
                ! []