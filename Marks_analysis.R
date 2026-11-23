>library(readxl)
> data<-read_excel("C:/Users/PRAGYANSMITA MEHER/Downloads/MID SEMESTER EXAMINATION MARKS SHEET-DATA SCIENCE.xlsx",skip=2)
> names(data)<-c("SNo","Admission_No","Name","Marks","Gender")
> data$Gender<-as.factor(data$Gender)
> data$Marks<-as.numeric(data$Marks)
> lowest<-aggregate(Marks~Gender,
                    + data=data,FUN=min,
                    + na.action=na.omit)
> highest<-aggregate(Marks~Gender,
                     + data=data,FUN=max,
                     + na.action=na.omit)
> Average<-aggregate(Marks~Gender,data,mean)
> result<-merge(lowest,highest,by="Gender")
> result<-merge(result,Average,by="Gender")
> names(result) <-c("Gender","Minimum","maximum","Average")
> print(result)