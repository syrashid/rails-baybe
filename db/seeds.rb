# return if Rails.env.production?

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
sy = User.create!(first_name: "Sy", last_name: "Rashid", email: "sy@gmail.com", password: "holla123", address: "Carrer d'en Grassot, 101, 08025 Barcelona", admin: true)
kaveh = User.create!(first_name: "Kaveh", last_name: "Jalilian", email: "kaveh@gmail.com", password: "password", address: "Carrer d'en Grassot, 101, 08025 Barcelona", admin: true)
chad = User.create!(first_name: "Chad", last_name: "Saglam", email: "chad@gmail.com", password: "password", address: "Carrer d'en Grassot, 101, 08025 Barcelona", admin: true)
nico = User.create!(first_name: "Nico", last_name: "Proto", email: "nico@gmail.com", password: "password", address: "Carrer d'en Grassot, 101, 08025 Barcelona", admin: true)
guest = User.create!(first_name: "Guest", last_name: "Welcome", email: "guest@gmail.com", password: "password", address: "Carrer d'en Grassot, 101, 08025 Barcelona")

puts "Done Creating #{sy.first_name}, #{kaveh.first_name}, #{chad.first_name}, #{nico.first_name} and #{guest.first_name} "


printLine

puts "Creating a Cart per User 🛒"
sycart = Cart.create!(total_price_cents: 0, paid: "pending", user: sy)
kavehcart = Cart.create!(total_price_cents: 0, paid: "pending", user: kaveh)
chadcart = Cart.create!(total_price_cents: 0, paid: "pending", user: chad)
nicocart = Cart.create!(total_price_cents: 0, paid: "pending", user: nico)
guestcart = Cart.create!(total_price_cents: 0, paid: "pending", user: guest)
#Leave some wiggle room for carts that have already been paid for


puts "Done Creating Carts"

printLine

puts "Creating a Box per User 📦"
sybox = Box.create!(expected_price: 0, status: "shipping", user: sy)
kavehbox = Box.create!(expected_price: 0, status: "shipping", user: kaveh)
chadbox = Box.create!(expected_price: 0, status: "shipping", user: chad)
nicobox = Box.create!(expected_price: 0, status: "shipping", user: nico)
guestbox = Box.create!(expected_price: 0, status: "shipping", user: guest)

puts "Done Creating Boxes"

printLine


# ADD CATEGORIES
puts "Creating Categories for Products"

transport = Category.create!(description: "Transport", remote_photo_url: 'https://silvercrossus.com/pub/media/catalog/product/cache/1/image/beff4985b56e3afdbeabfc89641a4582/s/i/silver-cross-jet-ultra-compact-stroller-sterling-3.jpg')
bedroom = Category.create!(description: "Bedroom", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81WxL5ICcoL._SL1500_.jpg')
clothes = Category.create!(description: "Clothes", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/513AhM-zUdL._UX385_.jpg')
toys = Category.create!(description: "Toys", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/71Slr1Wil9L._SL1000_.jpg')


puts "Done Creating Categories"

printLine


puts "Creating Products for Each Category 🔨🛠"
stroller1 = Product.create!(category: transport,
  name: "Baby Trend TS27760",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 190,
  brand: "Baby Trend",
  remote_photo_url: 'https://cdn.shopify.com/s/files/1/1267/0473/products/icandy-peach-stroller-phantom-dove-grey-2_2000x.jpg')
stroller2 = Product.create!(category: transport,
  name: "THULE Urban Glide 2",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 671.90, brand: "THULE",
  remote_photo_url: 'https://activestyle.nl/images/detailed/112/Thule_URBAN_Glide_2_Dark_shadow.jpg')
stroller3 = Product.create!(category: transport,
  name: "Stomp V3 All-in-One Travel System",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
price: 599,
brand: "Stomp",
remote_photo_url: 'https://www.icklebubba.com/wp-content/uploads/2016/12/Stomp-v3_All-in-One-With-Isofix-Base_Black-Frame_Black_006-1080x1080.jpg')
puts "Done Created Strollers 🚗"
crib1 = Product.create!(category: bedroom,
  name: "Delta Children Folding Portable Mini Baby Crib",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 100, brand: "Delta",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81Au2ZOQLKL._SX522_.jpg')
crib2 = Product.create!(category: bedroom,
  name: "2in1 Stationary&Rock Mode Bassinet",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 85,
  brand: "MiC kids",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/615xkWBPc4L._SX522_.jpg')
crib3 = Product.create!(category: bedroom,
  name: "LA Baby Compact Wooden Window Crib",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 239, brand: "LA Baby",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81x8Si07dUL._SX522_.jpg')
puts "Done Creating Cribs 🛏"
clothing1 = Product.create!(category: clothes,
  name: "Simple Joys by Carter's Baby Girls' 2-Pack",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 15.67,
  brand: "Simple Joy",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/91Mre1KnomL._UY550_.jpg')
clothing2 = Product.create!(category: clothes,
  name: "Touched by Nature Unisex Baby Organic Cotton Bodysuits",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 10,
  brand: "Touched by Nature",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81E1SgBmoPL._UX385_.jpg')
clothing3 = Product.create!(category: clothes,
  name: "Hudson Baby Unisex",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 11, brand: "Hudson Baby",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81J2ZOwcGNL._SL1500_.jpg')
puts "Done Creating Clothes 👕👖👗"
toy1 = Product.create!(category: toys,
  name: 'Oball Go Grippers John Deere',
  price: 13,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81nkOUAAY1L._SX522_.jpg",
  brand: 'Oball'
  )
toy2 = Product.create!(category: toys,
  name: 'Munchkin Bath Bobber',
  price: 6,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71fvAD0eCPL._SX522_.jpg",
  brand: 'Munchkin'
  )
toy3 = Product.create!(category: toys,
  name: 'Sea Spinner Wind-Up Shark',
  price: 9,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71VxiRsKhEL._SX522_.jpg",
  brand: 'Sea Spinner'
  )
toy4 = Product.create!(category: toys,
  name: 'Skip Hop Bandana Buddies',
  price: 14,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/51zs-0fMi3L.jpg",
  brand: 'Skip Hop'
  )
toy5 = Product.create!(category: toys,
  name: 'String Talking Woody',
  price: 20,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81PDDejZw%2BL._SL1500_.jpg",
  brand: 'Disney'
  )
puts "Done Creating Toys 🧸"
puts "Done Creating Products for Each Category 😓"

printLine

puts "Creating Conditions for Stock Products 🌤"
likenew = Condition.create!(name: "Like New", sell_ratio: 0.8, buy_ratio: 0.9)
verygood  = Condition.create!(name: "Very Good", sell_ratio: 0.7, buy_ratio: 0.8)
good = Condition.create!(name: "Good", sell_ratio: 0.5, buy_ratio: 0.7)
acceptable = Condition.create!(name: "Acceptable", sell_ratio: 0.3, buy_ratio: 0.5)

puts "Done Creating Conditions"

printLine

puts "Creating Stock_Products for Each Product 📦📦📦"

conditionArray = Condition.all
strollerArray = Product.where(category: transport)
cribArray = Product.where(category: bedroom)
clothesArray = Product.where(category: clothes)
toysArray = Product.where(category: toys)

10.times do
  StockProduct.create!(condition: conditionArray.sample, product: strollerArray.sample, cart: Cart.all.sample)
  StockProduct.create!(condition: conditionArray.sample, product: cribArray.sample, cart: Cart.all.sample)
  StockProduct.create!(condition: conditionArray.sample, product: clothesArray.sample, cart: Cart.all.sample)
  StockProduct.create!(condition: conditionArray.sample, product: toysArray.sample, cart: Cart.all.sample)
end

puts "Done Creating Stock_Products for Each Product 🥵"

printLine

puts "Creating options Gift and Address"

gift = Option.create!(name: "gift")
address = Option.create!(name: "address")

printLine

# puts "Adding Photos to each Stock_Product 📸"
# photo1 = Photo.create(stock_product: strollerprod1, remote_photolink_url: 'https://silvercrossus.com/pub/media/catalog/product/cache/1/image/beff4985b56e3afdbeabfc89641a4582/s/i/silver-cross-jet-ultra-compact-stroller-sterling-3.jpg')
# photo2 = Photo.create(stock_product: strollerprod2, remote_photolink_url: 'https://cdn.shopify.com/s/files/1/1267/0473/products/icandy-peach-stroller-phantom-dove-grey-2_2000x.jpg')
# photo3 = Photo.create(stock_product: strollerprod3, remote_photolink_url: 'https://s.yimg.com/aah/albee-baby/maxi-cosi-lila-double-stroller-nomad-black-5.jpg')
# photo4 = Photo.create(stock_product: strollerprod4, remote_photolink_url: 'https://cdn.shopify.com/s/files/1/0004/0855/1482/products/doona_2019_eu_car_seat_stroller_flame_red.jpg')
# photo5 = Photo.create(stock_product: strollerprod5, remote_photolink_url: 'https://cdn.shopify.com/s/files/1/2341/8943/products/Bumbleride_Speed_Jogging_Stroller_Maritime_Blue_1500x1500.jpg')
# photo6 = Photo.create(stock_product: cribsprod1, remote_photolink_url: 'https://images-na.ssl-images-amazon.com/images/I/81WxL5ICcoL._SL1500_.jpg')
# photo7 = Photo.create(stock_product: cribsprod2, remote_photolink_url: 'https://storkcraftdirect.com/wp-content/uploads/2019/06/StorkcraftMissionRidgeCrib_White1.jpg')
# photo8 = Photo.create(stock_product: cribsprod3, remote_photolink_url: 'https://storkcraftdirect.com/wp-content/uploads/2019/06/StorkcraftMontereyCrib_Driftwood1.jpg')
# photo9 = Photo.create(stock_product: cribsprod4, remote_photolink_url: 'https://images-na.ssl-images-amazon.com/images/I/81CUwl-g2iL._SY355_.jpg')
# photo10 = Photo.create(stock_product: cribsprod5, remote_photolink_url: 'http://ep.yimg.com/ay/yhst-32204204442389/storkcraft-valentia-4-in-1-convertible-crib-in-dove-brown-44.jpg')
# photo11 = Photo.create(stock_product: clothprod1, remote_photolink_url: 'https://images-na.ssl-images-amazon.com/images/I/513AhM-zUdL._UX385_.jpg')
# photo12 = Photo.create(stock_product: clothprod2, remote_photolink_url: 'https://www.dhresource.com/0x0s/f2-albu-g5-M00-91-B9-rBVaI1nPU3eAAqmcAAH9LQS4Tck878.jpg')
# photo13 = Photo.create(stock_product: clothprod3, remote_photolink_url: 'https://images-na.ssl-images-amazon.com/images/I/51dijlIQ0vL._UX679_.jpg')
# photo14 = Photo.create(stock_product: clothprod4, remote_photolink_url: 'https://asset1.cxnmarksandspencer.com/is/image/mands/SD_04_T78_2422P_K9_X_EC_0?wid=600&qlt=40&fmt=pjpeg')
# photo15 = Photo.create(stock_product: clothprod5, remote_photolink_url: 'https://cdn.shopify.com/s/files/1/1624/1285/products/little-mr-romper-1_spo.jpg?v=1506660209')
# photo16 = Photo.create(stock_product: clothprod6, remote_photolink_url: 'https://images-na.ssl-images-amazon.com/images/I/61VaLqR1bxL._UX522_.jpg')
# puts "Done Adding Photos to All Stock_Products 😭"


puts "Left To Do: Review, Cart Option, and Option Seeds"
puts "But for now we're Done!!  🎊 🥳🎉 🥳🎉 🥳🎉 🎊"






