# README

## Overview

This is a simple job application tracker. Users can create, read, update, and delete certian fields
in a job application.

- Ruby version - 2.6.5
- Rails version - 6.0.2

- Get up and started

  1. Run `bundle install`
  2. run `rake db:migrate`

- Important Ruby gems

  1. devise - handles oauth and user registration
  2. omniauth-github - allows oauth authentication with GitHub
  3. sqlite3 - configures default database

- Database creation

  1. When `rake db:migrate` is run, the database should be create. Note that the default database
     is sqlite3.

- Security
  1. Note that the master.key in config is not tracked. You will need to generate your own
     master.key and create a corresponding credentials.yml.enc. Follow these instructions to do so:
     https://gist.github.com/db0sch/19c321cbc727917bc0e12849a7565af9
