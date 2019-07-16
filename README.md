# sinatra-crud-diary
Simple C.R.U.D. application for saving notes, built with Sinatra.


#### Services
  - [Sinatra](http://sinatrarb.com/) | [Postgres](https://www.postgresql.org/)


#### App Setup instructions
  - Make sure you have Ruby and PostgresQL installed in your machine.
  - Clone repo: `git clone https://github.com/emekafredy/sinatra-crud-diary.git`
  - Change directory with `cd sinatra-crud-diary`
  - Run `bundle install` to install dependencies
  - Run `rake db:create` and `rake db:migrate` to create the needed databases and run migrations.
  - Run `shotgun` to start up the app.
  - Visit the url `http://localhost:9393` to run the app.
