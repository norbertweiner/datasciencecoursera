git config --global user.name
git config --gloabl user.email ""
git config --list

git init

git remote add origin HTTPS://GITHUB.COM/NORBERTWEINER/DATA-SCIENCE-SPECIALIZATION-COURSERA.GIT

* set up origin 

git remote show origin 

* check origin 

Actually, you could remote add other names for different url. 

When you local repo is behind Github, then you need to git pull --allow-unrelated-histories origin master

git clone https://github.com/norbertweiner/courses.git

git add .
git add -u
git add -A
git commit -m "add wtf"
git push

Branch

git checkout -b branchname
git branch
git checkout master


---Markdown Syntax

ReadMe.md   .md means MarkDown

##This is secondary heading
### This is a tertiary heading

* first item in list

###Install R package

* a<-available.packages()
* Task View to find my own packages
* install.package("")

* source("http://bioconductor.org/bioLite.R")
* biocLite()
* biocLite(c("GenomicFeatures","AnnotationDbi"))



###Typese of DataScience Questions

* Describe a set of data
* Exploratory analysis  Correlation doesn't imply causation
* Inferential analysis: inference is commonly the goal of statistical models
* Predictive analysis: Accurate prediction depends heavily on measuring the right variables
* causal analysis
* mechanistic analysis

##### Data is the second most important thing. most important thing is the question you want to answer


###Experimental Design
* Variability Problem
* Confounding
* Correlation is not Causation
* Randomization and blocking
* Prediction versus inference

* Prediction key quantities
	** Sensitivity Pr(positive test | disease)
	** Specificity 
	** Positive Predictive Value
	** Negative Predictive Value
	** Accuracy

* Data Dredging
