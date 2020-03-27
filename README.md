model -> where our class structure lives DB/active record

view -> anything that can be seen by user HTML/css 

controller -> interaction between model and view

7 RESTful Routes
Representational State Transfer

Create
Read
Update
Destroy

HTTP Verb       |    Route      |   Action     | Actually do
GET                 /todos          index        displays collection of model type
GET                /todos/:id       show         display details of one model
GET                /todos/new       new          displaying a form to create new model
POST               /todos           create       creting model in DB/storing
GET             /todos/:id/edit     edit         displays form for user to make edits
PATCH/PUT          /todos           update       actually makes changes to todo in DB
DELETE            /todos/:id        destroy      remove the todo from DB
