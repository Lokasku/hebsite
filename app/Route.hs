{-# LANGUAGE OverloadedStrings #-}

module Route where

import Lucid
import Data.ByteString.Lazy.Internal
import Web.Twain
import Web.Twain.Types
import Article (articles)
import Template as T
-- import Page (home, about)

get' :: PathPattern -> ByteString -> Middleware
get' fp c = get fp $ send $ html c

routes :: [Middleware]
routes =
  [ get' "/" "<p>welcome</p>",
    get' "/about" "<p>about me</p>",
    get "/:article" $ do
      name <- pathParam "article"
      case lookup name articles of
        Nothing -> next
        Just (a, d, t, c) -> send (html (renderBS (T.header t (T.article (a, d, t, c)))))
  ]
