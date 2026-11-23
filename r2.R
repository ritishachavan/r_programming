username<-readline(prompt="Enter your name")

numchar<-nchar(username)
print("no of characters:")
print(numchar)
uppername<-toupper(username)
print("in uppercase:")
print(uppername)
middle_index=ceiling(numchar/2)
print(middle_index)
middle_char=substr(username,middle_index,middle_index)
print("middle character:")
print(middle_char)

palindrome<-function(s){
  s<-tolower(s)
  chars=strsplit(s,"")[[1]]
  reversed<-paste(rev(chars),collapse="")
  print(reversed)
  return(s==reversed)
}
cat("madam is palindrome?",palindrome("madam"),"\n")
cat("hello is palindrome?",palindrome("hello"))
