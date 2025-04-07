# ShiftCare ClientVerse
=========================


A minimalist command-line Ruby application that for now offers two commands:
A. Search for clients in the dataset with names partially matching a given query.
B. Find clients in the dataset with the email, and show those those duplicates if any.


## Prerequisites
1. Linux/Mac OS
For this project we used **Ubuntu 22.04**

2. Install Ruby
For this project we used **ruby-3.1.2**
(Not tested with other versions of Ruby.)

See https://www.ruby-lang.org/en/documentation/installation/

3. (Optional) Install git


## Setup
* You may clone this project from GitHub if you don't have a copy yet.
git clone <github_project_url>
* Run bundle install
`cd client_verse`
`bundle install`


## Running the specs
* Running all specs:
`bundle exec rspec`
* Running individual spec: e.g.
`bundle exec rspec spec/lib/client_verse/clients/search_spec.rb`


## Running the CLI commands
* Search
`bundle exec thor clients:search -q <query_string>`
`bundle exec thir clients:search -q Jane`
* Finding Duplicates
`bundle exec thor clients:find_duplicates --email <email>`
`bundle exec thor clients:find_duplicates --email jane.smith@yahoo.com`
* See available commands:
`bundle exec thor list`
* Get help on a command
`bundle exec thor help <command>`
`bundle exec thor help clients:search`