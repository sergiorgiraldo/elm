module Main exposing (..)

import Html
import View
import Update
import Model exposing (Model)
import Subscription


main =
    Html.program
        { init = initial
        , view = View.view
        , update = Update.update
        , subscriptions = Subscription.subscriptions
        }


initial : ( Model, Cmd Update.Msg )
initial =
    { counter = 0
    }
        ! []