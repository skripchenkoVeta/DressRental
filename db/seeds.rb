# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

SellerInfo.delete_all
BuyerInfo.delete_all
SellerType.delete_all
ProductType.delete_all
User.delete_all
Salon.delete_all
Product.delete_all
Comment.delete_all
Size.delete_all

seller_type_1 = SellerType.create(name: 'SP')
seller_type_2 = SellerType.create(name: 'SP with PIT')
seller_type_3 = SellerType.create(name: 'organization')
seller_type_4 = SellerType.create(name: 'organization with PIT')

size_1 = Size.create(size: 42)
size_2 = Size.create(size: 44)
size_3 = Size.create(size: 46)
size_4 = Size.create(size: 48)
size_5 = Size.create(size: 50)
size_6 = Size.create(size: 52)

product_type_1 = ProductType.create(name: 'Headdress')
product_type_2 = ProductType.create(name: 'Dress')
product_type_3 = ProductType.create(name: 'Suit')
product_type_4 = ProductType.create(name: 'Tailcoat')
product_type_5 = ProductType.create(name: 'Accessory')

seller_1 = SellerInfo.create(unp: 127098765, kpp: 184562349, supplier_name: 'Independent production',seller_type_id: seller_type_3.id, freeze: 'false')
seller_2 = SellerInfo.create(unp: 677878765, kpp: 454662349, supplier_name: 'SP "for u"',seller_type_id: seller_type_4.id, freeze: 'false')
seller_3 = SellerInfo.create(unp: 987658765, kpp: 156756649, supplier_name: 'Independent production',seller_type_id: seller_type_1.id, freeze: 'false')
seller_4 = SellerInfo.create(unp: 900878765, kpp: 985676549, supplier_name: 'SP "Friend"',seller_type_id: seller_type_2.id, freeze: 'false')

buyer_1 = BuyerInfo.create(birthday: '1998-02-11', address: 'ул. Логово,1',freeze: 'false')
buyer_2 = BuyerInfo.create(birthday: '2003-07-01', address: 'ул. Лог,10', freeze: 'false')
buyer_3 = BuyerInfo.create(birthday: '1990-10-09', address: 'ул. Гов,190-А', freeze: 'false')

user_seller_1 = User.create(name: 'Sergey', surname: 'Brooks', email: 'serbrook@gmail.con', number: '+375697895467', password: '1234567',password_confirmation: '1234567', role: 'Seller', profileable: seller_1)
user_seller_2 = User.create(name: 'Alena', surname: 'Alenkova', email: 'alenkova@gmail.con', number: '+375890976788', password: '1234567',password_confirmation: '1234567', role: 'Seller',profileable: seller_2)
user_seller_3 = User.create(name: 'Maksim', surname: 'Sablin', email: 'sablin@gmail.con', number: '+375678995499', password: '1234567',password_confirmation: '1234567', role: 'Seller', profileable: seller_3)
user_seller_4 = User.create(name: 'Mark', surname: 'Bobrov', email: 'bobrov@gmail.con', number: '+375890666780', password: '1234567',password_confirmation: '1234567', role: 'Seller',profileable: seller_4)

user_buyer_1 = User.create(name: 'Vladislav', surname: 'Burdo', email: 'vladik@gmail.con', number: '+375293045600', password: '1234567',password_confirmation: '1234567', role: 'Buyer',profileable: buyer_1)
user_buyer_2 = User.create(name: 'Yana', surname: 'Kurko', email: 'kurko@gmail.con', number: '+375295555678', password: '1234567',password_confirmation: '1234567', role: 'Buyer',profileable: buyer_2)
user_buyer_3 = User.create(name: 'Alina', surname: 'Lopatina', email: 'lopatkina@gmail.con', number: '+37529304234', password: '1234567',password_confirmation: '1234567', role: 'Buyer',profileable: buyer_3)

user_admin_1 = User.create(name: 'Karina', surname: 'Stukina', email: 'amongus@gmail.con', number: '+375445474967', password: '1234567',password_confirmation: '1234567', role: 'Admin')
user_admin_2 = User.create(name: 'Andrey', surname: 'Frolov', email: 'bigger@gmail.con', number: '+375293334567', password: '1234567',password_confirmation: '1234567', role: 'Admin')

salon_1 = Salon.create(name: 'Fly', address: 'Loma,65', seller_info_id: seller_1.id)
salon_2 = Salon.create(name: 'Rose', address: 'Komarov,89-A', seller_info_id: seller_1.id)
salon_3 = Salon.create(name: 'Fire', address: 'Temir,12', seller_info_id: seller_2.id)
salon_4 = Salon.create(name: 'Flower', address: 'Vstrech,1-A', seller_info_id: seller_3.id)
salon_5 = Salon.create(name: 'Sun', address: 'Kartech,6', seller_info_id: seller_4.id)

product_1 = Product.create(name: 'Wedding dress', description: 'Very beautiful dress', price: 180.00, product_type_id: product_type_2.id, salon_id: salon_1.id )
product_2 = Product.create(name: 'Red dress', description: 'Very red dress', price: 18.60, product_type_id: product_type_2.id, salon_id: salon_1.id )
product_3 = Product.create(name: 'Original dress', description: 'An excellent choice for a special day', price: 100.10, product_type_id: product_type_2.id, salon_id: salon_1.id )
product_4 = Product.create(name: 'White suit', description: 'An excellent choice for a special day', price: 45.00, product_type_id: product_type_3.id, salon_id: salon_1.id )
product_5 = Product.create(name: 'Suit "Beautiful"', description: 'Made with quality materials', price: 19.99, product_type_id: product_type_3.id, salon_id: salon_2.id )
product_6 = Product.create(name: 'Blue dress', description: 'Very blue dress', price: 13.00, product_type_id: product_type_2.id, salon_id: salon_2.id )
product_7 = Product.create(name: 'White suit', description: 'For the most fashionable', price: 60.60, product_type_id: product_type_3.id, salon_id: salon_2.id )
product_8 = Product.create(name: 'Black dress', description: 'Very beautiful dress', price: 70.20, product_type_id: product_type_2.id, salon_id: salon_2.id )
product_9 = Product.create(name: 'Nice suit', description: 'Made with quality materials', price: 50.00, product_type_id: product_type_3.id, salon_id: salon_3.id )
product_10 = Product.create(name: 'Headdress "For you"', description: 'An excellent choice for a special day', price: 10.60, product_type_id: product_type_1.id, salon_id: salon_3.id )
product_11 = Product.create(name: 'White dress', description: 'Very beautiful dress', price: 15.00, product_type_id: product_type_2.id, salon_id: salon_4.id )
product_12 = Product.create(name: 'Good headdress', description: 'For the most fashionable', price: 22.00, product_type_id: product_type_1.id, salon_id: salon_4.id )
product_13 = Product.create(name: 'Headdress "Nice day"', description: 'An excellent choice for a special day', price: 87.00, product_type_id: product_type_1.id, salon_id: salon_4.id )
product_14 = Product.create(name: 'Good dress', description: 'Made with quality materials', price: 17.00, product_type_id: product_type_2.id, salon_id: salon_5.id )
product_15 = Product.create(name: 'Beautiful dress', description: 'Very beautiful dress', price: 31.00, product_type_id: product_type_2.id, salon_id: salon_5.id )
product_16 = Product.create(name: 'Tailcoat "Lost"', description: 'Made with quality materials', price: 90.00, product_type_id: product_type_4.id, salon_id: salon_5.id )
product_17 = Product.create(name: 'Good tailcoat', description: 'An excellent choice for a special day', price: 89.00, product_type_id: product_type_4.id, salon_id: salon_5.id )
product_18 = Product.create(name: 'Tailcoat "Kawaii"', description: 'For the most fashionable', price: 88.00, product_type_id: product_type_4.id, salon_id: salon_5.id )

comment_salon_1 = Comment.create(message: 'Great salon!',user_id:user_buyer_1.id,commentable:salon_1)
comment_salon_2 = Comment.create(message: 'Recommend!',user_id:user_buyer_2.id,commentable:salon_1)
comment_salon_3 = Comment.create(message: 'Life is better than in the photo. ',user_id:user_buyer_1.id,commentable:salon_2)
comment_salon_4 = Comment.create(message: 'Not advise, terrible staff and quality of things',user_id:user_buyer_3.id,commentable:salon_3)
comment_salon_5 = Comment.create(message: 'Recommend!',user_id:user_buyer_3.id,commentable:salon_4)
comment_salon_6 = Comment.create(message: 'Not advise, terrible staff and quality of things',user_id:user_buyer_2.id,commentable:salon_5)

comment_product_1 = Comment.create(message: 'Nice dress for your money!',user_id:user_buyer_1.id,commentable:product_1)
comment_product_2 = Comment.create(message: 'So-so ...',user_id:user_buyer_2.id,commentable:product_1)
comment_product_3 = Comment.create(message: 'I do not advise, the quality is terrible.',user_id:user_buyer_1.id,commentable:product_3)
comment_product_4 = Comment.create(message: 'I found a hole in my clothes!1!!',user_id:user_buyer_1.id,commentable:product_4)
comment_product_5 = Comment.create(message: 'So-so ...',user_id:user_buyer_3.id,commentable:product_4)
comment_product_6 = Comment.create(message: 'I found a hole in my clothes!1!!',user_id:user_buyer_3.id,commentable:product_8)
comment_product_7 = Comment.create(message: 'Good quality.',user_id:user_buyer_1.id,commentable:product_8)
comment_product_8 = Comment.create(message: 'I do not advise, the quality is terrible.',user_id:user_buyer_3.id,commentable:product_1)
comment_product_9 = Comment.create(message: 'So-so ...',user_id:user_buyer_2.id,commentable:product_8)
comment_product_10 = Comment.create(message: 'I do not advise, the quality is terrible.',user_id:user_buyer_2.id,commentable:product_4)
comment_product_11 = Comment.create(message: 'Good quality.',user_id:user_buyer_2.id,commentable:product_1)
comment_product_12 = Comment.create(message: 'Nice dress for your money!',user_id:user_buyer_3.id,commentable:product_3)
