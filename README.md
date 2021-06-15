The link to my front end repo is here https://github.com/EG-Lear/phase-3-project-front-end.git

This react app is titled Playlist Creater as defined on the login screen

Front End:
   on the front end it has 4 different routes defined with restful routing based on what information the page displays.  All data entered persists

   there is the default which is used for login, for this app I did create a working user registration feature as well which is embedded in the login and based on a setting in state will load extra input fields for the registration process

   after logging in or registering it will bring you to a landing page which represents the other state of the default route for if you are logged in, it includes a small welcome message and give you access to the navbar 

   the navbar has 3 options other then home

   the first is all songs which displays all of the songs stored in the database in alphabetical order and provides which artist is the song is known for and the genre

   the artist route orders all of the songs in the database by artist also alphabetically, the meain concept behind the front end is the feature to create playlist so the first two routes are for finding out what songs already persist in the database
   
   the fourth route displays all of the playlists that have been created in alphabetical order

   on any of the 3 main content pages you have access to 4 different forms on the right for the purpose of manipulating the information in the database

   you can create or delete new songs, you can create new artists and add songs to existing artists, you can also create, delete, and modify the playlists

   all the forms are labeled and include instructions for use

   the front end maintains very basic css styling throughout



Back End:
   The back end is as intended a sqlite3 database using activerecord

   the main models are User, Song, Artist, and Playlist

   User is mostly for creating the user information

   Song is where most of the heavy lifting gets handled and serves as a major focal point as it has 2 belongs to associations and 1 has many which is the many to many using has and belongs to many in order to allow the same song class to be part of multiple playlists

   The artist file is fairly simple maintaing a has many association with song

   The playlist has a has and belongs to many association with songs again as to allow songs to belong to multiple playlists with having to make multiple classes of songs with the same name to put them in different playlists. 

   I decided to use the has and belongs to many association as I had a much easier time getting it to work for the purpose of this project since I had no need for the table to create any other functionality as one might need to with a Doctor/Appointment/Patient where the doctor has many patients through appointment and vice versa.  Appointment is also a faily important concept in that obviously as it would probably maintain things like time, date, and location

   I creatted several other files and classes as well for the purpose of grouping custom methods that handle similar but different processes as to keep the amount of information on the main application file within reason

   there are 5 different tables created during migrate 1 for each of the 4 main class models and 1 to server as a join table for a has and belongs t0 many association

   there is also a seed file as expected filled with some data so that I could reset my database using destroy and then re-seed as needed while in development







Commented out stuff that came with repo
<!-- # Phase 3 Project

## Requirements

1. Access a Sqlite3 database using Active Record.
2. You should have a minimum of two models with a one to many relationship.
3. You should build out a simple **React** frontend to give your user 3 of the 4
   CRUD abilities for at least one of your resources. For example, build out a
   todo list. A user should be able to create a new todo, see all todos,
   update a todo item, and delete a todo. Todos can be grouped into categories,
   so that a todo has many categories and categories have many todos.
4. Use good OO design patterns. You should have separate classes for your
   models.

## Getting Started

Clone down this repository. A basic Rack app is located in the `backend` folder.

First, cd into the `backend` folder and run `bundle install` in your backend
folder to install your gems.

The `app/application.rb` file has an example GET route. Replace this route with
routes for your project!

**Start your server with:**

```sh
shotgun --port=9292
```

> **Note:** This will run your server on port
> [http://localhost:9292](http://localhost:9292).
> [shotgun](https://github.com/rtomayko/shotgun) is a ruby gem that will
> automatically reload your Rack server. You may still need to refresh your
> browser to see changes.

Your backend and your frontend should be in two different repositories. Create a
new repository in a separate folder with a React app for your frontend using
[create-react-app][].

### Fetch Example

Your React app should make fetch requests to your Rack backend! Here's an
example:

```js
fetch("http://localhost:9292/test")
  .then((res) => res.json())
  .then(console.log);
```

[create-react-app]: https://create-react-app.dev/docs/getting-started -->




