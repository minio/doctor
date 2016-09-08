<p align="center">
<img src="https://github.com/minio/doctor/blob/master/public/Doctor_logo_888x1024.png?raw=true" width="140px">
</p>

# Doctor
* Doctor is a Documentation Server for all your project docs.
* Doctor beautifully decouples document serving and document contents.
* Create your docs in markdown. Store them anywhere (github/dropbox/google drive/ anywhere really).
* Login to Doctor's Dashboard. Setup links to your doc files in Doctor's Dashboard.
* You are done!


## Pre-Requisites to Deploy Doctor

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
> rake db:drop
> rake db:setup
> rails s
```
Now visit http://localhost:3000

Use `sysadmin@doctor.io` with password `Doctor!23` to login. Visit [http://localhost:3000](http://localhost:3000) to navigate the docs. This can be changed anytime via the Dashboard. We highly recommend that you do if you use Doctor in deployment.

### Using Docker
```bash
> git clone https://github.com/minio/doctor.git
> cd doctor
> docker-compose up
```

## Organization
* Documents are organized under Categories.
* Login to the dashboard
* Step 1 : Use the Dashboard to create a new Category : http://localhost:3000/category/new
* Step 2 : Use the Dashboard to create a link to a new Document : http://localhost:3000/document/new
* Step 3: Paste the raw URL to the md file when linking a new document. The "Raw" button is on the top of the MD file in github.
* Required : All documents need to be associated under a Category
