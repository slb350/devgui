devgui
======

Main devops page to link to other apps and sites used for imatchative!

This is a sinatra based app, and I use 'puma -d' to launch server side, after stopping nginx via sudo service nginx stop. If nginx is active when you try and restart puma, it will not work. You must stop nginx, kill and restart puma, then start nginx.

The core of the application is in the app.rb file which controls all the routing.
