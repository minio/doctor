# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#=begin

Document.delete_all
Category.delete_all
User.delete_all

if User.count == 0
  User.new({:email =>'sysadmin@minio.io', :password => 'Doctor!23', :password_confirmation => 'Doctor!23', :admin => true }).save
  
end

c1 = Category.create!(title:'Minio Server',
desc: %{Holds all Minio Server related docs},
)
  d1 = Document.create!(name: 'Minio Quickstart Guide',
  description: %{Minio is an open source object storage server},
  category_id: c1.id,
  link: 'https://raw.githubusercontent.com/deekoder/doctest/master/README.md'
  )
  d2 = Document.create!(name: 'Minio Docker Quickstart Guide',
  description: %{Minio is an open source object storage server},
  category_id: c1.id,
  link: 'https://raw.githubusercontent.com/deekoder/doctest/master/README.md'
  )
  d3 = Document.create!(name: 'Minio FreeBSD Quickstart Guide',
  description: %{Minio is an open source object storage server},
  category_id: c1.id,
  link: 'https://raw.githubusercontent.com/deekoder/doctest/master/README.md'
  )

c2 = Category.create!(title:'Minio Client Utility',
desc: %{Holds all Minio Server related docs},
)

  d4 = Document.create!(name: 'Minio Client Quickstart Guide',
  description: %{Minio Client(mc) provides minimal tools to work with Amazon S3 compatible cloud storage and filesystems},
  category_id: c2.id,
  link: 'https://raw.githubusercontent.com/minio/mc/master/README.md'
  )
  d5 = Document.create!(name: 'Minio Client Complete Guide',
  description: %{Minio Client(mc) provides minimal tools to work with Amazon S3 compatible cloud storage and filesystems},
  category_id: c2.id,
  link: 'https://raw.githubusercontent.com/deekoder/doctest/master/README.md'
  )
  
c3 = Category.create!(title:'Minio Client SDKs',
desc: %{Holds all Minio Server related docs},
)

  d6 = Document.create!(name: 'JavaScript Client Quickstart Guide',
  description: %{Minio Javascript Library for Amazon S3 Compatible Cloud Storage},
  category_id: c3.id,
  link: 'https://raw.githubusercontent.com/minio/minio-js/master/README.md'
  )

  d7 = Document.create!(name: 'JavaScript Client API  Reference',
  description: %{Minio Javascript Library API Reference},
  category_id: c3.id,
  link: 'https://raw.githubusercontent.com/deekoder/doctest/master/README.md'
  )
  
  d8 = Document.create!(name: 'Java Client Quickstart Guide',
  description: %{Minio Java Library for Amazon S3 Compatible Cloud Storage},
  category_id: c3.id,
  link: 'https://raw.githubusercontent.com/deekoder/doctest/master/README.md'
  )

  d9 = Document.create!(name: 'Java Client API Reference',
  description: %{Minio Java Library API Reference},
  category_id: c3.id,
  link: 'https://raw.githubusercontent.com/deekoder/doctest/master/README.md'
  )
  
  d10 = Document.create!(name: 'Python Client Quickstart Guide',
  description: %{Minio Python Library for Amazon S3 Compatible Cloud Storage},
  category_id: c3.id,
  link: 'https://raw.githubusercontent.com/minio/minio-py/master/README.md'
  )

  d11 = Document.create!(name: 'Python Client API Reference',
  description: %{Minio Python Library API Reference},
  category_id: c3.id,
  link: 'https://raw.githubusercontent.com/deekoder/doctest/master/README.md'
  )
  
  d12 = Document.create!(name: 'Golang Client Quickstart Guide',
  description: %{Minio Golang Library for Amazon S3 Compatible Cloud Storage},
  category_id: c3.id,
  link: 'https://raw.githubusercontent.com/minio/minio-go/master/README.md'
  )

  d13 = Document.create!(name: 'Golang Client API  Reference',
  description: %{Minio Golang Library API Reference},
  category_id: c3.id,
  link: 'https://raw.githubusercontent.com/deekoder/doctest/master/README.md'
  )



c4 = Category.create!(title:'Full Examples',
desc: %{Holds all Minio Server related docs},
)

  d14 = Document.create!(name: 'Javascript Shopping App',
  description: %{Minio Java Library for Amazon S3 Compatible Cloud Storage},
  category_id: c4.id,
  link: 'https://raw.githubusercontent.com/minio/minio-js-store-app/master/README.md'
  )

  d15 = Document.create!(name: 'Java Photo API Service',
  description: %{Minio Java Library API Reference},
  category_id: c4.id,
  link: 'https://raw.githubusercontent.com/minio/minio-java-rest-example/master/README.md'
  )
  
  d16 = Document.create!(name: 'Go Music Player App',
  description: %{Minio Java Library for Amazon S3 Compatible Cloud Storage},
  category_id: c4.id,
  link: 'https://raw.githubusercontent.com/minio/minio-go-media-player/master/README.md'
  )

  d17 = Document.create!(name: 'Android Photo App',
  description: %{Minio Java Library API Reference},
  category_id: c4.id,
  link: 'https://raw.githubusercontent.com/minio/android-photo-app/master/README.md'
  )
  
  d16 = Document.create!(name: 'Swift Photo App',
  description: %{Minio Java Library for Amazon S3 Compatible Cloud Storage},
  category_id: c4.id,
  link: 'https://raw.githubusercontent.com/minio/swift-photo-app/master/README.md'
  )

  d17 = Document.create!(name: 'RoR Resume Uploader App',
  description: %{Minio Java Library API Reference},
  category_id: c4.id,
  link: 'https://raw.githubusercontent.com/minio/ror-resumeuploader-app/master/README.md'
  )

c5 = Category.create!(title:'Reciepes',
desc: %{Holds all Minio Server related docs},
)
c6 = Category.create!(title:'Miscellaneous',
desc: %{Holds all Minio Server related docs},
)
c7 = Category.create!(title:'Related Projects',
desc: %{Holds all Minio Server related docs},
)



#=end