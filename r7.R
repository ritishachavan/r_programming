library(rvest)
url<-"http://books.toscrape.com"
html_content<-read_html(url,encoding="Utf-8")
title_xpath<-'//article[@class="product_pod"]/h3/a'
price_xpath<-'//article[@class="product_pod"]//p[@class="price_color"]'
titles<-html_content%>%
  html_nodes(xpath=title_xpath)%>%
  html_attr("title")
prices<-html_content%>%
  html_nodes(xpath=price_xpath)%>%
  html_text()%>%
  trimws()
book_data<-data.frame(title=titles,price=prices)
print(book_data)
write.csv(book_data,"book_data.csv",row.names=FALSE,fileEncoding="UTF-8")
cat("Saved",nrow(book_data),"rows to",getwd(),"\n")