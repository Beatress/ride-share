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
#
########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"



########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?
