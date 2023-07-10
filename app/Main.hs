{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Twain as Twain
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = do
    run 1024 myApp

tree :: [Middleware]
tree = [ get "/" $ send $ html "Welcome"
       , get "/about" $ send $ html "<p>About me</p>"
       ]

myApp :: Application
myApp = foldr ($) (notFound $ send $ html "<p>Error 404</p>") tree
