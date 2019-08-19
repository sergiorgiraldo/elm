module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Model)
import Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "SPA in Elm" ]
        , div []
            [ text "Button pushed in this screen: "
            , text <| toString model.counter
            ]
        , div []
            [ button [ onClick ButtonClick ] [ text "++" ]
            ]
        ]