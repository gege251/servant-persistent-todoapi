{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE DuplicateRecordFields      #-}
{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}

module Model where

import           Data.Text           (Text)
import           GHC.Generics        (Generic)
import           Database.Persist.TH (mkPersist, mkMigrate,
                                      sqlSettings, share,
                                      persistLowerCase)

import           Data.Aeson          (FromJSON)

filePath :: FilePath
filePath = "todos.json"


-- TODO

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
Todo json
  value Text
  done Bool
  deriving Eq Show Generic
|]

data OnlyValue = OnlyValue
  { value :: Text } deriving Generic

instance FromJSON OnlyValue 
