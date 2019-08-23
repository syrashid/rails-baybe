def printLine
  print '['
  100.times { print '*' }
  puts ']'
end

puts "Beginning Seeding Process 🌱"

printLine

puts "Deleting Old Users & Categories, removing dependencies 🔪 ☠️"
Photo.destroy_all
StockProduct.destroy_all
User.destroy_all
Category.destroy_all
Condition.destroy_all

printLine

puts "Creating Users 😀"
sy = User.create!(first_name: "Sy", last_name: "Rashid", email: "sy@gmail.com", password: "holla123")
kaveh = User.create!(first_name: "Kaveh", last_name: "Jalilian", email: "kaveh@gmail.com", password: "password")
chad = User.create!(first_name: "Chad", last_name: "Saglam", email: "chad@gmail.com", password: "password")
nico = User.create!(first_name: "Nico", last_name: "Proto", email: "nico@gmail.com", password: "password")
puts "Done Creating Users"

printLine

puts "Creating a Cart per User 🛒"
sycart = Cart.create!(total_price: 0, paid: "Pending", user: sy)
kavehcart = Cart.create!(total_price: 0, paid: "Pending", user: kaveh)
chadcart = Cart.create!(total_price: 0, paid: "Pending", user: chad)
nicocart = Cart.create!(total_price: 0, paid: "Pending", user: nico)
nicocart2 = Cart.create!(total_price: 0, paid: "Paid", user: nico)
puts "Done Creating Carts"

printLine

puts "Creating a Box per User 📦"
sybox = Box.create!(expected_price: 0, status: "Shipping", user: sy)
kavehbox = Box.create!(expected_price: 0, status: "Shipping", user: kaveh)
chadbox = Box.create!(expected_price: 0, status: "Shipping", user: chad)

nicobox = Box.create!(expected_price: 0, status: "Pending", user: nico)

chadbox2 = Box.create!(expected_price: 0, status: "Shipping", user: chad)

puts "Done Creating Boxes"

printLine

puts "Creating Categories for Products"
stroller = Category.create!(description: "Stroller", remote_photo_url: 'https://silvercrossus.com/pub/media/catalog/product/cache/1/image/beff4985b56e3afdbeabfc89641a4582/s/i/silver-cross-jet-ultra-compact-stroller-sterling-3.jpg')
crib = Category.create!(description: "Crib", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81WxL5ICcoL._SL1500_.jpg')
clothes = Category.create!(description: "Clothes", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/513AhM-zUdL._UX385_.jpg')
puts "Done Creating Categories"

printLine

puts "Creating Products for Each Category 🔨🛠"
stroller1 = Product.create!(category: stroller, name: "Stroller Style 1", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, perspiciatis.", price: rand(300), brand: "Stroller Brand", remote_photo_url: 'https://silvercrossus.com/pub/media/catalog/product/cache/1/image/beff4985b56e3afdbeabfc89641a4582/s/i/silver-cross-jet-ultra-compact-stroller-sterling-3.jpg')
stroller2 = Product.create!(category: stroller, name: "Stroller Style 2", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, perspiciatis.", price: rand(300), brand: "Stroller Brand", remote_photo_url: 'https://cdn.shopify.com/s/files/1/1267/0473/products/icandy-peach-stroller-phantom-dove-grey-2_2000x.jpg')
stroller3 = Product.create!(category: stroller, name: "Stroller Style 3", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, perspiciatis.", price: rand(300), brand: "Stroller Brand", remote_photo_url: 'https://silvercrossus.com/pub/media/catalog/product/cache/1/image/beff4985b56e3afdbeabfc89641a4582/s/i/silver-cross-jet-ultra-compact-stroller-sterling-3.jpg')
puts "Done Created Strollers 🚗"
crib1 = Product.create!(category: crib, name: "Crib Style 1", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, perspiciatis.", price: rand(300), brand: "Crib Brand", remote_photo_url: 'https://storkcraftdirect.com/wp-content/uploads/2019/06/StorkcraftMissionRidgeCrib_White1.jpg')
crib2 = Product.create!(category: crib, name: "Crib Style 2", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, perspiciatis.", price: rand(300), brand: "Crib Brand", remote_photo_url: 'https://storkcraftdirect.com/wp-content/uploads/2019/06/StorkcraftMissionRidgeCrib_White1.jpg')
crib3 = Product.create!(category: crib, name: "Crib Style 3", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, perspiciatis.", price: rand(300), brand: "Crib Brand", remote_photo_url: 'https://storkcraftdirect.com/wp-content/uploads/2019/06/StorkcraftMissionRidgeCrib_White1.jpg')
puts "Done Creating Cribs 🛏"
clothing1 = Product.create!(category: clothes, name: "Clothing Style 1", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, perspiciatis.", price: rand(300), brand: "Clothing Brand", remote_photo_url: 'https://cdn.shopify.com/s/files/1/1624/1285/products/little-mr-romper-1_spo.jpg?v=1506660209')
clothing2 = Product.create!(category: clothes, name: "Clothing Style 2", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, perspiciatis.", price: rand(300), brand: "Clothing Brand", remote_photo_url: 'https://cdn.shopify.com/s/files/1/1624/1285/products/little-mr-romper-1_spo.jpg?v=1506660209')
clothing3 = Product.create!(category: clothes, name: "Clothing Style 3", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, perspiciatis.", price: rand(300), brand: "Clothing Brand", remote_photo_url: 'https://www.dhresource.com/0x0s/f2-albu-g5-M00-91-B9-rBVaI1nPU3eAAqmcAAH9LQS4Tck878.jpg')
puts "Done Creating Clothes 👕👖👗"
puts "Done Creating Products for Each Category 😓"

printLine

puts "Creating Conditions for Stock Products 🌤"
likenew = Condition.create!(name: "Like New", buy_ratio: 0.8, sell_ratio: 0.9)
verygood  = Condition.create!(name: "Very Good", buy_ratio: 0.7, sell_ratio: 0.8)
good = Condition.create!(name: "Good", buy_ratio: 0.5, sell_ratio: 0.7)
acceptable = Condition.create!(name: "Acceptable", buy_ratio: 0.3, sell_ratio: 0.5)
puts "Done Creating Conditions"

printLine

puts "Creating Stock_Products for Each Product 📦📦📦"
strollerprod1 = StockProduct.create!(cart: nicocart, condition: likenew, product: stroller1, color: "black")
strollerprod2 = StockProduct.create!(cart: nicocart, condition: verygood, product: stroller1, color: "black")
strollerprod3 = StockProduct.create!(cart: nicocart, condition: verygood, product: stroller2, color: "black")
strollerprod4 = StockProduct.create!(cart: nicocart, condition: likenew, product: stroller2, color: "black")
strollerprod5 = StockProduct.create!(cart: nicocart, condition: acceptable, product: stroller3, color: "black")
puts "Done creating stock strollers"
cribsprod1 = StockProduct.create!(cart: nicocart2, condition: likenew, product: crib1, color: "brown")
cribsprod2 = StockProduct.create!(cart: nicocart2, condition: verygood, product: crib1, color: "white")
cribsprod3 = StockProduct.create!(cart: nicocart2, condition: verygood, product: crib2, color: "black")
cribsprod4 = StockProduct.create!(cart: nicocart2, condition: likenew, product: crib2, color: "pink")
cribsprod5 = StockProduct.create!(cart: nicocart2, condition: acceptable, product: crib3, color: "brown")

puts "Creating Stock_Products for Each Product 📦📦📦"
strollerprod1 = StockProduct.create!(box: chadbox, condition: likenew, product: stroller1, color: "black")
strollerprod2 = StockProduct.create!(box: chadbox, condition: verygood, product: stroller1, color: "black")
strollerprod3 = StockProduct.create!(box: chadbox, condition: verygood, product: stroller2, color: "black")
strollerprod4 = StockProduct.create!(box: chadbox, condition: likenew, product: stroller2, color: "black")
strollerprod5 = StockProduct.create!(box: chadbox, condition: acceptable, product: stroller3, color: "black")
puts "Done creating stock strollers"
cribsprod1 = StockProduct.create!(box: chadbox2, condition: likenew, product: crib1, color: "brown")
cribsprod2 = StockProduct.create!(box: chadbox2, condition: verygood, product: crib1, color: "white")
cribsprod3 = StockProduct.create!(box: chadbox2, condition: verygood, product: crib2, color: "black")
cribsprod4 = StockProduct.create!(box: chadbox2, condition: likenew, product: crib2, color: "pink")
cribsprod5 = StockProduct.create!(box: chadbox2, condition: acceptable, product: crib3, color: "brown")

puts "Done creating stock cribs"
clothprod1 = StockProduct.create!(condition: likenew, product: clothing1, color: "blue", size: "large")
clothprod2 = StockProduct.create!(condition: acceptable, product: clothing1, color: "pink", size: "small")
clothprod3 = StockProduct.create!(condition: verygood, product: clothing2, color: "blue", size: "large")
clothprod4 = StockProduct.create!(condition: good, product: clothing2, color: "pink", size: "small")
clothprod5 = StockProduct.create!(condition: likenew, product: clothing3, color: "blue", size: "large")
clothprod6 = StockProduct.create!(condition: acceptable, product: clothing3, color: "pink", size: "small")
puts "Done creating stock clothing"
puts "Done Creating Stock_Products for Each Product 🥵"

printLine

puts "Adding Photos to each Stock_Product 📸"
photo1 = Photo.create(stock_product: strollerprod1, remote_photolink_url: 'https://silvercrossus.com/pub/media/catalog/product/cache/1/image/beff4985b56e3afdbeabfc89641a4582/s/i/silver-cross-jet-ultra-compact-stroller-sterling-3.jpg')
photo2 = Photo.create(stock_product: strollerprod2, remote_photolink_url: 'https://cdn.shopify.com/s/files/1/1267/0473/products/icandy-peach-stroller-phantom-dove-grey-2_2000x.jpg')
photo3 = Photo.create(stock_product: strollerprod3, remote_photolink_url: 'https://s.yimg.com/aah/albee-baby/maxi-cosi-lila-double-stroller-nomad-black-5.jpg')
photo4 = Photo.create(stock_product: strollerprod4, remote_photolink_url: 'https://cdn.shopify.com/s/files/1/0004/0855/1482/products/doona_2019_eu_car_seat_stroller_flame_red.jpg')
photo5 = Photo.create(stock_product: strollerprod5, remote_photolink_url: 'https://cdn.shopify.com/s/files/1/2341/8943/products/Bumbleride_Speed_Jogging_Stroller_Maritime_Blue_1500x1500.jpg')
photo6 = Photo.create(stock_product: cribsprod1, remote_photolink_url: 'https://images-na.ssl-images-amazon.com/images/I/81WxL5ICcoL._SL1500_.jpg')
photo7 = Photo.create(stock_product: cribsprod2, remote_photolink_url: 'https://storkcraftdirect.com/wp-content/uploads/2019/06/StorkcraftMissionRidgeCrib_White1.jpg')
photo8 = Photo.create(stock_product: cribsprod3, remote_photolink_url: 'https://storkcraftdirect.com/wp-content/uploads/2019/06/StorkcraftMontereyCrib_Driftwood1.jpg')
photo9 = Photo.create(stock_product: cribsprod4, remote_photolink_url: 'https://images-na.ssl-images-amazon.com/images/I/81CUwl-g2iL._SY355_.jpg')
photo10 = Photo.create(stock_product: cribsprod5, remote_photolink_url: 'http://ep.yimg.com/ay/yhst-32204204442389/storkcraft-valentia-4-in-1-convertible-crib-in-dove-brown-44.jpg')
photo11 = Photo.create(stock_product: clothprod1, remote_photolink_url: 'https://images-na.ssl-images-amazon.com/images/I/513AhM-zUdL._UX385_.jpg')
photo12 = Photo.create(stock_product: clothprod2, remote_photolink_url: 'https://www.dhresource.com/0x0s/f2-albu-g5-M00-91-B9-rBVaI1nPU3eAAqmcAAH9LQS4Tck878.jpg')
photo13 = Photo.create(stock_product: clothprod3, remote_photolink_url: 'https://images-na.ssl-images-amazon.com/images/I/51dijlIQ0vL._UX679_.jpg')
photo14 = Photo.create(stock_product: clothprod4, remote_photolink_url: 'https://asset1.cxnmarksandspencer.com/is/image/mands/SD_04_T78_2422P_K9_X_EC_0?wid=600&qlt=40&fmt=pjpeg')
photo15 = Photo.create(stock_product: clothprod5, remote_photolink_url: 'https://cdn.shopify.com/s/files/1/1624/1285/products/little-mr-romper-1_spo.jpg?v=1506660209')
photo16 = Photo.create(stock_product: clothprod6, remote_photolink_url: 'https://images-na.ssl-images-amazon.com/images/I/61VaLqR1bxL._UX522_.jpg')
puts "Done Adding Photos to All Stock_Products 😭"

printLine

puts "Left To Do: Review, Cart Option, and Option Seeds"
puts "But for now we're Done!!  🎊 🥳🎉 🥳🎉 🥳🎉 🎊"






