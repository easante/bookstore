require 'spec_helper'

describe User do
  it "requires a first name" do
    john = User.new(email: "john@example.com", password: "password",
                    first_name: "", last_name: "Bull")
    expect(john).not_to be_valid
    expect(john.errors[:first_name].any?).to be_true

    john.first_name = 'John'
    expect(john).to be_valid
  end

  it "requires a last_name" do
    john = User.new(email: "john@example.com", password: "password",
                    first_name: "John", last_name: "")
    expect(john).not_to be_valid
    expect(john.errors[:last_name].any?).to be_true

    john.last_name = 'Bull'
    expect(john).to be_valid
  end

  it "requires an email" do
    john = User.new(email: "", password: "password", first_name: "John",
                    last_name: "Bull")
    expect(john).not_to be_valid
    expect(john.errors[:email].any?).to be_true

    john.email = 'john@example.com'
    expect(john).to be_valid
  end

  it "requires a password" do
    john = User.new(email: "john@example.com", password: "", first_name: "John",
                    last_name: "Bull")
    expect(john).not_to be_valid
    expect(john.errors[:password].any?).to be_true

    john.password = 'password'
    expect(john).to be_valid
  end

end
