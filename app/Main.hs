{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Twain as Twain
import Network.Wai.Handler.Warp (run)
import Route as R

main :: IO ()
main = do
    run 1024 myApp

myApp :: Application
myApp = foldr ($) (notFound $ send $ html "<p>not found</p>") R.routes
