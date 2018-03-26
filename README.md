# Servant-Persistent API for a simple todo app

This is a simple REST Api built with Servant and Persist.

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
PUT
/todo

Sample request:
```
{ "value": "learn you a Haskell" }
```

### Delete a todo
DELETE
/todo/:todoid


### Modify a todo
PATCH
/todo

Sample request:
```
{
  "id": 3,
  "value": "learn you a Haskell"
  "done": true
}
````

