Tweetstream Daemon on Heroku
============================

Sample app for using Tweetstream daemon on heroku.

Deploying
---------

    $ git push heroku master
    $ heroku config:add TWITTER_CONSUMER_KEY=CpQRGSIEQOelSGQci7YRTQ TWITTER_CONSUMER_SECRET=jq9rGXRbzKpOM079q6QC2mlPNsrkojhIuZiOPO1VkQs TWITTER_OAUTH_TOKEN=14653933-ZDyNKAXEAgm9sCEaLx2CJEjjEV6ualEfYPpf3b7ex TWITTER_OAUTH_TOKEN_SECRET=vEP7uHLGkMxgt4bTrZy0Tx4dNdfwaswK5FfZBjDI
    $ heroku ps:scale worker=1