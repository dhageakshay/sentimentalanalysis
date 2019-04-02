
#adding positive and negative words.txt files

pos.words=scan("positive-words.txt",what = 'character',comment.char = ';')
neg.words=scan("negative-words.txt",what = 'character',comment.char = ';')


#adding more words that people use

pos.words=c(pos.words, 'Congrats', 'prizes', 'prize', 'thanks', 'thnx', 'Grt', 'gr8', 'plz', 'trending', 'recovering', 'brainstorm', 'leader')
neg.words = c(neg.words, 'Fight', 'fighting', 'wtf', 'arrest', 'no', 'not')


