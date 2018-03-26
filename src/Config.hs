{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts  #-}

module Config where

import           Servant                     (Handler)
import           Control.Monad.Reader        (ReaderT, asks)
import           Control.Monad.IO.Unlift     (MonadUnliftIO)
import           Control.Monad.IO.Class      (liftIO)
import           Data.Pool                   (Pool)
import           Database.Persist.Sql        (SqlBackend)
import           Network.Wai.Middleware.Cors (Origin)
import           Database.Persist.Sqlite     (runSqlPool)


data Config =
  Config { dbpool :: Pool SqlBackend }

type AppM = ReaderT Config Handler


feHost :: Origin
feHost = "http://localhost:8000"


getPool :: AppM (Pool SqlBackend)
getPool = 
  asks dbpool


runDB :: (MonadUnliftIO IO) => ReaderT SqlBackend IO a -> AppM a
runDB action = do
  pool <- getPool
  liftIO $ runSqlPool action pool

