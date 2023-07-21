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

getSvgContent :: String -> IO String
getSvgContent = readFile

loadSVG :: IO String -> HtmlC
loadSVG c = do
  svg <- liftIO c
  toHtmlRaw svg

svg = (loadSVG . getSvgContent)

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
        body_
          ( do
              div_
                [class_ "navbar"]
                ( do
                    ul_
                      [class_ "left"]
                      ( do
                          li_ (a_ [href_ "/"] "Home")
                          li_ (a_ [href_ "/about"] "About")
                      )
                    ul_
                      [class_ "right"]
                      ( do
                          li_ (a_ [href_ "https://twitter.com/lokasku"] $ svg "assets/svg/twitter.svg")
                          li_ (a_ [href_ "https://github.com/Lokasku"] $ svg "assets/svg/github.svg")
                          li_ (a_ [href_ "mailto:lukasku@proton.me"] $ svg "assets/svg/mail.svg")
                      )
                )
              div_ [class_ "content"] c
          )
    )

article :: Informations -> HtmlC
article (a, d, t, c) = do
  div_
    [class_ "informations"]
    ( do
        h1_ [class_ "title"] (fromString t)
        p_
          ( (fromString "Written by ")
              <> span_ [class_ "author"] (fromString a)
              <> (fromString " on ")
              <> span_ [class_ "date"] (fromString d)
              <> (fromString ".")
          )
    )
  c
