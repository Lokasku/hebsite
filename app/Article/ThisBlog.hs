{-# LANGUAGE OverloadedStrings #-}

module Article.ThisBlog
  ( author,
    date,
    title,
    content,
  )
where

import Data.Functor.Identity
import Data.Monoid
import Lucid
import Lucid.Html5

author = "Luke"

date = "today"

title = "This Blog"

content :: HtmlT IO ()
content = do
  div_
    ( do
        p_ "Lorem ipsum dolor sit amet, consectetur adipiscing " <> code_ "elit" <> ", sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad " <> code_ "minim" <> " veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        br_ [] <> br_ []
        p_ "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi " <> code_ "architecto" <> " beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione " <> a_ [href_ "#"] "emotionae" <> " voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
        pre_ $
          "main :: IO ()\n\
          \main = putStrLn \"hello, everyone\""
    )
  a_ [href_ "https://apple.com"] "Click here"
