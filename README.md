# Project Doctor
* Doctor is a simple documentation framework. 
* It renders content from hosted markdown files. 
* It is useful when you have multiple Readme.MD files in github and they need to be aggregated to form your docs.

## Pre-Requisites
* Install Rails (use rvm or rbenv)
* Install Ruby (use rvm or rbenv)

## How to run Doctor
```
> git clone https://github.com/minio/doctor.git
> cd doctor
> bundle install
> rake db:migrate
> rake db:seed
> rails s
```
Now visit http://localhost:3000 

## Organization
* Documents are organized under Categories. 
* Create a new Category : http://localhost:3000/category/new
* Create a new Document : http://localhost:3000/document/new
* All documents need to be associated in a category


