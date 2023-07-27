{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings #-}

module Template where

import Control.Monad.IO.Class (liftIO)
import Data.Functor.Identity
import Data.Monoid
import Data.String (fromString)
import Data.Text as T
import Lucid
import Lucid.Html5
import System.IO (readFile)
import Web.Twain

type Informations = (String, String, String, HtmlC)

type HtmlC = HtmlT IO ()

loadSVG :: IO String -> HtmlC
loadSVG c = do
  svg <- liftIO c
  toHtmlRaw svg

svg = (loadSVG . readFile)

header :: String -> String -> HtmlC -> HtmlC
header t l c =
  doctypehtml_
    ( do
        ( head_
            ( do
                meta_ [charset_ "utf-8"]
                title_ (toHtml t)
                link_ [rel_ "stylesheet", href_ (T.append (fromString "/static/") (fromString l))]
            )
          )
        body_ [class_ "m-auto"]
          ( do
              div_  [class_ "flex justify-between items-center"]
                ( do
                    ul_ [class_ "ul-inline"]
                      ( do 
                          li_ (a_ [href_ "/"] "Home")
                          li_ (a_ [href_ "/about"] "About")
                      )
                    ul_ [class_ "ul-inline"]
                      ( do
                          li_ (a_ [href_ "https://twitter.com/lokasku"] $ svg "assets/svg/twitter.svg")
                          li_ (a_ [href_ "https://github.com/Lokasku"] $ svg "assets/svg/github.svg")
                          li_ (a_ [href_ "mailto:lukasku@proton.me"] $ svg "assets/svg/mail.svg")
                      )
                )
              div_ [class_ "relative"] (do c; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ []; br_ [])
          )
    )

article :: Informations -> HtmlC
article (a, d, t, c) = do
  div_
    ( do
        h1_ (fromString t)
        p_
          ( (fromString "Written by ")
              <> span_ (fromString a)
              <> (fromString " on ")
              <> span_ (fromString d)
              <> (fromString ".")
          )
    )
  c