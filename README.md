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
        faculty: <Boolean>,
        number_attending: <Integer>
    },
    ...
]
```


####POST `/event`

Add a new event

Request
```
POST '/event'
# body
{
    user_id: <Integer>,i
    name: <String>,
    location: <String>,
    description: <String>,
    department: <String>,
    course: <String>,
    start_t: <Date_Time, ISO-8601>,
    end_t: <Date_Time, ISO-8601>,
    faculty: <Boolean>
}
```

Response -> Same object as response if successful
```
```


####GET `/event/:id`

Get an event

Request
```
GET 'event/1'
```

Response
```js
{
    userid: <Integer>,
    name: <String>,
    location: <String>,
    description: <String>,
    department: <String>,
    class: <String>,
    start_t: <Date_Time>,
    end_t: <Date_Time>,
    faculty: <Boolean>,
    number_attending: <Integer>
}
```


####POST `/event/:id`

Update an event

Request
```js
POST `/event/1`
# body
{
    user_id: <Integer>,i
    name: <String>,
    location: <String>,
    description: <String>,
    department: <String>,
    course: <String>,
    start_t: <Date_Time, ISO-8601>,
    end_t: <Date_Time, ISO-8601>,
    faculty: <Boolean>
}
```

```
Response -> Same object as response if successful
```


####DELETE `/event/:id`

Delete an event

Request
```
DELETE '/event/1'
```

Response
```
```






