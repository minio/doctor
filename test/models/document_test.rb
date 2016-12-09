require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test "document name should be unique for each category" do
    category1 = Category.create(title: 'cat1')
    Document.create(category: category1, name: 'test', link: "http://ex.com")
    new_doc = Document.new(category: category1, name: 'test', link: "http://ex.com")

    assert_not new_doc.valid?
    new_doc.category = Category.create(title: 'cat2')
    assert new_doc.save
  end

  test "documents with same names should have correct slugs" do
    new_doc = Document.create(category: Category.create(title: 'cat1'), name: 'test', link: "http://ex.com")
    new_doc1 = Document.create(category: Category.create(title: 'cat2'), name: 'test', link: "http://ex.com")
    assert_equal new_doc.slug, new_doc.name
    assert_equal new_doc1.slug, "#{new_doc1.category.title}/#{new_doc1.name}"
  end
end
