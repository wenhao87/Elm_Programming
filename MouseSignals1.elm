module MouseSignals1 where

import Mouse
import Signal exposing (map)
import Graphics.Element exposing (show)

main : Signal Graphics.Element.Element
main = map show Mouse.x
