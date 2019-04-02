
library("twitteR")
library("wordcloud")
library("tm")
library(e1071)
library(caret)
library(ggplot2)
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
consumer_key <- 'dVTkWOM4gphLKVTzbmF9bfw55'
consumer_secret <- 'WFQksFll9hdH8tNEuphRlNkVFthbyWqNBYIMNwRK8HPZok6Dua'
access_token <- '3391562385-manYUNtcun2bRPHhNudamTjooV6CKLZGAWQ2MAz'
access_secret <- 'yxw80rT9Elmt27EuZn0ZIAi9rRqF8a31hMb7kMLOzpv6T'
setup_twitter_oauth(consumer_key,
                    consumer_secret,
                    access_token,
                    access_secret)
gst<- searchTwitter("#GST", n=1000)
#tweets.df<-twListToDF(gst)
data<-do.call("rbind",lapply(gst,as.data.frame))
sample<-data$text
