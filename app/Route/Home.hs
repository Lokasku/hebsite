{-# LANGUAGE OverloadedStrings #-}

module Route.Home where

import Article
import Data.Functor.Identity
import Data.Monoid
import Data.String (fromString)
import Lucid
import Lucid.Html5
import Template as T

showArticles :: [(FilePath, T.Informations)] -> T.HtmlC
showArticles [] = mempty
showArticles ((p, (a, d, t, _)) : xs) =
  ( do
      hr_ []
      p_ (fromString a)
      p_ (fromString d)
      h3_ (a_ [href_ (fromString p)] (fromString t))
  )
    <> showArticles xs

home :: HtmlC
home = T.header "Home" "base.css" $ showArticles Article.articles
