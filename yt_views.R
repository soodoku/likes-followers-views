"

Track No. of Views to a Video on YouTube

"

"
Setting up access to the API:

1. YouTube supports OAuth 2.0.
2. Go to https://console.developers.google.com/project for tokens
3. Click on credentials and get client id and secret.

"

# Set up oauth w/ httr

library(httr)

oauth_endpoints("google")
myapp <- oauth_app("google",
  key = "X",
  secret = "Y")

# While setting up oauth, choose scope as youtube
google_token <- oauth2.0_token(oauth_endpoints("google"), myapp, scope = "https://www.googleapis.com/auth/youtube")

# Get views of a single video
req <- GET("https://www.googleapis.com/youtube/v3/videos?part=statistics&id=N708P-A45D0", config(token = google_token))
content(req)$items[[1]]$statistics$viewCount

# Create column name with time stamp
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Get time
current_time <- as.POSIXlt(Sys.time())
# Concatenate hour, day, month, year 
timecol <- paste0("ytvideolikes.", paste(c(current_time$hour, current_time$mday, match(months(current_time), month.name), current_time$year+1900), collapse="."))

# Initialize the column
data[,timecol] <- NA

# Loop through the file
for(i in 1:nrow(data)){
	resp <- GET(paste0("https://www.googleapis.com/youtube/v3/videos?part=statistics&id=",data$youtube_video_id[i]), config(token = google_token))
	data[i,timecol] <- content(resp)$items[[1]]$statistics$viewCount
}

# Write out the file
write.csv(data, file="data/congress.csv", row.names = FALSE)

