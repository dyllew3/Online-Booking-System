# Online-Booking-System
In order to setup the system fully follow these instructions:
If you don't have Ruby, run sudo apt-get install ruby
If you don't have Rails, but do have Ruby then run sudo gem install rails
Download the folder.
Go into Online-booking-system/Online-Booking-system/ this readme file is located in Online-Booking-System so
it should be above this file
When you enter the folder run these commands :
  + sudo apt-get install libsqlite3-dev 
  + sudo gem install sqlite3-ruby
  + sudo apt-get install ruby-dev
  + sudo gem install bundler
  
Then run the commands:
  + bundle install
  + rake db:migrate
  
Now the server should be working so in order to run the server run the command:
  +rails server
