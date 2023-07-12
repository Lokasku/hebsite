{-# LANGUAGE OverloadedStrings #-}

module Article.ThisBlog
  ( author,
    date,
    title,
    content,
  )
where

import Data.Functor.Identity
import Lucid
import Lucid.Html5
