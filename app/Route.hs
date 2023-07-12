{-# LANGUAGE OverloadedStrings #-}

module Route where

import Data.ByteString.Lazy.Internal
import Web.Twain

routes :: [Middleware]
routes =
  [ get "/" $ send $ html "<p>welcome</p>",
    get "/about" $ send $ html "<p>about me</p>",
    get "/:article" $ do
      name <- pathParam "article"
      case lookup name articles of
        Nothing -> next
        Just article -> send $ html article
  ]

articles :: [(FilePath, ByteString)]
articles =
  [ ("this-blog", "haha, just some blog, what a question")
  ]
