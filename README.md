# ShiftCare ClientVerse


A minimalist command-line Ruby application that for now offers two commands: <br><br>
A. Search for clients in the dataset with names partially matching a given query. <br>
B. Find clients in the dataset with the email, and show those those duplicates if any.


## Prerequisites
1. Linux/Mac OS <br>
  For this project we used **Ubuntu 22.04**

2. Install Ruby <br>
  For this project we used **ruby-3.1.2** <br>
  See https://www.ruby-lang.org/en/documentation/installation/ <br>
  (Not tested with other versions of Ruby.)


3. (Optional) Install git


## Setup
* You may clone this project from GitHub if you don't have a copy yet. <br>
* Run bundle install inside project folder.
```
git clone https://github.com/peekaacho/shiftcare_client_verse
cd shiftcare_client_verse
bundle install
```


## Running the specs
* Running all specs: <br>
`bundle exec rspec`
* Running individual spec: e.g. <br>
`bundle exec rspec spec/lib/client_verse/clients/search_spec.rb`


## Console Access
* Run console executable:  `./bin/console` <br>
```
./bin/console 
3.1.2 :001 > ClientVerse::Client
 => ClientVerse::Client(keyword_init: true) 
3.1.2 :002 > ClientVerse::Clients
 => ClientVerse::Clients 
3.1.2 :003 > ClientVerse::Clients.constants
 => [:CLI, :DuplicatesFinder, :Search] 
3.1.2 :004 > ClientVerse::Clients::Search
 => ClientVerse::Clients::Search 
3.1.2 :005 > 

```


## Running the CLI commands
* Search <br>
`bundle exec thor clients:search -q <query_string>` <br>
`bundle exec thir clients:search -q Jane` <br>
* Finding Duplicates <br>
`bundle exec thor clients:find_duplicates --email <email>` <br>
`bundle exec thor clients:find_duplicates --email jane.smith@yahoo.com` <br>
* See available commands: <br>
`bundle exec thor list` <br>
* Get help on a command <br>
`bundle exec thor help <command>` <br>
`bundle exec thor help clients:search` <br>

