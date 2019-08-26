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
sy = User.create!(first_name: "Sy", last_name: "Rashid", email: "sy@gmail.com", password: "holla123")
kaveh = User.create!(first_name: "Kaveh", last_name: "Jalilian", email: "kaveh@gmail.com", password: "password")
chad = User.create!(first_name: "Chad", last_name: "Saglam", email: "chad@gmail.com", password: "password")
nico = User.create!(first_name: "Nico", last_name: "Proto", email: "nico@gmail.com", password: "password")
puts "Done Creating Users"

printLine

puts "Creating a Cart per User 🛒"
sycart = Cart.create!(total_price: 0, paid: "pending", user: sy)
kavehcart = Cart.create!(total_price: 0, paid: "pending", user: kaveh)
chadcart = Cart.create!(total_price: 0, paid: "pending", user: chad)
nicocart = Cart.create!(total_price: 0, paid: "pending", user: nico)
#Leave some wiggle room for carts that have already been paid for


puts "Done Creating Carts"

printLine

puts "Creating a Box per User 📦"
sybox = Box.create!(expected_price: 0, status: "shipping", user: sy)
kavehbox = Box.create!(expected_price: 0, status: "shipping", user: kaveh)
chadbox = Box.create!(expected_price: 0, status: "shipping", user: chad)
nicobox = Box.create!(expected_price: 0, status: "shipping", user: nico)

puts "Done Creating Boxes"

printLine

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
  description: "The Baby Trend Envy Travel System in Bobbleheads is a combo that will come in handy for new parents. The baby travel system includes an infant stroller with the top-rated Flex-Loc Infant Car Seat. The combo provides excellent comfort and safety for your child. The stroller is appropriate for carrying a baby until he or she reaches a weight of 40 lbs, and has a height up to 40 inches. The baby travel system stroller has a large canopy, which provides shade on sunny days. The Baby Trend Envy Travel System Stroller features a height-adjustable handle and has a multi-position reclining seat for extra comfort. It also has a three-point harness safety belt so that baby remains strapped in safely.. The Flex-Loc Infant Car Seat included in the baby stroller travel system is rear facing, and is meant for children weighing up to 30 lbs and up to 30 inches tall. It has a five-point safety harness and removable head support system that you can use with infants. The Baby Trend Envy Travel System car seat has been designed with EPS energy absorbing foam for added protection.",
  price: 190,
  brand: "Baby Trend",
  remote_photo_url: 'https://cdn.shopify.com/s/files/1/1267/0473/products/icandy-peach-stroller-phantom-dove-grey-2_2000x.jpg')
stroller2 = Product.create!(category: transport,
  name: "THULE Urban Glide 2",
  description: "An all-terrain cart with an elegant and lightweight design that makes it perfect for exploring the city or walking the preferred circuit.",
  price: 671.90, brand: "THULE",
  remote_photo_url: 'https://activestyle.nl/images/detailed/112/Thule_URBAN_Glide_2_Dark_shadow.jpg')
stroller3 = Product.create!(category: transport,
  name: "Stomp V3 All-in-One Travel System",
  description: "The Stomp V3 all-in-one travel system combines the latest design trends for maximum comfort and safety making life easier to easily adapt during the growth of your child from newborn to the stroller first (from birth to 6 months) to the saddle (from 6 months to 3 years) and the baby seat to travel effortlessly anywhere.
With the all-inclusive Stomp V3 travel system you can mix and match chassis colors and fabric. It also includes multiple accessories and an isofix base compatible with the Galaxy Group 0+ car seat to create your own custom cart that attaches to the stroller chassis. The Stomp V3 with integrated isofix base is the only purchase you will need to carry your baby from day one safely and comfortably. The set includes isofix base.",
price: 599,
brand: "Stomp",
remote_photo_url: 'https://www.icklebubba.com/wp-content/uploads/2016/12/Stomp-v3_All-in-One-With-Isofix-Base_Black-Frame_Black_006-1080x1080.jpg')
puts "Done Created Strollers 🚗"
crib1 = Product.create!(category: bedroom,
  name: "Delta Children Folding Portable Mini Baby Crib",
  description: "With its sophisticated blend of functionality, convenience and safety, the Portable Folding Crib is the ideal choice for the modern, on-the-go family. It’s space-saving, lightweight design makes it perfect for use in smaller nurseries or as a travel crib.",
  price: 100, brand: "Delta",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81Au2ZOQLKL._SX522_.jpg')
crib2 = Product.create!(category: bedroom,
  name: "2in1 Stationary&Rock Mode Bassinet",
  description: "a perfect way to upgrade your child's room décor and can easily adjust to pad any area of the room: Crib, changing table, toddler bed, junior bed.  For the childhood the braided crib bumper can be used as a pillow for snuggling during story time, play time and sleep.  Add some fun, color and style to your child's room.  It will embrace and create the coziest environment for your baby.",
  price: 85,
  brand: "MiC kids",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/615xkWBPc4L._SX522_.jpg')
crib3 = Product.create!(category: bedroom,
  name: "LA Baby Compact Wooden Window Crib",
  description: "Simply arched end panels add elegance and charm to a day care and provide a cozy sleep environment for little ones during nap time. Clear acrylic panels at each end of the crib allow a caretaker to watch little ones while they sleep or play in the cozy wooden window crib. Meets the Mandatory CPSC 16 CFR 1220 regulations for non-full size cribs and is JPMA Certified Three position adjustable mattress height. Heavy duty ball bearing casters, two of which lock, are attached to the legs by a Chicago bolt system through the leg post instead of the leg bottom. This is not only a stronger system but also eliminates the danger of exposed bolt threads. Includes a deluxe thick foam mattress that is compliant with Federal Flammability standard 16 CFR 1633. Add strength and sturdiness to the 510 crib for a fire drill situation with the additional purchase of WC-504-EVA evacuation frame. Bilingual instructions in English and Spanish.",
  price: 239, brand: "LA Baby",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81x8Si07dUL._SX522_.jpg')
puts "Done Creating Cribs 🛏"
clothing1 = Product.create!(category: clothes,
  name: "Simple Joys by Carter's Baby Girls' 2-Pack",
  description: "Full-zip closures promise easier outfit changes in these footed sleep-and-play suits featuring whimsical designs.",
  price: 15.67,
  brand: "Simple Joy",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/91Mre1KnomL._UY550_.jpg')
clothing2 = Product.create!(category: clothes,
  name: "Touched by Nature Unisex Baby Organic Cotton Bodysuits",
  description: "Touched by Nature offers soft organic cotton clothing for the gentlest touch on sensitive and delicate baby skin. Our organic bodysuits feature adorable prints, embroideries, stripes and solids and provide a comfortable base layer that's great for pairing with pants, shorts, or even wearing under outfits. Our bodysuits are comfortable and cozy for all-day, everyday wear for your little one. Our bodysuits are an essential part of baby's wardrobe.",
  price: 10,
  brand: "Touched by Nature",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81E1SgBmoPL._UX385_.jpg')
clothing3 = Product.create!(category: clothes,
  name: "Hudson Baby Unisex",
  description: "Hudson Baby animal plush hooded robe is made of super soft, cozy plush material to dry and warm baby after bath or pool time. Our cozy fabric will be the perfect robe to wrap your baby in after post-water activities. Our detailed animal hood designs are sure to make bath time more fun and adventurous.",
  price: 11, brand: "Hudson Baby",
  remote_photo_url: 'https://images-na.ssl-images-amazon.com/images/I/81J2ZOwcGNL._SL1500_.jpg')
puts "Done Creating Clothes 👕👖👗"
toy1 = Product.create!(category: toys,
  name: 'Oball Go Grippers John Deere',
  price: 13,
  description: "Old MacDonald got a whole new farm. Grow your little one's imagination with Go Grippers John Deere Farm Vehicles. From the green grass of the backyard to the pretend plots of land in the living room, these John Deere themed cars are rugged and ready for playtime. Grab the Tractor, Combine or Gator. all three of these toddler toys help baby's imagination create a wide open field of possibilities. Little fingers easily grasp the flexible yet firm Oball material to roll from one crop to the next. The durable wheels make it easy to plow through the dirt, and their unique design make it easy to clean up while you're hosing down your little one.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/81nkOUAAY1L._SX522_.jpg",
  brand: 'Oball'
  )
toy2 = Product.create!(category: toys,
  name: 'Munchkin Bath Bobber',
  price: 6,
  description: "Watch out for that suds glacier! Turn your tub into the arctic with Munchkin's arctic-inspired Polar Bear and Penguin Bath Bobbers. Watch as they sink and pop right out of the water, surprising your toddler with giggles time and time again. Every day is a winter wonderland with these bobbling arctic companions.",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71fvAD0eCPL._SX522_.jpg",
  brand: 'Munchkin'
  )
toy3 = Product.create!(category: toys,
  name: 'Sea Spinner Wind-Up Shark',
  price: 9,
  description: "It's not wishful thinking -- there really are bath toys that move without batteries! Meet the floating Sea Spinner wind up bath toy. This adorable toy shark is ready to float and play, and best of all, it requires no batteries to move and spin its way through the tub. Little ones can easily wind up the bottom fin to make it go, go, go. It's designed to be water-tight, so you don't have to worry about mold and mildew, either. Equipped with a floatie and a smile, this sweet swimming bath toy is guaranteed to make tub time a splash!",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/71VxiRsKhEL._SX522_.jpg",
  brand: 'Sea Spinner'
  )
toy4 = Product.create!(category: toys,
  name: 'Skip Hop Bandana Buddies',
  price: 14,
  description: "A soft toy and teether filled with textures, patterns and sounds! Little hands stay active as baby explores rattles, crinkles and more. This colorful character's soft bandana teether detaches for mom to wear around her wrist for quick access. Perfect for multi-sensory play, this cute companion is ideal for fun at home or-on-the-go. Soft textured bandana teether detached to be worn around the wrist Rattle ring Bandana teether Crinkle details Attaches to stroller, car seat or infant carrier",
  remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/51zs-0fMi3L.jpg",
  brand: 'Skip Hop'
  )
toy5 = Product.create!(category: toys,
  name: 'String Talking Woody',
  price: 20,
  description: "Bring home the adventures of disneypixar's Toy Story 4 with the pully string talking plush Woody! Pull the string on Woody's back to hear him say fun phrases from the movie! Woody stands 14 Tall and comes dressed in his signature cowboy outfit with matching hat. Woody features deluxe embroidered detailing and is made with Super soft fabrics. He's the perfect size for both cuddles and play!",
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






