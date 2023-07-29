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

type Informations = (String, String, String, String, HtmlC)

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
              header_ [class_ "w-full"]
                ( do
                    ul_ [class_ "ul-inline border-b-2 border-gray-300 py-[15px] mx-5"]
                      ( do 
                          li_ (a_ [href_ "/", class_ "text-neutral-600 font-medium mr-6"] "Home")
                          li_ (a_ [href_ "/about", class_ "text-neutral-600 font-medium"] "About")
                      )
                )
              div_ [class_ ""] (do c)
              footer_ [class_ "absolute bottom-0 w-full"] ( ul_ [class_ "ul-inline border-t-2 border-gray-300 text-center py-[15px] mx-5"]
                      ( do
                          li_ [class_ "mx-6"] (a_ [href_ "https://twitter.com/lokasku"] $ svg "assets/svg/twitter.svg")
                          li_ [class_ "mx-6"] (a_ [href_ "https://github.com/Lokasku"] $ svg "assets/svg/github.svg")
                          li_ [class_ "mx-6"] (a_ [href_ "mailto:lukasku@proton.me"] $ svg "assets/svg/mail.svg")
                      )
                  )
          )
    )

article :: Informations -> HtmlC
article (a, d, t, _, c) = do
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