{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings #-}

module Article where

import Data.String (fromString)
import Data.Text
import Lucid
import Lucid.Html5

data Article a = Article
  { author :: String,
    date :: String,
    title :: String,
    content :: HtmlT a ()
  }

header :: Monad a => String -> HtmlT a () -> HtmlT a ()
header t c =
  doctypehtml_
    ( do
        ( head_
            ( do
                meta_ [charset_ "utf-8"]
                title_ (toHtml t)
                link_ [rel_ "stylesheet", href_ "../assets/base.css"]
            )
          )
        body_ c
    )
