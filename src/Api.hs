{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE TypeOperators         #-}
{-# LANGUAGE OverloadedStrings     #-}


module Api where

import           GHC.Int                 (Int64)
import           Database.Persist       (Entity)
import           Servant

import           Model
import qualified TodoActions
import           Config                 (AppM)


-- API


type TodoApi =
  -- GET /todo
  "todo" :> Get '[JSON] [Entity Todo] :<|>

  -- GET /todo/:todoId
  "todo" :> Capture "todoId" Int64 :> Get '[JSON] (Maybe (Entity Todo)) :<|>

  -- PUT /todo
  "todo" :> ReqBody '[JSON] OnlyValue :> Put '[JSON] (Entity Todo) :<|>

  -- DELETE /todo
  "todo" :> Capture "todoId" Int64 :> Delete '[JSON] NoContent :<|>

  -- PATCH /todo
  "todo" :> Capture "todoId" Int64 :> ReqBody '[JSON] (Entity Todo) :> Patch '[JSON] NoContent

todoApi :: Proxy TodoApi
todoApi = Proxy


server :: ServerT TodoApi AppM
server =
  TodoActions.getTodos :<|>
  TodoActions.getTodoById :<|>
  TodoActions.putTodo :<|>
  TodoActions.delTodo :<|>
  TodoActions.updateTodo
