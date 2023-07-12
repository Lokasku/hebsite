{-# LANGUAGE OverloadedStrings #-}

import Article
import Lucid.Html5
import Lucid
import Data.Functor.Identity

article :: Article Identity
article = Article "Luke" "today" "This Blog" (header (title article) c)

c :: Monad a => HtmlT a ()
c = do
    div_ (do p_ "Hi everyone"
             p_ "Here is my blog")
    a_ [href_ "https://apple.com"] "Click here"
