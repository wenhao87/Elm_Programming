module MouseSignals3 where

import Graphics.Element exposing (down, flow, leftAligned)
import List exposing (map)
import Mouse
import Signal exposing (sampleOn)
import Text exposing (fromString)

showsignals: a -> b -> c -> d -> e -> f -> g -> Graphics.Element.Element
showsignals a b c d e f g =
    flow down <|
        List.map (fromString >> leftAligned) [
                "Mouse.position: " ++ toString a,
                "Mouse.x: " ++ toString b,
                "Mouse.y: " ++ toString c,
                "Mouse.clicks: " ++ toString d,
                "Mouse.isDown: " ++ toString e,
                "sampleOn Mouse.clicks Mouse.position: " ++ toString f,
                "sampleOn Mouse.isDown Mouse.position: " ++ toString g
            ]

{-| An alias for `map`. A prettier way to apply a function to the current value
of a signal.

    main : Signal Html
    main =
        view <~ model
    model : Signal Model

    view : Model -> Html
-}

(<~) : (a -> b) -> Signal a -> Signal b
(<~) =
    Signal.map

{-| Intended to be paired with the `(<~)` operator, this makes it possible for
many signals to flow into a function. Think of it as a fancy alias for
`mapN`. For example, the following declarations are equivalent:

    main : Signal Element
    main =
        scene <~ Window.dimensions ~ Mouse.position

    main : Signal Element
    main =
        map2 scene Window.dimensions Mouse.position

You can use this pattern for as many signals as you want by using `(~)` a bunch
of times, so you can go higher than `map5` if you need to.
-}

(~) : Signal (a -> b) -> Signal a -> Signal b
(~) funcs args =
    Signal.map2 (\f v -> f v) funcs args

main : Signal Graphics.Element.Element
main =
    showsignals
        <~ Mouse.position
        ~ Mouse.x
        ~ Mouse.y
        ~ Mouse.clicks
        ~ Mouse.isDown
        ~ sampleOn Mouse.clicks Mouse.position
        ~ sampleOn Mouse.isDown Mouse.position
