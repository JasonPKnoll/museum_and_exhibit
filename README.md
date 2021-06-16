#Iteration 1
pry(main)> require './lib/exhibit'
# => true
pry(main)> require './lib/patron'
# => true
pry(main)> exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
# => #<Exhibit:0x00007fcb13bd22d0...>
pry(main)> exhibit.name
# => "Gems and Minerals"
pry(main)> exhibit.cost
# => 0
pry(main)> patron_1 = Patron.new("Bob", 20)
# => #<Patron:0x00007fcb13b5c7d8...>
pry(main)> patron_1.name
# => "Bob"
pry(main)> patron_1.spending_money
# => 20
pry(main)> patron_1.interests
# => []
pry(main)> patron_1.add_interest("Dead Sea Scrolls")
pry(main)> patron_1.add_interest("Gems and Minerals")
pry(main)> patron_1.interests
# => ["Dead Sea Scrolls", "Gems and Minerals"]

# Iteration 2
pry(main)> require './lib/museum'
# => true
pry(main)> require './lib/patron'
# => true
pry(main)> require './lib/exhibit'
# => true
pry(main)> dmns = Museum.new("Denver Museum of Nature and Science")
# => #<Museum:0x00007fb400a6b0b0...>
pry(main)> dmns.name
# => "Denver Museum of Nature and Science"
pry(main)> dmns.exhibits
# => []
pry(main)> gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
# => #<Exhibit:0x00007fb400bbcdd8...>
pry(main)> dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
# => #<Exhibit:0x00007fb400b851f8...>
pry(main)> imax = Exhibit.new({name: "IMAX",cost: 15})
# => #<Exhibit:0x00007fb400acc590...>
pry(main)> dmns.add_exhibit(gems_and_minerals)
pry(main)> dmns.add_exhibit(dead_sea_scrolls)
pry(main)> dmns.add_exhibit(imax)
pry(main)> dmns.exhibits
# => [#<Exhibit:0x00007fb400bbcdd8...>, #<Exhibit:0x00007fb400b851f8...>, #<Exhibit:0x00007fb400acc590...>]
pry(main)> patron_1 = Patron.new("Bob", 20)
# => #<Patron:0x00007fb400a51cc8...>
pry(main)> patron_1.add_interest("Dead Sea Scrolls")
pry(main)> patron_1.add_interest("Gems and Minerals")
pry(main)> patron_2 = Patron.new("Sally", 20)
# => #<Patron:0x00007fb400036338...>
pry(main)> patron_2.add_interest("IMAX")
pry(main)> dmns.recommend_exhibits(patron_1)
# => [#<Exhibit:0x00007fb400bbcdd8...>, #<Exhibit:0x00007fb400b851f8...>]
pry(main)> dmns.recommend_exhibits(patron_2)
# => [#<Exhibit:0x00007fb400acc590...>]

# Iteration 3
pry(main)> require './lib/museum'
# => true
pry(main)> require './lib/patron'
# => true
pry(main)> require './lib/exhibit'
# => true
pry(main)> dmns = Museum.new("Denver Museum of Nature and Science")
# => #<Museum:0x00007fb20205d690...>
pry(main)> gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
# => #<Exhibit:0x00007fb202238618...>
pry(main)> dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
# => #<Exhibit:0x00007fb202248748...>
pry(main)> imax = Exhibit.new({name: "IMAX",cost: 15})
# => #<Exhibit:0x00007fb20225f8d0...>
pry(main)> dmns.add_exhibit(gems_and_minerals)
pry(main)> dmns.add_exhibit(dead_sea_scrolls)
pry(main)> dmns.add_exhibit(imax)
pry(main)> dmns.patrons
# => []
pry(main)> patron_1 = Patron.new("Bob", 0)
# => #<Patron:0x00007fb2011455b8...>
pry(main)> patron_1.add_interest("Gems and Minerals")
pry(main)> patron_1.add_interest("Dead Sea Scrolls")
pry(main)> patron_2 = Patron.new("Sally", 20)
# => #<Patron:0x00007fb20227f8b0...>
pry(main)> patron_2.add_interest("Dead Sea Scrolls")
pry(main)> patron_3 = Patron.new("Johnny", 5)
# => #<Patron:0x6666fb20114megan...>
pry(main)> patron_3.add_interest("Dead Sea Scrolls")
pry(main)> dmns.admit(patron_1)
pry(main)> dmns.admit(patron_2)
pry(main)> dmns.admit(patron_3)
pry(main)> dmns.patrons
# => [#<Patron:0x00007fb2011455b8...>, #<Patron:0x00007fb20227f8b0...>, #<Patron:0x6666fb20114megan...>]
#Patrons are added even if they don't have enough money for all/any exhibits.
pry(main)> dmns.patrons_by_exhibit_interest
# =>
# {
#   #<Exhibit:0x00007fb202238618...> => [#<Patron:0x00007fb2011455b8...>],
#   #<Exhibit:0x00007fb202248748...> => [#<Patron:0x00007fb2011455b8...>, #<Patron:0x00007fb20227f8b0...>, #<Patron:0x6666fb20114megan...>],
#   #<Exhibit:0x00007fb20225f8d0...> => []
# }
pry(main)> dmns.ticket_lottery_contestants(dead_sea_scrolls)
# => [#<Patron:0x00007fb2011455b8...>, #<Patron:0x6666fb20114megan...>]
pry(main)> dmns.draw_lottery_winner(dead_sea_scrolls)
# => "Johnny" or "Bob" can be returned here. Fun!
pry(main)> dmns.draw_lottery_winner(gems_and_minerals)
# => nil
#If no contestants are elgible for the lottery, nil is returned.
pry(main)> dmns.announce_lottery_winner(dead_sea_scrolls)
# => "Bob has won the Dead Sea Scrolls exhibit lottery"
# The above string should match exactly, you will need to stub the return of `draw_lottery_winner` as the above method should depend on the return value of `draw_lottery_winner`.
pry(main)> dmns.announce_lottery_winner(gems_and_minerals)
# => "No winners for this lottery"
# If there are no contestants, there are no winners.

# Iteration 4
pry(main)> require './lib/museum'
# => true
pry(main)> require './lib/patron'
# => true
pry(main)> require './lib/exhibit'
# => true
pry(main)> dmns = Museum.new("Denver Museum of Nature and Science")
# => #<Museum:0x00007f90182546f8...>
pry(main)> gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
# => #<Exhibit:0x00007f9018a51248...>
pry(main)> imax = Exhibit.new({name: "IMAX",cost: 15})
# => #<Exhibit:0x00007f9018a596c8...>
pry(main)> dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
# => #<Exhibit:0x00007f9019879be0...>
pry(main)> dmns.add_exhibit(gems_and_minerals)
pry(main)> dmns.add_exhibit(imax)
pry(main)> dmns.add_exhibit(dead_sea_scrolls)
# This Patron is interested in two exhibits but none are in their price range, so they attend none :(
pry(main)> tj = Patron.new("TJ", 7)
# => #<Patron:0x00007f901825d9d8...>
pry(main)> tj.add_interest("IMAX")
pry(main)> tj.add_interest("Dead Sea Scrolls")
pry(main)> dmns.admit(tj)
pry(main)> tj.spending_money
# => 7
# This Patron is interested in two exhibits and only Dead Sea Scrolls
# is in their price range price, so they attend Dead Sea Scrolls
pry(main)> patron_1 = Patron.new("Bob", 10)
# => #<Patron:0x00007f9018048be8...>
pry(main)> patron_1.add_interest("Dead Sea Scrolls")
pry(main)> patron_1.add_interest("IMAX")
pry(main)> dmns.admit(patron_1)
pry(main)> patron_1.spending_money
# => 0
# This Patron is interested in two exhibits and both are in their price range.
# They attend the more expensive one first (IMAX), but don't have enough money to attend
# the second one
pry(main)> patron_2 = Patron.new("Sally", 20)
# => #<Patron:0x00007f901823c8a0...>
pry(main)> patron_2.add_interest("IMAX")
pry(main)> patron_2.add_interest("Dead Sea Scrolls")
pry(main)> dmns.admit(patron_2)
pry(main)> patron_2.spending_money
# => 5
# This Patron is interested in two exhibits and both are in their price range.
# They have enough spending money to afford both, so they attend both.
pry(main)> morgan = Patron.new("Morgan", 15)
# => #<Patron:0x00007f90180e0948...>
pry(main)> morgan.add_interest("Gems and Minerals")
pry(main)> morgan.add_interest("Dead Sea Scrolls")
pry(main)> dmns.admit(morgan)
pry(main)> morgan.spending_money
# => 5
pry(main)> dmns.patrons_of_exhibits
# =>
# {
#   #<Exhibit:0x00007f9019879be0...> => [#<Patron:0x00007f9018048be8...>, <Patron:0x00007f90180e0948...>],
#   #<Exhibit:0x00007f9018a596c8...> => [#<Patron:0x00007f901823c8a0...>],
#   #<Exhibit:0x00007f9018a51248...> => [#<Patron:0x00007f90180e0948...>]
# }
pry(main)> dmns.revenue
# => 35
