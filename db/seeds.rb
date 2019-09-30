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

babycare = Category.create!(description: "Baby Care", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/71Qk9Fg%2B-UL._SX522_.jpg')
bedroom = Category.create!(description: "Bedroom", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81WxL5ICcoL._SL1500_.jpg')
clothes = Category.create!(description: "Clothes", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81J2ZOwcGNL._SL1500_.jpg')
essentials = Category.create!(description: "Essentials", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81-MC34MYWL._SL1500_.jpg')
feeding = Category.create!(description: "Feeding", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/71ctVuvVMuL._SY879_.jpg')
toys = Category.create!(description: "Toys", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/71Slr1Wil9L._SL1000_.jpg')
transport = Category.create!(description: "Transport", remote_photo_url: 'https://silvercrossus.com/pub/media/catalog/product/cache/1/image/beff4985b56e3afdbeabfc89641a4582/s/i/silver-cross-jet-ultra-compact-stroller-sterling-3.jpg')
safety = Category.create!(description: "Safety", remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/61TfCqsL6SL._SL1025_.jpg')

puts "Done Creating Categories"

printLine


puts "Creating Products for Each Category 🔨🛠"

stroller1 = Product.create!(category: transport,
  name: "Baby Trend TS27760",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
  price: 190,
  brand: "Baby Trend",
  remote_photo_url: 'https://cdn.shopify.com/s/files/1/1267/0473/products/icandy-peach-stroller-phantom-dove-grey-2_2000x.jpg')
stroller2 = Product.create!(category: transport,
  name: "THULE Urban Glide 2",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
  price: 671.90, brand: "THULE",
  remote_photo_url: 'https://activestyle.nl/images/detailed/112/Thule_URBAN_Glide_2_Dark_shadow.jpg')
stroller3 = Product.create!(category: transport,
  name: "Stomp V3 All-in-One Travel System",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
price: 599,
brand: "Stomp",
remote_photo_url: 'https://www.icklebubba.com/wp-content/uploads/2016/12/Stomp-v3_All-in-One-With-Isofix-Base_Black-Frame_Black_006-1080x1080.jpg')
stroller4 = Product.create!(category: transport,
  name: "Graco Modes Jogger SE Stroller, Tenley",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
price: 176,
brand: "Graco Tenley",
remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81Rq4QRzLeL._SL1500_.jpg')
stroller5 = Product.create!(category: transport,
  name: "Baby Stroller Bassinet Pram Carriage Stroller - Cynebaby ",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
price: 188,
brand: "Cynebaby",
remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/71U-NF03o8L._SL1400_.jpg')
stroller6 = Product.create!(category: transport,
  name: "Belecoo Baby Stroller for Newborn and Toddler - Bassinet Stroller",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
price: 190,
brand: "Belecoo Toddler",
remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/51XkCdyqBwL.jpg')
stroller7 = Product.create!(category: transport,
  name: "Evenflo Pivot Xpand Modular Stroller",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
price: 238,
brand: "Evenflo Pivot",
remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/91cPebD8FVL._SL1500_.jpg')
stroller8 = Product.create!(category: transport,
  name: "Joovy Scooter X2 Double Stroller, Black ",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
price: 210,
brand: "Joovy Scooter",
remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/51SrJ%2BORIUL._SL1000_.jpg')
stroller9 = Product.create!(category: transport,
  name: "Maxi-Cosi Zelia 5-in-1 Modular Travel System",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
price: 399,
brand: "Maxi-Cosi Zelia",
remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81OkeEnhusL._SL1500_.jpg')
stroller10 = Product.create!(category: transport,
  name: "SpringBuds Baby Stroller Bassinet Carriage Combo ",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
price: 499,
brand: "SpringBuds Combo",
remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/61TjvE10kpL._SL1000_.jpg')
stroller11 = Product.create!(category: transport,
  name: "Cynebaby Infant Toddler Baby Stroller Carriage",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
price: 499,
brand: "Cynebaby Toddler",
remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/71SLX6RXyCL._SL1202_.jpg')
stroller12 = Product.create!(category: transport,
  name: "Baby Stroller Compact Reversible Bassinet Pram Strollers Foldable Citi",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket stroller on the hood, viewing great window.",
price: 278,
brand: "Bassinet Pram",
remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/71KvgPRszlL._SL1400_.jpg')

puts "Done Created Strollers 🚗"



crib1 = Product.create!(category: bedroom,
  name: "Delta Children Folding Portable Mini",
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
crib4 = Product.create!(category: bedroom,
  name: "Ikea Gulliver Convertible Crib White",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 209,
  brand: "Ikea Gulliver",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/41es3hX21nL.jpg')
crib5 = Product.create!(category: bedroom,
  name: "Dream On Me Aden Convertible Mini",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 129,
  brand: "Aden Convertible",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81pG5HM9HlL._SX522_.jpg')
crib6 = Product.create!(category: bedroom,
  name: "Dream On Me Violet Mini Crib",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 129,
  brand: "Violet Mini",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81b0GvrDRyL._SX522_.jpg')
crib7 = Product.create!(category: bedroom,
  name: "Dream Addison Convertible Mini Crib ",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 133,
  brand: "Dream Addison",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/71emyWWKoqL._SL1500_.jpg')
crib8 = Product.create!(category: bedroom,
  name: "Babyjorn Travel Crib Light - Silver",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 133,
  brand: "Babyjorn",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81HLVy9elTL._SL1427_.jpg')
crib9 = Product.create!(category: bedroom,
  name: "Foundations SafetyCraft Compact Size",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 228,
  brand: "SafetyCraft",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/61b6VApaznL._SL1000_.jpg')
crib10 = Product.create!(category: bedroom,
  name: "Child Craft Safe Haven Daycare",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 300,
  brand: "Haven Daycare",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81FDeGS6eHL._SL1500_.jpg')
crib11 = Product.create!(category: bedroom,
  name: "Runnzer Baby Crib Safety Pop Up",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 52,
  brand: "Runnzer",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/61ajLcbJenL._SL1200_.jpg')
crib12 = Product.create!(category: bedroom,
  name: "Graco Harbor Lights 4-in-1 Convertible",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 170,
  brand: "Graco Harbor",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81Mm6nrNOOL._SL1500_.jpg')

puts "Done Creating Cribs 🛏"

clothing1 = Product.create!(category: clothes,
  name: "Simple Joys by Carter's Baby Girls' 2-Pack",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 15.67,
  brand: "Simple Joy",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/91Mre1KnomL._UY550_.jpg')
clothing2 = Product.create!(category: clothes,
  name: "Touched by Nature Unisex Baby ",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 10,
  brand: "Touched by Nature",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81E1SgBmoPL._UX385_.jpg')
clothing3 = Product.create!(category: clothes,
  name: "Hudson Baby Unisex",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 11, brand: "Hudson Baby",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81J2ZOwcGNL._SL1500_.jpg')
clothing4 = Product.create!(category: clothes,
  name: "Plush Animal Face Robe",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 12,
  brand: "Plush Animal",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81IhD1Bkp8L._SL1500_.jpg')
clothing5 = Product.create!(category: clothes,
  name: "Hudson Baby Unisex Baby Security Blanket",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 8,
  brand: "Hudson Blanket",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/71DHPbD63%2BL._SL1500_.jpg')
clothing6 = Product.create!(category: clothes,
  name: "Hudson Baby Boy Clothes New",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 12,
  brand: "Hudson Boy",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/61DSh1X4xjL._UX679_.jpg')
clothing7 = Product.create!(category: clothes,
  name: "Bearington Baby Speedy Snuggler, Sloth Plush Stuffed Animal Security Blanket, Lovey 15",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 17,
  brand: "Bearington Snuggler",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/51DTlqLeYKL._SL1000_.jpg')
clothing8 = Product.create!(category: clothes,
  name: "Simple Joys by Carter's Baby Girls' 2-Pack Fleece Footed Sleep and Play",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 16,
  brand: "Carter Joys",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/91k-JP3e00L._UY879_.jpg')
clothing9 = Product.create!(category: clothes,
  name: "Baby Zip-Front Footed Sleep and Play",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 10,
  brand: "Zip-Front Sleeper",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81eAMkPXf6L._UY879_.jpg')
clothing10 = Product.create!(category: clothes,
  name: "Simple Joys by Carter's Baby 2-Pack Cotton Footed Sleep and Play",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 17,
  brand: "Simple Joys",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81pN9DnFuuL._UY879_.jpg')
clothing11 = Product.create!(category: clothes,
  name: "Pureborn Infant Toddler Baby Boy Girl Fleece Lined Stripe Jacket Coat Warm Outfit",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 27,
  brand: "Pureborn Toddler",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81WCThVx4vL._UX679_.jpg')
clothing12 = Product.create!(category: clothes,
  name: "Pureborn Baby Girls Boys Hooded Jacket Vests Cute Infant Toddler Cotton Waistcoat",
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  price: 22,
  brand: "Pureborn Hooded",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/71ncXsYZMsL._UX679_.jpg')


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
toy6 = Product.create!(category: toys,
  name: 'Oball Go Grippers John Deere',
  price: 13,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood stroller, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81Eov9mT2xL._SL1500_.jpg",
  brand: 'Oball Go'
  )
toy7 = Product.create!(category: toys,
  name: 'Munchkin Bath Bobber',
  price: 6,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71fvAD0eCPL._SX522_.jpg",
  brand: 'Munchkin Bobber'
  )
toy8 = Product.create!(category: toys,
  name: 'Pumbaa Round Cuddle Pal',
  price: 18,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81wNRz-iCmL._SL1500_.jpg",
  brand: 'Pumbaa Pal'
  )
toy9 = Product.create!(category: toys,
  name: 'Sesame Street Cookie Monster',
  price: 8,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/711xS2ROS%2BL._SL1500_.jpg",
  brand: 'Cookie Monster'
  )
toy10 = Product.create!(category: toys,
  name: 'Munchkin Fishin Bath Toy',
  price: 7,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71oHxTn4uQL._SX522_.jpg",
  brand: 'Munchkin Fishin'
  )
toy11 = Product.create!(category: toys,
  name: 'Finding Nemo Baby Bath',
  price: 7,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81NcsmCqd7L._SL1500_.jpg",
  brand: 'Finding Nemo'
  )
toy12 = Product.create!(category: toys,
  name: 'Freestanding Slides Children Park Swing',
  price: 628,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/51IhWb3CIdL._SL1024_.jpg",
  brand: 'Freestanding Swing'
  )


puts "Done Creating Toys 🧸"

babycare1 = Product.create!(category: babycare,
  name: 'Baby Care Play Mat Pen',
  price: 245,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71kUmyNCKpL._SL1500_.jpg",
  brand: 'Play Mat'
  )
babycare2 = Product.create!(category: babycare,
  name: 'American Health and Grooming Kit',
  price: 18,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81bekucErlL._SL1500_.jpg",
  brand: 'Grooming Kit'
  )
babycare3 = Product.create!(category: babycare,
  name: 'Baby Nail Electric Nail Trimmer',
  price: 13,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71-6iyzBXBL._SL1300_.jpg",
  brand: 'Nail Trimmer'
  )
babycare4 = Product.create!(category: babycare,
  name: 'Fisher-Price Healthy Care Booster Seat',
  price: 28,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/31eOf7CiLRL.jpg",
  brand: 'Fisher-Price Seat'
  )
babycare5 = Product.create!(category: babycare,
  name: 'Nuby 4 Stage Oral Care Set System',
  price: 5,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/51WcrN-VRLL._SL1000_.jpg",
  brand: 'Nuby 4'
  )
babycare6 = Product.create!(category: babycare,
  name: 'Philips Avent Soothie Pacifier',
  price: 4,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/61sz0rWWZ%2BL._SL1300_.jpg",
  brand: 'Philips Pacifier'
  )
babycare7 = Product.create!(category: babycare,
  name: 'Summer Brush and Comb',
  price: 3,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/51vCwjp4J8L._SL1000_.jpg",
  brand: 'Summer Brush'
  )
babycare8 = Product.create!(category: babycare,
  name: 'Nuby Silicone Teethe',
  price: 5,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71HR1CNMdpL._SL1500_.jpg",
  brand: 'Nuby Teether'
  )
babycare9 = Product.create!(category: babycare,
  name: 'MAM Pacifiers 3 pack',
  price: 10,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71kWv3ECpIL._SL1500_.jpg",
  brand: 'MAM Pacifiers'
  )
babycare10 = Product.create!(category: babycare,
  name: 'Summer Infant My Bath Seat',
  price: 35,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71yYWqJwUOL._SL1500_.jpg",
  brand: 'Summer Bath Seat'
  )
babycare11 = Product.create!(category: babycare,
  name: 'Summer Comfort Height Bath Tub',
  price: 30,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/51FUUvetlLL._SL1024_.jpg",
  brand: 'Summer Bath Tub'
  )
babycare12 = Product.create!(category: babycare,
  name: 'Hooded Baby Towel',
  price: 20,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71-QDGRZwgL._SL1500_.jpg",
  brand: 'Baby Towel'
  )

puts "Done Creating Baby Care 🧼"

feeding1 = Product.create!(category: feeding,
  name: 'Silicone Baby Bibs Easily Wipe',
  price: 18,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/61-x3sIzdrL._SL1000_.jpg",
  brand: 'Baby Bibs'
  )
feeding2 = Product.create!(category: feeding,
  name: 'NUK Large Learner Sippy Cup',
  price: 8,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/712OF-AeaAL._SL1500_.jpg",
  brand: 'Sippy Cup'
  )
feeding3 = Product.create!(category: feeding,
  name: 'Medela, Harmony Breast Pump',
  price: 25,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71dY1tJ4BuL._SL1500_.jpg",
  brand: 'Breast Pump'
  )
feeding4 = Product.create!(category: feeding,
  name: 'Munchkin Stay Put Suction Bowl, 3 Pack',
  price: 8,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71qVriMZ28L._SL1500_.jpg",
  brand: 'Suction Bowl'
  )
feeding5 = Product.create!(category: feeding,
  name: 'Philips Avent My Bendy Straw Cup 2 pack',
  price: 9,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81U7K7a%2B4sL._SL1500_.jpg",
  brand: 'Philips Straw'
  )
feeding6 = Product.create!(category: feeding,
  name: 'Munchkin 6 Piece Fork and Spoon Set',
  price: 5,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81mbIPEl7FL._SL1500_.jpg",
  brand: 'Munchkin Spoon Set'
  )
feeding7 = Product.create!(category: feeding,
  name: 'Boon Lawn Countertop Drying Rack Green',
  price: 16,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71JUKYpzL7L._SL1500_.jpg",
  brand: 'Drying Rack'
  )
feeding8 = Product.create!(category: feeding,
  name: 'Munchkin Snack Catcher, 2 Pack',
  price: 5,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/814rhxHg5wL._SL1500_.jpg",
  brand: 'Snack Catcher'
  )
feeding9 = Product.create!(category: feeding,
  name: 'NUK Sesame Street Active Cup, 10oz',
  price: 9,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71k4APFG6pL._SL1500_.jpg",
  brand: 'Sesame Street Cup'
  )
feeding10 = Product.create!(category: feeding,
  name: 'Bubos Heating Baby Bottle Warmer',
  price: 18,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/518THxknnZL._SL1180_.jpg",
  brand: 'Baby Bottle Warmer'
  )
feeding11 = Product.create!(category: feeding,
  name: 'Baby Bandana Drool Bibs 6-Pack',
  price: 15,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71wcVSx5uoL._SL1100_.jpg",
  brand: 'Bandana Drool Bibs'
  )
feeding12 = Product.create!(category: feeding,
  name: 'Kiinde Breast Milk Storage Twist Pouch',
  price: 38,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71n-5z19ILL._SL1500_.jpg",
  brand: 'Milk Storage Pouch'
  )

puts "Done Creating Feeding products 🍼"

safety1 = Product.create!(category: safety,
  name: 'NetGear Arlo Baby Monitor',
  price: 131,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71l21XusvRL._SL1500_.jpg",
  brand: 'Baby Monitor'
  )
safety2 = Product.create!(category: safety,
  name: 'BBTKCARE Noise Cancelling Headphones',
  price: 17,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/41nn6pNM2xL.jpg",
  brand: 'Baby Noise Headphones'
  )
safety3 = Product.create!(category: safety,
  name: 'Safety Pressure Mount Lift',
  price: 32,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71CrfeYsAaL._SL1500_.jpg",
  brand: 'Pressure Mount Lift'
  )
safety4 = Product.create!(category: safety,
  name: 'Boppy Noggin Nest Head Support',
  price: 15,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81K%2BFeoOF%2BL._SL1500_.jpg",
  brand: 'Boppy Head Support'
  )
safety5 = Product.create!(category: safety,
  name: 'LBtech Video Baby Monitor',
  price: 93,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/51GYzYnhIAL._SL1000_.jpg",
  brand: 'LBtech Baby Monitor'
  )
safety6 = Product.create!(category: safety,
  name: 'Munchkin Faucet Extender 2 Piece Set',
  price: 10,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71T4YmSH0YL._SL1500_.jpg",
  brand: 'Munchkin Faucet'
  )
safety7 = Product.create!(category: safety,
  name: 'Baby Proofing Edge & Corner Guards',
  price: 20,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/41GcBfN4BTL.jpg",
  brand: 'Edge Guards'
  )
safety8 = Product.create!(category: safety,
  name: 'Evenflo Position and Lock Wood Gate',
  price: 13,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81MnsZ%2B6mvL._SL1500_.jpg",
  brand: 'Evenflo lock gate'
  )
safety9 = Product.create!(category: safety,
  name: 'Infant Video Baby Monitor',
  price: 166,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/61TfCqsL6SL._SL1025_.jpg",
  brand: 'Infant Baby Monitor'
  )
safety10 = Product.create!(category: safety,
  name: 'Toddler Leash & Harness for Child Safety',
  price: 7,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71WjsjuQfZL._SL1500_.jpg",
  brand: 'Toddler Leash'
  )
safety11 = Product.create!(category: safety,
  name: 'Dream On Me Mesh Security Rail',
  price: 23,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/51y89xKYf1L._SL1200_.jpg",
  brand: 'Security Rail'
  )
safety12 = Product.create!(category: safety,
  name: 'Infantino Cap The Tap Bath Spout Cover',
  price: 10,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/91DrG3liCjL._SL1500_.jpg",
  brand: 'Bath Spout Cover'
  )

puts "Done Creating Safety products 🧷"

essential1 = Product.create!(category: essentials,
  name: 'Fisher-Price Perfect Fit Potty Ring',
  price: 40,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71OGmAHH3pL._SL1500_.jpg",
  brand: 'Fisher-Price Potty Ring'
  )
essential2 = Product.create!(category: essentials,
  name: 'Sesame Street "Framed Friends" Soft Potty Seat',
  price: 18,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/91liVNyRe-L._SL1500_.jpg",
  brand: 'Sesame Street Seat'
  )
essential3 = Product.create!(category: essentials,
  name: 'Philips Avent Thermal Gel Pads, 2-Pack',
  price: 13,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81E1UQktMcL._SL1500_.jpg",
  brand: 'Thermal Gel Pads'
  )
essential4 = Product.create!(category: essentials,
  name: 'Graco Changing Pad Cover 2 Pack',
  price: 12,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81ZuixqHGpL._SL1500_.jpg",
  brand: 'Changing Pad'
  )
essential5 = Product.create!(category: essentials,
  name: 'Chevron Plush Changing Pad Cover',
  price: 10,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71Wox7W8yBL._SL1500_.jpg",
  brand: 'Chevron Pad Cover'
  )
essential6 = Product.create!(category: essentials,
  name: 'Green Croc Bath Thermometer',
  price: 13,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71zMVOr5rFL._SL1500_.jpg",
  brand: 'Green Croc Thermometer'
  )
essential7 = Product.create!(category: essentials,
  name: 'BabyElf Baby Thermometer',
  price: 13,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/51Qejiw46wL._SL1000_.jpg",
  brand: 'BabyElf Thermometer'
  )
essential8 = Product.create!(category: essentials,
  name: 'Rumble Silky Minky Changing Pad Cover',
  price: 12,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/51xUIfDKJnL._SL1000_.jpg",
  brand: 'Minky Pad Cover'
  )
essential9 = Product.create!(category: essentials,
  name: 'BlueSnail Comfy Changing Pad Cover',
  price: 14,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/61hAenc3xwL._SL1200_.jpg",
  brand: 'BlueSnail Pad Cover'
  )
essential10 = Product.create!(category: essentials,
  name: 'LittleHippo Nursery Night Light',
  price: 25,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81tb2HAoE-L._SL1500_.jpg",
  brand: 'Hippo Night Light'
  )
essential11 = Product.create!(category: essentials,
  name: 'Boppy Nursing Pillow and Positioner',
  price: 40,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81cE%2BbioN8L._SL1500_.jpg",
  brand: 'Nursing Pillow'
  )
essential12 = Product.create!(category: essentials,
  name: 'Boppy Original Pillow Cover',
  price: 19,
  description: "Includes a unique leatherette bumper bar that folds. Ergonomic curved seat back keeps baby separate. Compact shopping basket. One hand 4-position recline seat. Reflective harness, carry strap, rear wheel brake. One hand 4-position recline seat, soft, padded seat. Extendable hood with sun visor and ventilated panel. 360° front lockable swivel wheels, compact umbrella fold. Storage pocket on the hood, viewing great window.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81J%2BYeCkIFL._SL1500_.jpg",
  brand: 'Boppy Pillow Cover'
  )

puts "Done Creating Essentials products 🌡"

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

babycareArray = Product.where(category: babycare)
cribArray = Product.where(category: bedroom)
clothesArray = Product.where(category: clothes)
essentialsArray = Product.where(category: essentials)
feedingArray = Product.where(category: feeding)
toysArray = Product.where(category: toys)
strollerArray = Product.where(category: transport)
safetyArray = Product.where(category: safety)

conditionArray.each do |condition|
  4.times do
    StockProduct.create!(condition: condition, product: babycareArray.sample, cart: Cart.all.sample)
    StockProduct.create!(condition: condition, product: cribArray.sample, cart: Cart.all.sample)
    StockProduct.create!(condition: condition, product: clothesArray.sample, cart: Cart.all.sample)
    StockProduct.create!(condition: condition, product: essentialsArray.sample, cart: Cart.all.sample)
    StockProduct.create!(condition: condition, product: feedingArray.sample, cart: Cart.all.sample)
    StockProduct.create!(condition: condition, product: toysArray.sample, cart: Cart.all.sample)
    StockProduct.create!(condition: condition, product: strollerArray.sample, cart: Cart.all.sample)
    StockProduct.create!(condition: condition, product: safetyArray.sample, cart: Cart.all.sample)
  end
end

puts "Done Creating Stock_Products for Each Product 🥵"

printLine

puts "Creating options Gift and Address"

gift = Option.create!(name: "gift")
address = Option.create!(name: "address")

printLine

puts "Left To Do: Review, Cart Option, and Option Seeds"
puts "But for now we're Done!!  🎊 🥳🎉 🥳🎉 🥳🎉 🎊"






