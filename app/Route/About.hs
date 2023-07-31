{-# LANGUAGE OverloadedStrings #-}

module Route.About where

import Lucid
import Lucid.Html5
import Template as T

about :: T.HtmlC
about = T.header "About" "output.css" $ div_ [class_ "mx-2 mt-6"] $ do
  p_ "Hi, I'm Luke (Lokasku, but also Lukasku) an enthusiastic apprentice developer. I'm 16 years old and my interests include programming languages development, kernels and low-level in general. The languages I use on a daily basis are Haskell and Rust, but I also know Common Lisp, Python and a few web languages. I plan to learn Clojure and C."
  p_ "I'm also interested in natural and constructed languages, as I'm learning Polish and Russian, and studying Tolkien's Blackspeach with great interest. Otherwise, I can write English and French, can speak French but am not as comfortable in English."
  p_ "Video games and mathematics are fun pastimes. I mostly play open-world games such as Skyrim and Minecraft, and read mathematical articles online."
  hr_ []
  p_
    ( "This website was written by me (special thanks to "
        <> a_ [href_ "https://github.com/Mesabloo"] "Mesabloo"
        <> ") in Haskell using the Twain lib. You can find the sources "
        <> a_ [href_ "https://github.com/Lokasku/website"] "here"
        <> "."
    )
