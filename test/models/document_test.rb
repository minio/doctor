require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test 'does not allow duplicate document name per category' do
    category = Category.create(title: 'Main')
    document = category.documents.create(name: 'Note',
                                         link: 'http://example.com')
    duplicated = category.documents.new(name: 'Note',
                                        link: 'http://example.com')
    assert document.save
    assert_not duplicated.valid?
    assert_not duplicated.save
  end

  test 'duplicated document name should have correct slug' do
    first_category = Category.create(title: 'Main')
    second_category = Category.create(title: 'Secondary')
    document = first_category.documents.create(name: 'Note',
                                               link: 'http://example.com')
    document_with_same_name = second_category.documents.create(name: 'Note',
                                                               link: 'http://example.com')

    assert_equal document.slug, 'note'
    assert_equal document_with_same_name.slug, 'secondary-note'
  end
end
