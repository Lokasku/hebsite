{-# LANGUAGE OverloadedStrings #-}

module Route where

import Article (articles)
import Data.ByteString.Lazy.Internal
import Lucid
import Route.About as About
import Route.Home as Home
import Template as T
import Web.Twain
import Web.Twain.Types

get' :: PathPattern -> ByteString -> Middleware
get' fp c = get fp $ send $ html c

routes :: [Middleware]
routes =
  [ get' "/" $ renderBS Home.home,
    get' "/about" $ renderBS About.about,
    get "/:article" $ do
      name <- pathParam "article"
      case lookup name articles of
        Nothing -> next
        Just (a, d, t, c) -> send (html (renderBS (T.header t (T.article (a, d, t, c)))))
  ]
