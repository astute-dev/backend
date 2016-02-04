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


####GET `/courses`

Get a list of courses sorted by department. Notice that every department has a "General" option, in addition to the other courses.

Request
```
GET '/courses'
```

Response
```
[
    "DEPT" :
    [
        {
        "courseId": "general"
        },
        {
        "department": "CRIN", 
        "courseId": "518", 
        "section": "01", 
        "title": "ESL Dual Endorsement Practicum"
        }
    ],
    ...
]
```


####POST `/user`

Create a new user

Request
``` js
POST '/user'
# body
{
    "faculty":false,
    "email":"email",
    "password":"password",
    "username":"username"
}
```
```
Response -> created user as JSON if successful

```

####GET `/user/:id`

View a specific user's information

Request
``` js
GET '/user/1'
```

Response
```
{
    "id":1,
    "faculty":false,
    "email":"email",
    "password":"password",
    "username":"username",
    "created_at":"2016-02-04T21:44:40.496Z",
    "updated_at":"2016-02-04T21:44:40.496Z"
}

```

####POST `/user/:id`

Update a user's information

Request
``` js
POST '/user/1'
# body
{
    "faculty":false,
    "email":"email",
    "password":"password",
    "username":"username"
}
```
```
Response -> updated user as JSON if successful

```

####DELETE `/user/:id`

Delete an user

Request
```
DELETE '/user/1'
```

Response
```
```

####GET `/user/:id/event`

View the events that a user has made

Request
``` js
GET '/user/1/event'
```

Response
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






