Fabricator(:cart_item) do
  cart
  book
  price { Faker::Number.number(2) }
  quantity { Faker::Number.number(1) }
end
