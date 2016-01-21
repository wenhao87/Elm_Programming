module HelloWorld4 where

import Graphics.Element exposing (..)
import Markdown

main : Graphics.Element.Element
main = Markdown.toElement """

# Hello World

This is the output of the *HelloWorld4.elm* program.

---
"""
