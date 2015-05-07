## Likes Followers Views

Monitors FB likes, Twitter followers, and Youtube channel subscribers and individual video views.

### Requirements

* python 2.7
* facebook-sdk==1.0.0a0
* google-api-python-client==1.3.1
* httplib2==0.9
* oauth2client==1.4.6
* oauthlib==0.7.2
* pyasn1==0.1.7
* pyasn1-modules==0.0.5
* requests==2.4.3
* requests-oauthlib==0.4.1
* rsa==3.1.4
* simplejson==3.6.5
* six==1.9.0
* tweepy==3.2.0
* uritemplate==0.6
* youtube-api-wrapper==0.2


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

Input/output:

Input: LFV.csv, a comma separated value file with the following columns: 
twitter_id, facebook_id, youtube_channel_id, video_id, likes, followers, subscribers, video_views

Output: LFV.csv, error.log
Appends to LFV.csv timestamped columns carrying likes, followers, subscribers, video_views. for e.g., 
likes 2015-01-31 03:50:10	followers 2015-01-31 03:50:10	subscribers 2015-01-31 03:50:10

The error.log file contains all the tracebacks and exceptions thrown by the Likes-Followers-Views Class when accessing an API or any other exception. Can be set to debug to see all info for points of access and outputs. 