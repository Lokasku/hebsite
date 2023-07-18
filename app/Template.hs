{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings #-}

module Template where

import Data.Functor.Identity
import Data.Monoid
import Data.String (fromString)
import Data.Text
import Lucid
import Lucid.Html5

type Informations = (String, String, String, HtmlC)

type HtmlC = HtmlT Identity ()

header :: String -> String -> HtmlC -> HtmlC
header t l c =
  doctypehtml_
    ( do
        ( head_
            ( do
                meta_ [charset_ "utf-8"]
                title_ (toHtml t)
                link_ [rel_ "stylesheet", href_ (append (fromString "static/") (fromString l))]
            )
          )
        body_ (do
                 ul_ [class_ "topbar"] (do
                        li_ (a_ [href_ "/"] "home")
                        li_ (a_ [href_ "/about"] "about")
                     )
                 c
              )
    )

article :: Informations -> HtmlC
article (a, d, t, c) = do
  p_ (fromString a)
  p_ (fromString d)
  h2_ (fromString t)
  hr_ []
  c
