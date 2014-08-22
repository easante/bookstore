require 'spec_helper'

describe User do
  it "requires a name" do
    john = User.new(email: "john@example.com", password: "password", name: "")
    expect(john).not_to be_valid
    expect(john.errors[:name].any?).to be_true

    john.name = 'John'
    expect(john).to be_valid
  end

  it "requires an email" do
    john = User.new(email: "", password: "password", name: "John")
    expect(john).not_to be_valid
    expect(john.errors[:email].any?).to be_true

    john.email = 'john@example.com'
    expect(john).to be_valid
  end

  it "requires a password" do
    john = User.new(email: "john@example.com", name: "John", password: "")
    expect(john).not_to be_valid
    expect(john.errors[:password].any?).to be_true

    john.password = 'password'
    expect(john).to be_valid
  end

end
