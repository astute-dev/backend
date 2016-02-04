# Backend

Backend for [Astute](http://astute-dev.github.io/) app.

## API

#### GET `/event`

Request

```
GET '/event'
```

Response: A JSON array

```js
[
    {
        userid: <Integer>,
        name: <String>,
        location: <String>,
        description: <String>,
        department: <String>,
        class: <String>,
        start_t: <Date_Time>,
        end_t: <Date_Time>,
        faculty: <Boolean>
    }
]
```


####POST `/event`

Add a new event

Request
```
GET '/event'
# body
{
    userid: <Integer>,
    name: <String>,
    location: <String>,
    description: <String>,
    department: <String>,
    class: <String>,
    start_t: <Date_Time>,
    end_t: <Date_Time>,
    faculty: <Boolean>
}
```

Response
```
```


####GET `/event/:id`

Get an event

Request
```
GET 'event/123abc'
```

Response
```js
{

}
```


####PUT `/event/:id`

Update an event

Request
```js
PUT `/event/123abc`
# body
{
    userid: <Integer>,
    name: <String>,
    location: <String>,
    description: <String>,
    department: <String>,
    class: <String>,
    start_t: <Date_Time>,
    end_t: <Date_Time>,
    faculty: <Boolean>
}
```

Response
```
{

}
```


####DELETE `/event/:id`

Delete an event

Request
```
DELETE '/event/123abc'
```

Response
```
```

