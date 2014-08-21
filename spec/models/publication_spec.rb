require 'spec_helper'

describe Publication do
  subject { Fabricate(:publication) }

  it { should belong_to(:author) }
  it { should belong_to(:book) }
end
