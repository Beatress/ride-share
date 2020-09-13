########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

# The top layer is the driver layer - we can group all the rides driven by one driver together
# Below this is the rides layer - a collection of all rides taken by one driver
# Below this is the ride data layer - data about each individual ride
# The ride data is nested in the rides layer which is nested in the driver layer
# THe driver layer and rides layer have within it another data structure
# The rides in the driver layer and the individual data in each ride are next to each other

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# Driver layer: This should be a hash with key being the driver ID and value being a collection of their rides
# Rides layer: This should be an array of hashes with each hash representing one ride
# Ride data layer: This should be a hash with information about the ride

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

drivers = {
    DR0001: [
        {
            ride_date: "3rd Feb 2016",
            cost: 10,
            rider_id: "RD0003",
            rating: 3
        },
        {
            ride_date: "3rd Feb 2016",
            cost: 30,
            rider_id: "RD0015",
            rating: 4
        },
        {
            ride_date: "5th Feb 2016",
            cost: 45,
            rider_id: "RD0003",
            rating: 2
        }
    ],
    DR0002: [
        {
            ride_date: "3rd Feb 2016",
            cost: 25,
            rider_id: "RD0073",
            rating: 5
        },
        {
            ride_date: "4th Feb 2016",
            cost: 15,
            rider_id: "RD0013",
            rating: 1
        },
        {
            ride_date: "5th Feb 2016",
            cost: 35,
            rider_id: "RD0066",
            rating: 3
        },
    ],
    DR0003: [
        {
            ride_date: "4th Feb 2016",
            cost: 5,
            rider_id: "RD0066",
            rating: 5
        },
        {
            ride_date: "5th Feb 2016",
            cost: 50,
            rider_id: "RD0003",
            rating: 2
        }
    ],
    DR0004: [
        {
            ride_date: "3rd Feb 2016",
            cost: 5,
            rider_id: "RD0022",
            rating: 5
        },
        {
            ride_date: "4th Feb 2016",
            cost: 10,
            rider_id: "RD0022",
            rating: 4
        },
        {
            ride_date: "5th Feb 2016",
            cost: 20,
            rider_id: "RD0073",
            rating: 5
        }
    ]
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?
highest_amounts = {
    earnings: {
        highest_id: nil,
        highest_amount: -1,
        ties: []
    },
    rating: {
        highest_id: nil,
        highest_amount: -1,
        ties: []
    }
}

def update_highest(highest_amounts, type, driver_id, amount)
  current = highest_amounts[type]
  case amount <=> current[:highest_amount]
  when -1
    return nil
  when 0
    current[:ties] << driver_id
  when 1
    current[:ties] = []
    current[:highest_id] = driver_id
    current[:highest_amount] = amount
  end
end

def print_highest(highest_amounts, type, string)
  current = highest_amounts[type]
  if current[:ties].empty?
    printf("Driver ID #{current[:highest_id]} #{string}%.2f\n", current[:highest_amount])
  else
    tie_string = "Drivers with IDs #{current[:highest_id]}"
    current[:ties].shift(current[:ties].length - 1).each do |tied_id|
      tie_string << ", #{tied_id}"
    end
    printf("#{tie_string}, and #{current[:ties].last} #{string}%.2f\n", current[:highest_amount])
  end
end

# Main code starts here
drivers.each do |driver_id, rides|
  earnings_total = 0
  ratings_total = 0
  rides.each do |ride|
    earnings_total += ride[:cost]
    ratings_total += ride[:rating]
  end
  average_rating = ratings_total.to_f / rides.length
  update_highest(highest_amounts, :earnings, driver_id, earnings_total)
  update_highest(highest_amounts, :rating, driver_id, average_rating)

  printf("Driver ID #{driver_id.to_s} gave #{rides.length} rides for $%.2f with an average rating of %.2f\n"\
  ,earnings_total, average_rating)
end

puts ""
print_highest(highest_amounts, :earnings, "earned the most with $")
print_highest(highest_amounts, :rating, "had the highest average rating of ")