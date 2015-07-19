"
Track FB Likes of political pages

"

library(httr)

# Use github version
library(devtools)
install_github("pablobarbera/Rfacebook/Rfacebook")

# Simple FB Tokening 
# After Getting your App ID
# Go to https://developers.facebook.com/tools/explorer/ for token
library(Rfacebook)
token <- "TOKEN" # put token here
getUsers("hillaryclinton", token, private_info = TRUE)


"
Set up long term token

Follow directions posted at: 
http://thinktostart.com/analyzing-facebook-with-r/

"

if(!file.exists("fb_oauth")){
	# when you run the script first time, run this...
	fb_oauth <- fbOAuth(app_id="x", app_secret="x",extended_permissions = TRUE)
	save(fb_oauth, file="fb_oauth")
}

load("fb_oauth")

# Get likes of a single user
getUsers(users="hillaryclinton",token=fb_oauth)$likes

# Alternate
resp <- httr::GET(paste0('https://graph.facebook.com/', "hillaryclinton", '?fields=likes'), config(token=fb_oauth))
content(resp)$likes

# Doing it for a csv and creating a time stamp column

# Read in data
data <- read.csv("data/congress.csv")

# Create column name with time stamp
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Get time
current_time <- as.POSIXlt(Sys.time())
# Concatenate hour, day, month, year 
timecol <- paste0("fblike-", paste(c(current_time$hour, current_time$mday, match(months(current_time), month.name), current_time$year+1900), collapse="-"))

# Initialize the column
data[,timecol] <- NA

# Loop through the file
for(i in 1:nrow(data)){
	resp <- httr::GET(paste0('https://graph.facebook.com/', data$facebook_id[i], '?fields=likes'), config(token=fb_oauth))
	if(resp$status_code==200){
		# Some pages without likes o_o
		if(exists('likes', where=content(resp))){
			data[i,timecol] <- content(resp)$likes
		}
	}
}

# Write out the file
write.csv(data, file="data/ccongress.csv", row.names = FALSE)

