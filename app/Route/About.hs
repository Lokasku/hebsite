{-# LANGUAGE OverloadedStrings #-}

module Route.About where

import Data.Functor.Identity
import Lucid
import Lucid.Html5
import Template as T

about :: T.HtmlC
about = T.header "About" "output.css" $ do
  div_
    ( do
        p_ "Hi, my name is Luke."
        p_ "I like Haskell and Rust."
        a_ [href_ "https://haskell.org"] "Haskell ?"
    )
  p_ "I enjoy"
  ul_
    ( do
        li_ "Programming"
        li_ "Reading"
        li_ "Linguistic"
        li_ "Mathematics"
    )
