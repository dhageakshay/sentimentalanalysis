
GST_text = sapply(gst, function(x) x$getText()) #sapply returns a vector 
data<- do.call("rbind", lapply(GST.tweets, as.data.frame)) #lapply returns a list
GST_text <- sapply(df$text,function(row) iconv(row, "latin1", "ASCII", sub=""))
str(GST_text) #gives the summary/internal structure of an R object

library(tm) #tm: text mining
GST_corpus <- Corpus(VectorSource(GST_text)) #corpus is a collection of text documents
GST_corpus
inspect(GST_corpus[1])

#clean text
library(wordcloud)
GST_clean <- tm_map(GST_corpus, removePunctuation)
GST_clean <- tm_map(GST_clean, removeWords, stopwords("english"))
GST_clean <- tm_map(GST_clean, removeNumbers)
GST_clean <- tm_map(GST_clean, stripWhitespace)
#wordcloud(GST_clean, random.order=F,max.words=80, col=rainbow(50), scale=c(3.5,1))
library(RColorBrewer)
pal2 <- brewer.pal(8,"Dark2")
wordcloud(GST_clean,min.freq=2,max.words=80, random.order=T, colors=pal2)


