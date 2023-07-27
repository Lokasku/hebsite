{-# LANGUAGE OverloadedStrings #-}

module Article.ThisBlog
  ( author,
    date,
    title,
    content,
  )
where

import Data.Monoid
import Lucid
import Lucid.Html5

author = "Luke"

date = "today"

title = "This Blog"

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
