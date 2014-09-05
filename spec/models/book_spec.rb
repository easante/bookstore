require 'spec_helper'

describe Book do
  it { should belong_to(:publisher) }
  it { should have_many(:publications) }
  it { should have_many(:authors) }
  it { should have_many(:authors).through(:publications) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:isbn) }
  it { should validate_numericality_of(:page_count).only_integer }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.0) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:published_at) }
  it { should validate_presence_of(:publisher_id) }

  it "should return an empty array if there is no matching book title" do
    rails3way = Fabricate(:book, title: 'The Rails 3 Way')

    expect(Book.search_by_title("Man")).to eq []
  end

  it "should return an array with one element for one matching book title" do
    rails3way = Fabricate(:book, title: 'The Rails 3 Way')

    expect(Book.search_by_title("Way")).to eq [rails3way]
  end

  it "should return an array all matching book titles" do
    rails3way = Fabricate(:book, title: 'The Rails 3 Way')
    beginrails3 = Fabricate(:book, title: 'Beginning Rails 3')

    expect(Book.search_by_title("Rails 3").to_a).to eq [beginrails3, rails3way]
  end
end
