# pet-finder
## Phase 3 Project 
### Objectives 
To support a React frontend, create a web-basic API with Sinatra and Active Record.
Introduction

Building a Sinatra API backend that uses Active Record to retrieve and persist data in a database is the main goal of this project. The API will be used by a separate React frontend that communicates with the database.

Requirements

You must have the following for this project.

1) use Active Record can be used to communicate with a database.
Have a one-to-many link between at least two models.
2) Set up the following API as a minimum.
- action creation and reading for both models
3) Create a separate React frontend app that communicates with the API to carry out CRUD operations.
Construct a suitable front end state management system. Once you have received your response from a POST, PATCH, or DELETE request, you should be updating state using a setState method. A GET request should NOT be used to update state.
Use effective OO design patterns. Each of your models should have its own class, and instance and class methods should be created as needed.
3) Your application's routes (both client-side and back end) should adhere to RESTful standards.
Make the best use of your back. Send JSON from the back end to the front end for associated relationships. To retrieve the required data from your database, you should use active record methods in your controller.

4) As an illustration, create a to-do list application using a React front end and a Sinatra back end API that allows users to:

- Make a new task.
- Read the to-do list.
- Update a specific to-do
- Removing a to-do
- Each to-do item can be associated with a category, and each category can include numerous to-do items.

Starting Up Backend Setup
This repository contains all the startup code required to launch a Sinatra backend. To begin, clone this repository. Run bundle install after that to put the gems in.

               $ bundle exec rake server

This will run your server on port http://localhost:9292.

## Frontend  Setup
Your frontend and backend should be in separate repositories.

Make a new repository with a React app for your frontend in a different subdirectory. To do this, run create-react-app to produce the required code for your React frontend by cding out of the backend project directory:

     $ npx create-react-app my-app-frontend




## Author: [Linex Mugambi](https://github.com/LinexMugambi)

## Licence: MIT