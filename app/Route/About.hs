{-# LANGUAGE OverloadedStrings #-}

module Route.About where

import Lucid
import Lucid.Html5
import Template as T

about :: T.HtmlC
about = T.header "About" "output.css" $ div_ [class_ "mx-2 mt-6"] $ do
  p_
    ( "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut "
        <> a_ [href_ "#"] "enim ad minim"
        <> " veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute "
        <> code_ "irure"
        <> " dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat "
        <> a_ [href_ "#"] "cupidatat"
        <> " non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    )
  ul_
    ( do
        li_ "Programming"
        li_ "Reading"
        li_ "Linguistic"
        li_ "Mathematics"
    )
