Tweetstream on Heroku
=====================

There are 3 things to notice:

1. [Procfile](https://github.com/chamnap/tweetstream_heroku_example/blob/master/Procfile#L1), use `run` instead of `start`. This process must be run in foreground.

2. If you use `TweetStream::Daemon`, you must set `multiple` to `true` inside `daemon_options`, otherwise you'll see `ERROR: there is already one or more instance(s) of the program running` (I don't know why).

3. It's okay to use `TweetStream::Worker` in this worker.

Deploying
---------

    $ git push heroku master
    $ heroku config:add TWITTER_CONSUMER_KEY=CpQRGSIEQOelSGQci7YRTQ TWITTER_CONSUMER_SECRET=jq9rGXRbzKpOM079q6QC2mlPNsrkojhIuZiOPO1VkQs TWITTER_OAUTH_TOKEN=14653933-ZDyNKAXEAgm9sCEaLx2CJEjjEV6ualEfYPpf3b7ex TWITTER_OAUTH_TOKEN_SECRET=vEP7uHLGkMxgt4bTrZy0Tx4dNdfwaswK5FfZBjDI
    $ heroku ps:scale worker=1
