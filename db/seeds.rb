# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'factory_bot_rails'

SellerInfo.delete_all
BuyerInfo.delete_all
SellerType.delete_all
ProductType.delete_all
User.delete_all
Salon.delete_all
Product.delete_all
Comment.delete_all
Size.delete_all
Rental.delete_all

buyers = FactoryBot.create_list(:buyer_info, 10)
seller_types = SellerType.create([{ name: 'SP' }, { name: 'SP with PIT' }, { name: 'organization' },
                                  { name: 'organization with PIT' }])

sizes = Size.create([{ size: 42 }, { size: 44 }, { size: 46 }, { size: 48 }, { size: 50 }, { size: 52 }])

product_types = ProductType.create([{ name: 'Dress' }, { name: 'Suit' }, { name: 'Tailcoat' }])

sellers = SellerInfo.create([
                              { unp: 127_098_765, kpp: 184_562_349, supplier_name: 'Independent production', seller_type_id: seller_types[3],
                                freeze: 'false' }, { unp: 677_878_765, kpp: 454_662_349, supplier_name: 'SP "for u"', seller_type_id: seller_types[0], freeze: 'false' }, { unp: 987_658_765, kpp: 156_756_649, supplier_name: 'Independent production', seller_type_id: seller_types[1], freeze: 'false' }, { unp: 900_878_765, kpp: 985_676_549, supplier_name: 'SP "Friend"', seller_type_id: seller_types[2], freeze: 'false' }
                            ])

user_sellers = User.create([
                             { name: 'Sergey', surname: 'Brooks', email: 'serbrook@gmail.con', number: '+375697895467', password: '1234567',
                               password_confirmation: '1234567', role: 'Seller', profileable: sellers[0] }, { name: 'Alena', surname: 'Alenkova', email: 'alenkova@gmail.con', number: '+375890976788', password: '1234567', password_confirmation: '1234567', role: 'Seller', profileable: sellers[1] }, { name: 'Maksim', surname: 'Sablin', email: 'sablin@gmail.con', number: '+375678995499', password: '1234567', password_confirmation: '1234567', role: 'Seller', profileable: sellers[2] }, { name: 'Mark', surname: 'Bobrov', email: 'bobrov@gmail.con', number: '+375890666780', password: '1234567', password_confirmation: '1234567', role: 'Seller', profileable: sellers[3] }
                           ])

user_admins = User.create([
                            { name: 'Karina', surname: 'Stukina', email: 'amongus@gmail.con', number: '+375445474967', password: '1234567',
                              password_confirmation: '1234567', role: 'Admin' }, { name: 'Andrey', surname: 'Frolov', email: 'bigger@gmail.con', number: '+375293334567', password: '1234567', password_confirmation: '1234567', role: 'Admin' }
                          ])

sellers.each do |seller|
  FactoryBot.create_list(:salon, 2, seller_info: seller)
end
salons = Salon.all
user_buyers = User.where(role: 'Buyer')

salons.each do |salon|
  product_types.each do |product_type|
    FactoryBot.create_list(:product, 4, salon: salon, product_type: product_type)
  end
  user_buyers.each do |buyer|
    FactoryBot.create_list(:comment, rand(0..1), commentable: salon, user: buyer)
  end
end
products = Product.all
products.each do |product|
  user_buyers.each do |buyer|
    FactoryBot.create_list(:comment, rand(0..1), commentable: product, user: buyer)
  end
  buyers.each do |buyer|
    FactoryBot.create_list(:rental, rand(0..1), buyer_info: buyer, product: product, size: sizes[rand(0..5)])
    FactoryBot.create_list(:rental, rand(0..1), :active, buyer_info: buyer, product: product, size: sizes[rand(0..5)])
    FactoryBot.create_list(:rental, rand(0..1), :ended, buyer_info: buyer, product: product, size: sizes[rand(0..5)])
  end
end
