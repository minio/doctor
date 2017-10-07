#
 # Doctor, (C) 2016 Minio, Inc.
 #
 # Licensed under the Apache License, Version 2.0 (the "License");
 # you may not use this file except in compliance with the License.
 # You may obtain a copy of the License at
 #
 #     http://www.apache.org/licenses/LICENSE-2.0
 #
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.
#

class Document < ActiveRecord::Base
  belongs_to :category
  before_save :update_slug
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :link, :presence => true
  validates :name, :length => { :minimum => 2 }
  validates :name, :uniqueness => true
  validates :link, :url => true

  private

  def update_slug
    self.slug = name.parameterize
  end
end
