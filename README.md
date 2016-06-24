# Project Doctor
* Doctor is a simple documentation framework. 
* It renders content from hosted markdown files. 
* It is useful when you have multiple Readme.MD files in github and they need to be aggregated to form your docs.

## Pre-Requisites
### OSX
* Install Ruby 2.2.2 using the instructions [here](https://rvm.io/rvm/install).
* Install Rails 4.2.4 using the instructions [here](https://rvm.io/rvm/install).
* Install Postgres using the command `brew install postgres`. Configure Launch Agent to start it automatically or use the command `pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start` to start it manually.

### Ubuntu
* Install Rails & Ruby using the instructions [here](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-ubuntu-14-04-using-rvm).
* Install Postgres using the instructions [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-14-04).

**Note** - Ping us on our [gitter channel](https://gitter.im/minio/minio) to report any installation issues on your platform.

## How to run Doctor
```
> git clone https://github.com/minio/doctor.git
> cd doctor
> bundle install
> rake db:create
> rake db:migrate
> rake db:seed
> rails s
```
Now visit http://localhost:3000 

## Organization
* Documents are organized under Categories. 
* Create a new Category : http://localhost:3000/category/new
* Create a new Document : http://localhost:3000/document/new
* Required : All documents need to be associated under a Category



