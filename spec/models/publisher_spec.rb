require 'spec_helper'

describe Publisher do
  it { should have_many(:books) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
end
