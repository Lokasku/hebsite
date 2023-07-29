{-# LANGUAGE OverloadedStrings #-}

module Article.ThisBlog
  ( author,
    date,
    title,
    description,
    content
  )
where

import Data.Monoid
import Lucid
import Lucid.Html5

author = "Luke"

date = "29 Saturday 2023"

title = "This Blog"

description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."

content :: HtmlT IO ()
content = do
  div_
    ( do
        p_ "hello, guys."
        p_ "Yeah, booooooooy!"
        a_ [href_ "#"] "Lubie jablko i jajko"
        pre_ $
          "main :: IO ()\n\
          \main = putStrLn \"hello, everyone\""
    )
  a_ [href_ "https://apple.com"] "Click here"
