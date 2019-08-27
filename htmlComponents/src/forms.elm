-- Input a user name and password. Make sure the password matches.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/forms.html
--
-- elm install fredcy/elm-parseint 
-- elm install elm/regex
-- elm install elm/parser

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import ParseInt exposing (..) 
import Regex exposing (..) 
import Parser exposing (..) 

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model =
  { name : String
  , age : Int
  , password : String
  , passwordAgain : String
  , error : String
  }


init : Model
init =
  Model "" 0 "" "" ""

-- UPDATE

type Msg
  = Name String
  | Age String
  | Password String
  | PasswordAgain String
  | Error

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Age age ->
      { model | age = String.toInt age |> Maybe.withDefault 0}

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }

    Error ->
      { model | error = "Not implemented yet." }

-- VIEW

-- VALIDATIONS

passwordsMatch: Model -> Bool
passwordsMatch model =
  model.password == model.passwordAgain

passwordLongerThanOrEqual8: Model -> Bool
passwordLongerThanOrEqual8 model =
  String.length model.password >= 8

isAllTrue : List Bool -> Bool
isAllTrue bs =
    List.length (List.filter (\b -> b) bs) == List.length bs

allValidationPassword : Model -> Bool
allValidationPassword model =
    isAllTrue
        [ passwordsMatch model
        , passwordLongerThanOrEqual8 model
        ]


view : Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Name" model.name Name
    , viewInput "number" "Age" (String.fromInt model.age) Age
    , viewInput "password" "Password" model.password Password
    , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
    , button [ onClick Error ] [ text "submit" ]
    , div [] [ text model.error ]    
    , viewValidation model
    ]

viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model =
    if allValidationPassword model then
        div [ style "color" "green" ] [ text "OK" ]
    else
        div [ style "color" "red" ] [ text "Fix your Passwords!" ]