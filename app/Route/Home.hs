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
    [class_ "article"]
    ( do
        p_
          [class_ "articl-info"]
          ( span_ [class_ "author"] (fromString a)
              <> span_ [class_ "date"] (fromString d)
              <> span_ [class_ "title"] (a_ [href_ (fromString p)] (fromString t))
          )
    )
    <> showArticles xs

home :: HtmlC
home = T.header "Home" "base.css" $ showArticles Article.articles
