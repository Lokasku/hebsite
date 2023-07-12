{-# LANGUAGE OverloadedStrings #-}

import Article
import Data.Functor.Identity
import Lucid
import Lucid.Html5

article :: Article Identity
article = Article "Luke" "today" "This Blog" (header (title article) c)

c :: Monad a => HtmlT a ()
c = do
  div_
    ( do
        p_ "Hi everyone"
        p_ "Here is my blog"
    )
  a_ [href_ "https://apple.com"] "Click here"
