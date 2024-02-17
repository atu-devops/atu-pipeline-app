if Rails.env.development?
  puts "Development environment detected. Seeding data..."

  # Destroy all existing records
  User.destroy_all
  AdminUser.destroy_all
  Attraction.destroy_all
  ParkOpeningHour.destroy_all
  # Park.destroy_all
  Booking.destroy_all
  TicketType.destroy_all

  puts "Seed data for AdminUser"
  AdminUser.find_or_create_by(email: 'admin@example.com') do |admin_user|
    admin_user.password = 'password'
    admin_user.password_confirmation = 'password'
  end

  parks_data = [
    {
      park_name: "Ghastly Grove",
      description: "Ghastly Grove is an adventure park that transports visitors into an eerie, supernatural forest shrouded in mystery and legend...",
      capacity: 1000,
      availability: true,
      opening_hours: { start_month: 3, end_month: 9, day_of_week: 1, opening_time: "10:00", closing_time: "17:00" },
      attractions: [
        { name: "Risky Rollercoaster", description: "A high-speed ride through a haunted forest, with sudden drops and ghostly figures appearing in the dark.", age_limit: 18, height_limit: 120 },
        { name: "Mystic Minecart Madness", description: "Journey through an abandoned mine where spectral miners are said to still wander.", age_limit: 18, height_limit: 120 },
        { name: "Frightening Forest Flyer", description: "A zipline ride that soars over a cursed forest, filled with spooky sounds and sudden scares.", age_limit: 18, height_limit: 120 },
        { name: "Spectral Swings", description: "A carousel of ghostly swings that twirl you through a fog of chilling mist and eerie sounds.", age_limit: 18, height_limit: 120 }
      ],
      ticket_types: [
        { category: "Children", price: 15.00 },
        { category: "Adult", price: 20.00 },
        { category: "Family", price: 60.00 }
      ]
    },
    {
      park_name: "Vampire Valley",
      description: "Vampire Valley is a gothic-themed park that evokes the eerie charm of a vampire's domain...",
      capacity: 1200,
      availability: true,
      opening_hours: { start_month: 4, end_month: 9, day_of_week: 1, opening_time: "11:00", closing_time: "18:00" },
      attractions: [
        { name: "Batty Bumper Boats", description: "Navigate through dark waters in a cave, avoiding vampire bats and sudden water jets.", age_limit: 18, height_limit: 120 },
        { name: "Cryptic Coaster", description: "A rollercoaster that winds through an ancient vampire crypt with sudden drops into darkness.", age_limit: 18, height_limit: 120 },
        { name: "Dreadful Dungeon Drop", description: "A tower drop ride set inside a vampire's dungeon, with unexpected falls and rises.", age_limit: 18, height_limit: 120 },
        { name: "Gloomy Gargoyle Gliders", description: "Glide through the night sky among stone gargoyles, with sudden twists and turns.", age_limit: 18, height_limit: 120 }
      ],
      ticket_types: [
        { category: "Children", price: 17.00 },
        { category: "Adult", price: 25.00 },
        { category: "Family", price: 65.00 }
      ]
    },
    {
      park_name: "Wicked Woods",
      description: "Wicked Woods is a theme park designed to immerse visitors in a world of witchcraft and dark enchantment...",
      capacity: 800,
      availability: true,
      opening_hours: { start_month: 5, end_month: 10, day_of_week: 1, opening_time: "09:30", closing_time: "17:00" },
      attractions: [
        { name: "Sorcerer's Spiral Slide", description: "A twisting, turning slide through an enchanted tower, with magical illusions around every bend.", age_limit: 18, height_limit: 120 },
        { name: "Witch's Whirlwind", description: "A fast-paced spinning ride that mimics a witch's flight, complete with cackling and swirling mists.", age_limit: 18, height_limit: 120 },
        { name: "Potion Plunge Pool", description: "A water ride through a bubbling cauldron of a witch's brew, with unexpected water jets and drops.", age_limit: 18, height_limit: 120 },
        { name: "Enchanted Eagle Escape", description: "A high-flying ride where you soar above the woods on the back of a mythical eagle.", age_limit: 18, height_limit: 120 }
      ],
      ticket_types: [
        { category: "Children", price: 12.00 },
        { category: "Adult", price: 19.00 },
        { category: "Family", price: 60.00 }
      ]
    },
    {
      park_name: "Zombie Zone",
      description: "Zombie Zone is a post-apocalyptic themed park that thrusts its visitors into a world overrun by the undead...",
      capacity: 1500,
      availability: true,
      opening_hours: { start_month: 4, end_month: 8, day_of_week: 1, opening_time: "10:30", closing_time: "18:00" },
      attractions: [
        { name: "Decay Drop Tower", description: "A heart-stopping ride that lifts you high above the zombie-infested grounds before dropping you into the horde.", age_limit: 18, height_limit: 120 },
        { name: "Ghoul Glide", description: "A smooth, gliding ride through dark streets filled with lurking zombies.", age_limit: 18, height_limit: 120 },
        { name: "Rotting Rapids Run", description: "A rapid river ride through a zombie-infested landscape, with surprises around every bend.", age_limit: 18, height_limit: 120 },
        { name: "Zombie Zipline", description: "Soar over the zombie zone, evading grasping hands and eerie moans from below.", age_limit: 18, height_limit: 120 }
      ],
      ticket_types: [
        { type_name: "Children", price: 20.00 },
        { type_name: "Adult", price: 30.00 },
        { type_name: "Family", price: 70.00 }
      ]
    }
  # Add more parks here if needed
  ]

  parks_data.each do |park_data|
    park = Park.find_or_create_by(park_name: park_data[:park_name]) do |p|
      p.description = park_data[:description]
      p.capacity = park_data[:capacity]
      p.availability = park_data[:availability]
    end

    ParkOpeningHour.find_or_create_by(park: park, **park_data[:opening_hours])

    park_data[:attractions].each do |attraction_data|
      puts "Creating attraction: #{attraction_data[:name]}"
      a = Attraction.find_or_create_by(park: park, **attraction_data, availability: true)
      if a.errors.any?
        puts "Error creating attraction: #{a.errors.full_messages.join(", ")}"
      end
    end

    park_data[:ticket_types].each do |ticket_type_data|
      TicketType.find_or_create_by(type_name: ticket_type_data[:type_name], description: "Ticket for #{ticket_type_data[:type_name]}", price: ticket_type_data[:price], park: Park.all.sample)
    end
  end

  puts "Seed data for User"
  10.times do
    User.find_or_create_by(email: Faker::Internet.email) do |user|
      user.password = 'password'
      user.password_confirmation = 'password'
    end
  end

  puts "Seed data for Booking"
  10.times do
    Booking.find_or_create_by(booking_datetime: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), park: Park.all.sample, ticket_type: TicketType.all.sample, user: User.all.sample)
  end
else
  puts "Development environment not detected. Skipping seeding..."
end
