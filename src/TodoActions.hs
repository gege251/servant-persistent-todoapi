{-# LANGUAGE OverloadedStrings #-}

module TodoActions where

import           GHC.Int                 (Int64)
import           Database.Persist        (Entity(Entity),
                                          (=.), (==.), entityVal)

import           Database.Persist.Sqlite (toSqlKey, selectList,
                                          selectFirst, deleteWhere,
                                          insert, replace)

import           Servant                 (NoContent(NoContent))

import           Model
import           Config                  


getTodos :: AppM [Entity Todo]
getTodos = 
  runDB $ selectList [] []


getTodoById :: Int64 -> AppM (Maybe (Entity Todo))
getTodoById todoId =
  runDB $ selectFirst [TodoId ==. (toSqlKey todoId)] []


putTodo :: OnlyValue -> AppM (Entity Todo)
putTodo todoVal = do
  let newTodo = Todo (value todoVal) False
  todoKey <- runDB $ insert newTodo
  return $ Entity todoKey newTodo


delTodo :: Int64 -> AppM NoContent
delTodo todoId = do
  runDB $ deleteWhere [TodoId ==. (toSqlKey todoId)]
  return NoContent


updateTodo :: Entity Todo -> AppM NoContent
updateTodo (Entity key todo) = do
  runDB $ replace key todo
  return NoContent

