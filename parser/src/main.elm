module MyParser exposing (..)

import Html exposing (..)
import Parser exposing (..)

main =
    div []
        [ span [] [ Html.text <| Debug.toString <| run number_ "1234A" ]
        , br [] []
        , span [] [ Html.text <| Debug.toString <| run number_ "1234" ]
        ]

number_ : Parser Int
number_ =
  succeed identity
    |= int
    |. end

fancyString_ : Parser String
fancyString_ =
  succeed identity
    |= string
    |. end
