{-#LANGUAGE DataKinds, OverloadedStrings #-}
import Data.Proxy
import Data.Text
import Network.Wai.Handler.Warp
import Servant
import System.Environment

type Hello = Get '[PlainText] Text

server :: Server Hello
server = return "Hello, world!"

proxy :: Proxy Hello
proxy = Proxy

main :: IO ()
main = do
    env <- getEnvironment
    let port = maybe 8080 read $ lookup "PORT" env
    run port $ serve proxy server
