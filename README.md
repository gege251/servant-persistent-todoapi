# Servant-Persistent API for a simple todo app

This is a simple REST Api built with Servant and Persist.
Should work together with the **todo-with-restapi** in [gege251/elm-examples](https://github.com/gege251/elm-examples).

## Get started

```
$ stack build
$ stack exec servant-persistent-todoapi
```

## Endpoints

### Get all todos
GET
/todo


### Get a todo by id
GET
/todo/:todoid


### Create a new todo
POST
/todo

Sample request:
```
{ "value": "learn you a Haskell" }
```

### Delete a todo
DELETE
/todo/:todoid


### Modify a todo
PUT
/todo

Sample request:
```
{
  "id": 3,
  "value": "learn you a Haskell"
  "done": true
}
```
