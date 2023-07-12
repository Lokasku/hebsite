{-# LANGUAGE OverloadedStrings #-}

module Article.ThisBlog
  ( author,
    date,
    title,
    content,
  )
where

import Data.Functor.Identity
import Lucid
import Lucid.Html5

author = "Luke"

date = "today"

title = "This Blog"

content :: HtmlT Identity ()
content = do
  div_
    ( do
        p_ "Hi everyone"
        p_ "Here is my blog"
    )
  a_ [href_ "https://apple.com"] "Click here"
