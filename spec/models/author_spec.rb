require 'spec_helper'

describe Author do
  it 'requires a first_name' do
    author = Fabricate.build(:author, first_name: nil)

    expect(author).not_to be_valid
    expect(author.errors[:first_name].any?).to be_true
  end

  it 'requires a last_name' do
    author = Fabricate.build(:author, last_name: nil)

    expect(author).not_to be_valid
    expect(author.errors[:last_name].any?).to be_true
  end

  describe '#full_name' do
    it 'returns the  full name of author' do
      author = Fabricate(:author, first_name: 'John', last_name: 'Bull')
      expect(author.full_name).to eq('John Bull')
    end
  end

  it { should have_many(:publications) }
  it { should have_many(:books).through(:publications) }
end
