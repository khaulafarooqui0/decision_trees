#classification algorithms 

#1.	Building a decision tree model:

View(data4)

#read the data  using read.csv function
read.csv("C:\\Users\\KhaulA\\R_Practise\\MODULE6-DECISION_TREES\\Customer_Churn.csv",stringsAsFactors=T)->data4
data4
names(data4)

#a.	Start off by dividing the 'customer_churn' data into train & test sets in 70:30 ratio. The split-criteria would be determined by the 'Dependents' column

#split the data using sample.split  function using caTools library
library(tree)
library(caTools)
sample.split(data4$Dependents,SplitRatio = 0.70) ->div4
subset(data4,div4==T)->train4
subset(data4,div4==F)->test4

#b.	Build a decision tree model on top of the 'train' set, where the dependent variable is 'Dependents' & the independent variable is 'Partner'. Store the result in 'mod_tree1'

install.packages("tree")


tree(Dependents~Partner, data= train4) ->mod_tree1
mod_tree1

#c.	Plot the tree and add text

plot(mod_tree1)
text(mod_tree1)

#d.	Predict the values on the test set and store the result in 'result_tree1'

predict(mod_tree1,newdata = test4,type="class")->result_tree1
head(result_tree1)


actual=test$Dependents
head(actual)
cbind(actual,result_tree1)
#e.	Building the confusion matrix
table(test4$Dependents,result_tree1)->conf_mat
conf_mat


#f.	Calculating the accuracy

sum(diag(conf_mat))/sum(conf_mat)
