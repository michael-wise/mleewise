## Preface
If you notice bad/wrong explanations or security problems, please let me know. I am self-taught and would really enjoy hearing your perspective. m.lee.wise@gmail.com.

## Synopsis

My website on rails. My last website was not interactive, and had no mechanisms for users or updates. My new site is Rails 5+ and has some cool components.
1. **Users and sessions** - Rails 3 and greater ships with ActiveModel::SecurePassword, where the method has_secure_password sets methods to add and authenticate against a brypt password. I use this as a quick way to authenticate. I've disabled the option for new users to register by not providing a route in routes.rb. Later, I will convert to Facebook OAuth, and use manually-set admin flags in the user database.
3. **Events** - I post technology events in Miami so people have a quick, convenient place to see what's going on. There are other sites that list events, but they are polluted by irrelevant events, or segmented by where people choose to post an event (some venues post only to eventbrite). 
I do not enter events manually, but rather use an admin page to enter an eventbrite URL. The events controller then uses the eventbrite API to get information about that event, and stores it in a local events database. Currently, only eventbrite events are supported, though I will add a form for manually entering events, and maybe even pull from other sources that list events. 

4. **Blog** - Not added yet.
5. **Portfolio** - 

## Installation
```
$ bundle install --without prodouction
$ bundle update
$ rails db:migrate
$ rails test
$ rails s
```

Note! The bcrypt gem has problems on windows, and likely won't work unless you point your gemfile directly to the bcrypt gem github repo. 
    gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'
### Eventbrite API (for techinmiami#newevent copying of events from eventbrite via pasting an eventbrite URL (form only visible to admin users logged in to my site))
Get an eventbrite secret by creating an app at https://www.eventbrite.com/myaccount/apps/ . Find "Your personal OAuth token" and set it to an OS environment variable named 'eventbritePersonal'.

