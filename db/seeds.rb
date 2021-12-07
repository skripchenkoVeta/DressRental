# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

seller_types_table = SellerType.create(name: 'ИП')
seller_types_table = SellerType.create([
                                         { name: 'ИП' },
                                         { name: 'не ИП' },
                                         { name: 'организация' },
                                         { name: 'не организация' }
                                       ])

product_types_table = ProductType.create([
                                           { name: 'Платье' },
                                           { name: 'Костюм' },
                                           { name: 'Фрак' }
                                         ])

seller_table = SellerInfo.create([
                                   { unp: 127, kpp: 189, supplier_name: 'Валера',
                                     seller_type_id: seller_types_table.last },
                                   { unp: 543, kpp: 145, supplier_name: 'ИП "Подружка"',
                                     seller_type_id: seller_types_table.first },
                                   { unp: 134, kpp: 345, supplier_name: 'самостоятельное производство',
                                     seller_type_id: seller_types_table.last }
                                 ])

users_seller_table = User.create([
                                   { name: 'Сергей', surname: 'Серегин', email: 'seregin@gmail.con', number: '37456', password: '1234', role: 'seller',
                                     profileable: seller_table.last },
                                   { name: 'Алена', surname: 'Архимина', email: 'алена@gmail.con', number: '3234', password: '1234', role: 'seller',
                                     profileable: seller_table.first }
                                 ])
users_buyer_table = User.create([
                                  { name: 'Аська', surname: 'Пугачева', email: 'аська@gmail.con', number: '1236', password: '1234', role: 'buyer',
                                    profileable: seller_table.last },
                                  { name: 'Антон', surname: 'Дятлов', email: 'дятлов@gmail.con', number: '3556', password: '1234', role: 'buyer',
                                    profileable: seller_table.first }
                                ])

salons_table = Salon.create([
                              { name: 'ИП Серегин', address: 'ул.Пупкино,65', seller_info_id: seller_table.last },
                              { name: 'ИП НеСерегин', address: 'пер.Московский,3', seller_info_id: seller_table.first },
                              { name: 'ИП Красота', address: 'пр.Независимости,127-Б',
                                seller_info_id: seller_table.last },
                              { name: 'ИП Милан', address: 'ул.Встречная,34', seller_info_id: seller_table.last },
                              { name: 'ИП Любовь', address: 'ул.Артура Пирожкова,1',
                                seller_info_id: seller_table.last },
                              { name: 'ИП Космос', address: 'ул.Стукино,51-А', seller_info_id: seller_table.first }
                            ])

products_table = Product.create([
                                  { name: 'Платье белое', description: 'Очень красивое платье', price: 18.00, product_type_id: product_types_table.last,
                                    salon_id: salons_table.last },
                                  { name: 'Костюм красивый', description: 'Дешево и сердито', price: 1.00, product_type_id: product_types_table.first,
                                    salon_id: salons_table.last },
                                  { name: 'Костюм. Штаны', description: 'Да,от костюма есть лишь штаны. И что???', price: 8.00,
                                    product_type_id: product_types_table.last, salon_id: salons_table.first },
                                  { name: 'Платье "Похоронное"', description: 'Все для праздника', price: 32.00,
                                    product_type_id: product_types_table.last, salon_id: salons_table.last },
                                  { name: 'Фрак для ребенка', description: 'Фрак для 7-10 лет', price: 56.00, product_type_id: product_types_table.first,
                                    salon_id: salons_table.last },
                                  { name: 'Фрак', description: 'Качественные материалы', price: 90.00, product_type_id: product_types_table.last,
                                    salon_id: salons_table.first },
                                  { name: 'Платье "Винтаж"', description: 'Для настоящих леди', price: 40.00, product_type_id: product_types_table.first,
                                    salon_id: salons_table.first }
                                ])

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Работает'
