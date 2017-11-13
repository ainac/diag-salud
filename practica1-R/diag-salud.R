library(twitteR)
library(RCurl)
library(RJSONIO)
library(stringr)
api_key <- "PS3yvXxX89E2W08o6za6oBR98"
api_secret <- "0wjcRhIKNf1CCCUdsTZNv2sRZdiX6Tspv59a9bOvWbFfQ7zpUU"
token <- "929642822340431872-kXMXgOexjaSQ3nUrAdUoIdNX4yORb1x"
token_secret <- "5OiOHdtDwu3ljTpV2p0imNwWLd3O1wJru7lt35fSO1W7l"
setup_twitter_oauth(api_key, api_secret, token, token_secret)
tweets <- searchTwitter("'health diagnosis' 'big data'", n=200, lang = "en")

# esta no funciona
#tweetsdf <- as.data.frame(tweets)

twwetsdf <- twListToDF(tweets)

tweetsdf <- twListToDF(tweets)
nrow(tweetsdf)
names(tweetsdf)

twts <- searchTwitter("'#bigdata' 'health' 'diagnosis'", n=200)
length(twts)

twtsdf <- twListToDF(twts)
names(twtsdf)
str(twtsdf)
twtsdf[1, c("id", "screenName", "created","text")]
sum(twtsdf$latitud)
sum(twtsdf$longitude)
twtsdf$created
twtsp <- searchTwitter("'#bigdata' 'health' 'diagnosis'", n=200, resultType="popular")
twtsp <- searchTwitter("'#bigdata' 'health' 'diagnosis'", n=200, resultType="recent")
twtsp <- searchTwitter("'#bigdata' 'health' 'diagnosis'", n=200, since="2017-01-01", until="2017-08-31")
twtsa <- searchTwitter("'big data' 'health' 'diagnosis'", n=200)
twtsadf <- twListToDF(twtsa)
nrow(twtsadf)
twtsdf$id
twtsadf$id
twdf <- unique(rbind(twtsdf, twtsadf))
nrow(twdf)
unique(twdf$screenName)
write.csv(twdf,file="diag-salud-dat1.csv")
twtsb <- searchTwitter("'big data' 'healthcare'", n=2000)
twtsbdf <- twListToDF(twtsb)
nrow(twtsbdf)
tdf <- unique(rbind(twdf, twtsbdf))
nrow(tdf)
write.csv(tdf,file="diag-salud-incRetweets.csv")
tudf <- subset(tdf,isRetweet == FALSE)
nrow(tudf)
length(unique(tudf$screenName))
write.csv(tudf,file="diag-salud.csv")

