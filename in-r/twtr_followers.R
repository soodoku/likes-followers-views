"

Track # of Twitter Followers of political pages

"

library(twitteR)

"
Setting up access to the API:

1. Go to: https://apps.twitter.com/
2. Create a new application. 
3. Get id + token (secret)
4. Under settings, set up callback URL as http://127.0.0.1:1410

Also look up Twitter rate limits:
https://dev.twitter.com/rest/public/rate-limits

"

# Setup at your end:
setup_twitter_oauth("app_id", "app_pass")

# Get followers of a single user
getUser("HillaryClinton")$getFollowersCount()

# Read in data
data <- read.csv("data/congress.csv")

# Create column name with time stamp
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Get time
current_time <- as.POSIXlt(Sys.time())
# Concatenate hour, day, month, year 
timecol <- paste0("twtrfol-", paste(c(current_time$hour, current_time$mday, match(months(current_time), month.name), current_time$year+1900), collapse="-"))

# Initialize the column
data[,timecol] <- NA

# Loop through the file
for(i in 1:nrow(data)){
	Sys.sleep(5)
	resp <- tryCatch({getUser(data$twitter_account[i])}, error = function(e) { NA})
	if(!is.na(resp)){
		data[i,timecol] <- resp$getFollowersCount()
	}
}

# Write out the file
write.csv(data, file="congress.csv", row.names = FALSE)

