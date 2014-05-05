# README

# Good Vids basic Postgres Sinatra CRUD app

not-so-restful routes. A nicer version is heading over to [https://github.com/craftninja/blog_good_vids](https://github.com/craftninja/blog_good_vids) on May 5th.

# create databases

CD into project directory and run the following in the command line:
    $ psql -d postgres -U <username> -f scripts/create_database_good_vids.sql

# create tables

    $ sequel -m migrations postgres://<username>:<password>@localhost/good_vids_development
    $ sequel -m migrations postgres://<username>:<password>@localhost/good_vids_test

#Fork it! Clone it! Run it! Change it!
