# shelterAid
Web application to assist homeless shelters with inventory and other tedious tasks. This is a final project for Organization of Programming Languages (CPSC 326) at Gonzaga University. This is designed for the local homeless
shelter.

Screenshots will be here in a few days (4.29)

## Features
- Written using Elm, a completely functional language
- Connects to a json database (express.js)
- Made for free for the community homeless shelter

## Running
```
npm install
yarn install

yarn start
```

## TODO

* [x] enable new residents
* [x] improve navigation
* [x] remove residents (buggy)
* [ ] login page/home screen
* [ ] add some sick styles!!!
* [ ] add about page

## Bugs
- removing last resident from list then adding a new one causes a bad payload.
- ID generator is actually just a bug in sending data to server.

## Future Extensions
- Verify changes to user (i.e. dob is actually a dob, Age is a number etc etc)
- Inventory System, track which resident is gifted each donation
- Allow user to upload profile images for each person.

![Stevie](http://cdn4.thr.com/sites/default/files/2014/11/steve_buscemi.jpg "Saving Lives since 1959")
