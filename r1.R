vector<-seq(5,60,by=5)
vector
cat("value of vector:",vector)
filtered_vector=vector[vector>15&vector<45]
filtered_vector

my_vector<-c(1,2,3,4,5)
my_vector
my_matrix<-matrix(1:9,nrow=3,ncol=3)
my_matrix
my_nested_list<-list(sub_vector=c("a","b","c"),sub_number=42)
my_list<-list(vector=my_vector,matrix=my_matrix,nested_list=my_nested_list)
my_list
for(name in names(my_list)){
  element_class<-class(my_list[[name]])
  cat("class of ",name,":",element_class,"\n")
}
print("no of objects in list:")
length(my_list)
print("length of first vector:")
length(my_list[[1]])
length(my_list$vector)

matrix1<-matrix(c(1,2,3,1,2,3,4,5,1),nrow=3,ncol=3)
matrix2<-matrix(c(1,5,3,1,8,3,4,9,1),nrow=3,ncol=3)
result<-matrix1+matrix2
print("result of addition: \n")
result
result<-matrix1-matrix2
print("result of subtraction \n")
result
result<-matrix1%*%t(matrix1)
print("result of multiplictaion \n")
result

print("column sum:\n")
colSums(matrix1)
print("mean across rows")
apply(matrix1,1,mean)
print("total sum \n")
sum(matrix1)
print("sort by columns")
apply(matrix1,2,sort)