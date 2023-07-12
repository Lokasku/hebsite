{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules, BlockArguments #-}

module Article where

import Lucid
import Lucid.Html5
import Data.Text
import Data.String (fromString)

data Monad a => Article a = Article
    { author :: String
    , date :: String
    , title :: String
    , content :: HtmlT a ()
    }

header :: Monad a => String -> HtmlT a () -> HtmlT a ()
header t c =
    doctypehtml_ (do (head_ (do meta_ [charset_ "utf-8"]
    			        title_ (toHtml t)
    			        link_ [rel_ "stylesheet", href_ "../assets/base.css"]))
                     body_ c)
