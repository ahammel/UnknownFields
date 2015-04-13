{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.ByteString.Lazy (ByteString, fromStrict)
import Data.Text.Encoding (encodeUtf8)

import qualified Whatever.Whatever as W1
import qualified Whatever2.Whatever as W2
import Text.ProtocolBuffers (Utf8(..), defaultValue, messagePut, messageGet)


hello :: Utf8
hello = Utf8 . fromStrict $ encodeUtf8 "hello"

goodbye :: Utf8
goodbye = Utf8 . fromStrict $ encodeUtf8 "goodbye"

main :: IO ()
main = do
    let msg = messagePut $ defaultValue { W2.foo =  Just hello
                                        , W2.bar = Just goodbye
                                        }
        msg2 = messageGet msg :: Either String (W1.Whatever, ByteString)
    print msg2


