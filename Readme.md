## Likes Followers Views

Fetches FB likes, Twitter followers, and Youtube channel subscribers and individual video views for a given set of handles. 

Run a cronjob to ping regularly.

Takes a comma separated value file with the following columns: twitter_id, facebook_id, youtube_channel_id, video_id, likes, followers, subscribers, video_views

The script appends timestamped columns carrying likes, followers, subscribers, video_views. For e.g., 
likes 2015-01-31 03:50:10	followers 2015-01-31 03:50:10	subscribers 2015-01-31 03:50:10

The script also produces an error.log file containing all the tracebacks and exceptions thrown by the Likes-Followers-Views Class, e.g. error when accessing an API. Can be set to debug to see all info for points of access and outputs. 

### Instructions For Running the Script

* Install the required packages:
<code>pip install -r requirements.txt </code>
* Enter [Facebook](https://code.google.com/apis/console) and [Twitter](https://apps.twitter.com/) keys to [options.ini](https://github.com/soodoku/likes-followers-views/blob/master/config/options.ini)
* Download the [Google API key](https://code.google.com/apis/console) in json format and put in directory as: client_secrets.json

Note:  
Google Authenthication (API V3): The first time you run the script, you will be prompted via browser to authenticate the app. Choose accept and this will create a new json file in the working directory called app_name.py-oauth2.json.  

Usage:  
<code>python Likes-Followers-Views.py</code>
