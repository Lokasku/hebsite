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
  div_
  [class_ "bg-sky-500 focus:bg-sky-700"]
    ( do
        p_ $ a_ [href_ (fromString p)] (fromString t)
        p_
          ( span_ (fromString a)
              <> span_ (fromString " ~ ")
              <> span_ (fromString d)
          )
    )
    <> showArticles xs

home :: HtmlC
home = T.header "Home" "output.css" $ showArticles Article.articles
