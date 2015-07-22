### Likes Followers Views

Fetch FB likes, Twitter followers, and Youtube channel subscribers and individual video views for a given set of handles. 

Run a cronjob to ping regularly.

#### Scripts

**Note** The scripts expect twitter handles, facebook usernames, and youtube ids to be in column names that are in [data/congress.csv](data/congress.csv)

* [Fetch FB Likes](fb_likes.R)
* [Fetch Twitter Followers](twtr_followers.R)
* [Fetch YouTube Views](yt_views.R)

#### Setting up a cronjob on Windows

1. Create a .bat file: `"path\to\RScript" path\to\r\script.R`
2. Schedule task: `schtasks /create /tn "name" /tr path\to\batfile.bat /sc daily /st hh:mm:ss`


### License
Scripts are released under the [MIT License](License.md).
