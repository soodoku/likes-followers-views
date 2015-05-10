## Likes Followers Views

Fetches FB likes, Twitter followers, and Youtube channel subscribers and individual video views for a given set of handles. 

Run a cronjob to ping regularly.

Takes a comma separated value file with the following columns: twitter_id, facebook_id, youtube_channel_id, video_id, likes, followers, subscribers, video_views

The script appends timestamped columns carrying likes, followers, subscribers, video_views. For e.g., 
likes 2015-01-31 03:50:10	followers 2015-01-31 03:50:10	subscribers 2015-01-31 03:50:10

The script also produces an error.log file containing all the tracebacks and exceptions thrown by the Likes-Followers-Views Class, e.g. error when accessing an API. Can be set to debug to see all info for points of access and outputs. 

### Instructions For Running the Script

Install the requirements:
<code>pip install -r requirements.txt </code>

* Copy all the facebook and twitter keys onto options.ini
* Download the google api keys in json format and put in directory as: client_secrets.json

Google Authenthication (API V3):
The first time running the script you will get prompted via webbrowser to authenticate the app, choose accept and this will create a new json file in the working directory called Social_Media_Pinger.py-oauth2.json.  

Main Script to run is Likes-Followers-Views.py

Usage:
<code>python Likes-Followers-Views.py</code>
