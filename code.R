# CORRECTIONS 
# 1. must add a dataset that includes all migrants not just forced migrants (DONE)
# 2. Don't filter the dataset, make sure to keep those even that are not participating in the labor force (DONE)
# 3. organize code well so that we can look at it step by step 
# 4. add other incomes to total income (DONE)
#   a. seperate total income from base income 
#   b. divide yearly incomes by 12 


### Import Datasets ###

Educaciขn <- read_dta("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/DANE info/2020/Educacion/Educaciขn.dta")
Caracterกsticas_y_composiciขn_del_hogar <- read_dta("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/DANE info/2020/Caracteristicas y composicion del hogar/Caracterกsticas y composiciขn del hogar.dta")
Fuerza_de_trabajo <- read_dta("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/DANE info/2020/Fuerza de trabajo/Fuerza de trabajo.dta")
Tecnologกas_de_informaciขn_y_comunicaciขn <- read_dta("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/DANE info/2020/Tecnologias de informacion y comunicacion/Tecnologกas de informaciขn y comunicaciขn.dta")


###  Extract variables ###


Personal <- Caracterกsticas_y_composiciขn_del_hogar[, c("DIRECTORIO","SECUENCIA_ENCUESTA", "SECUENCIA_P", "ORDEN", "FEX_C",
                                                        "P6040", "P6076S1", "P6076S2", "P767", "P6096", "P6020")]
Education <- Educaciขn[, c("DIRECTORIO", "SECUENCIA_ENCUESTA", "SECUENCIA_P", "ORDEN", "FEX_C", "P8587")]
Employment <- Fuerza_de_trabajo[, c("DIRECTORIO","SECUENCIA_ENCUESTA", "SECUENCIA_P", "ORDEN", "FEX_C",
                                    "P6240", "P6280", "P6435", "P8624", "P6595S1", "P6605S1", "P6623S1", "P6615S1",
                                    "P8626S1", "P8628S1", "P8630S1", "P8631S1", "P1087S1A1", "P1087S2A1", "P1087S3A1", "P1087S4A1", "P6750", "P550")]
Technologies <- Tecnologกas_de_informaciขn_y_comunicaciขn[, c("DIRECTORIO","SECUENCIA_ENCUESTA", "SECUENCIA_P", "ORDEN", "FEX_C",
                                                              "P1910", "P1911", "P1912", "P1084", "P1085S1", "P1085S2", "P1085S3", "P1085S4", "P1085S5", "P1085S6", "P1085S7",
                                                              "P1083S1", "P1083S2", "P1083S3", "P1083S4", "P1083S5", "P1083S6", "P1083S7", "P1083S8", "P1083S9", "P1083S10", "P1083S12", "P1083S13", "P1083S14", "P1083S15", "P1083S11")]



###  Rename Variables ###


#Personal
names(Personal)[1]<-paste("directory")
names(Personal)[2]<-paste("sequence")
names(Personal)[3]<-paste("sequence1")
names(Personal)[4]<-paste("order")
names(Personal)[5]<-paste("expansion_factor")
names(Personal)[6]<-paste("age")
names(Personal)[7]<-paste("past_state")
names(Personal)[8]<-paste("past_municipality")
names(Personal)[9]<-paste("yearshere")
names(Personal)[10]<-paste("movereason")
names(Personal)[11]<-paste("gender")

#Education
names(Education)[1]<-paste("directory")
names(Education)[2]<-paste("sequence")
names(Education)[3]<-paste("sequence1")
names(Education)[4]<-paste("order")
names(Education)[5]<-paste("expansion_factor")
names(Education)[6]<-paste("edulevel")

# Employment
names(Employment)[1]<-paste("directory")
names(Employment)[2]<-paste("sequence")
names(Employment)[3]<-paste("sequence1")
names(Employment)[4]<-paste("order")
names(Employment)[5]<-paste("expansion_factor")
names(Employment)[6]<-paste("labor")
names(Employment)[7]<-paste("unemployed_last_week")
names(Employment)[8]<-paste("worktype")
names(Employment)[9]<-paste("base_income")
names(Employment)[10]<-paste("payment_food")
names(Employment)[11]<-paste("payment_housing")
names(Employment)[12]<-paste("other_income")
names(Employment)[13]<-paste("transportation_assistance")
names(Employment)[14]<-paste("food_subsidy")
names(Employment)[15]<-paste("transportation_subsidy")
names(Employment)[16]<-paste("family_subsidy")
names(Employment)[17]<-paste("antiquity_premium")
names(Employment)[18]<-paste("services_premium")          # divide by 12 
names(Employment)[19]<-paste("christmas_premium")         # divide by 12
names(Employment)[20]<-paste("vacation_premium")          # divide by 12
names(Employment)[21]<-paste("bonus_premium")             # divide by 12 
names(Employment)[22]<-paste("business_profit")
names(Employment)[23]<-paste("yearly_business_profit")    # divide by 12 


# Technology 
names(Technologies)[1]<-paste("directory")
names(Technologies)[2]<-paste("sequence")
names(Technologies)[3]<-paste("sequence1")
names(Technologies)[4]<-paste("order")
names(Technologies)[5]<-paste("expansion_factor")
names(Technologies)[6]<-paste("desktop")
names(Technologies)[7]<-paste("laptop")
names(Technologies)[8]<-paste("tablet")
names(Technologies)[9]<-paste("freq_internet_use")
names(Technologies)[10]<-paste("I5home")
names(Technologies)[11]<-paste("I5work")
names(Technologies)[12]<-paste("I5learningcenter")
names(Technologies)[13]<-paste("I5publicaccess")
names(Technologies)[14]<-paste("I5cafeinternet")
names(Technologies)[15]<-paste("I5friendhouse")
names(Technologies)[16]<-paste("I5other")
names(Technologies)[17]<-paste("I6obtain_information")
names(Technologies)[18]<-paste("I6email")
names(Technologies)[19]<-paste("I6social_networks")
names(Technologies)[20]<-paste("I6online_shopping")
names(Technologies)[21]<-paste("I6ebank")
names(Technologies)[22]<-paste("I6learning")
names(Technologies)[23]<-paste("I6admin")
names(Technologies)[24]<-paste("I6downloads")
names(Technologies)[25]<-paste("I6media")
names(Technologies)[26]<-paste("I6entertainment")
names(Technologies)[27]<-paste("I6lookforwork")
names(Technologies)[28]<-paste("I6storeinfo")
names(Technologies)[29]<-paste("I6sell")
names(Technologies)[30]<-paste("I6work")
names(Technologies)[31]<-paste("I6other")

rm(Caracterกsticas_y_composiciขn_del_hogar, Educaciขn, Fuerza_de_trabajo, Tecnologกas_de_informaciขn_y_comunicaciขn)



### Merge existing datasets ###

data1 <- merge(Employment, Education, by=c("directory", "sequence", "sequence1", "order", "expansion_factor"), all = TRUE)
data2 <- merge(data1, Personal, by=c("directory", "sequence", "sequence1", "order", "expansion_factor"), all = TRUE)
main.df <- merge(data2, Technologies, by=c("directory", "sequence", "sequence1", "order", "expansion_factor"), all = TRUE)
rm(data1, data2)


### Creating variables of interest 

# 1. Create labor force dummy 

main.df$labor_force <- ifelse(main.df$labor==1 | main.df$labor==2 | main.df$unemployed==1, 1, 0)


                                      #STILL NEEDS CORRECTING 

# 2. adding incomes together and dividing yearly incomes by 12 

main.df$services_premium <- main.df$services_premium/12
main.df$christmas_premium <- main.df$christmas_premium/12
main.df$vacation_premium <- main.df$vacation_premium/12
main.df$bonus_premium <- main.df$bonus_premium/12
main.df$yearly_business_profit <- main.df$yearly_business_profit/12

main.df[is.na(main.df)]=0
main.df$total_income <- main.df$base_income+main.df$payment_food+main.df$payment_housing+main.df$other_income+
                  main.df$transportation_assistance+main.df$food_subsidy+main.df$transportation_subsidy+
                  main.df$family_subsidy+main.df$antiquity_premium+main.df$services_premium+main.df$christmas_premium
                  main.df$vacation_premium+main.df$bonus_premium+main.df$business_profit+main.df$yearly_business_profit

# 3. total internet usage and specified internet usage (Ask how we should divide internet usage)
                  
main.df$focused_internet <- ifelse(main.df$I6obtain_information==1 | main.df$I6email==1 | main.df$I6ebank==1 | main.df$I6learning==1 |
                                 main.df$I6admin==1 | main.df$I6media==1 | main.df$I6lookforwork==1 | main.df$I6storeinfo==1 | 
                                 main.df$I6sell==1 | main.df$I6work==1, 1, 0)

main.df$all_internet <- ifelse(main.df$I6obtain_information==1 | main.df$I6email==1 |main.df$I6social_networks==1 | main.df$I6online_shopping==1 |
                                main.df$I6ebank==1 | main.df$I6learning==1 | main.df$I6admin==1 | main.df$I6downloads==1 | main.df$I6media==1 | 
                                main.df$I6entertainment==1 | main.df$I6lookforwork==1 | main.df$I6storeinfo==1 | main.df$I6sell==1 | 
                                main.df$I6work==1 | main.df$I6other==1, 1, 0)


### Cleaning up data ###


main.df$employed <- ifelse(main.df$labor ==1, 1, 0)
main.df$unemployed <- ifelse(main.df$labor ==2 | main.df$labor==2 & main.df$unemployed_last_week==1, 1, 0)

# unemployed but part of the labor force 
main.df$unemployed_last_week[main.df$unemployed_last_week == 2] <- 0 

# internet usage 
main.df$daily_internet <- ifelse(main.df$freq_internet_use == 1, 1, 0)
main.df$weekly_internet <- ifelse(main.df$freq_internet_use == 1 |
                         main.df$freq_internet_use ==2, 1, 0)

# change 2's to 0's
main.df$gender[main.df$gender == 2] <-0

# Electronics use daily and at least once a week 
main.df$daily_ict <- ifelse(main.df$desktop==1 | main.df$laptop==1 | main.df$tablet==1, 1, 0)
main.df$weekly_ict <- ifelse(main.df$desktop==1 | main.df$laptop==1 | main.df$tablet==1 | 
                             main.df$desktop==2 | main.df$laptop==2 | main.df$tablet==2, 1, 0)

# Changing income of 0 to income of 1 
main.df$total_income[main.df$total_income==0]<- 1


### Focusing on cohort of interest ###

# 1. All Migrants 

all_migrants <- subset(main.df, movereason!=0)

# 2. forced migrants

main.df$forced <- ifelse(main.df$movereason==2 | main.df$movereason==3, 1, 0)
forced_migrants <- subset(main.df, forced!=0)

# We are looking at those who were employed last week (labor==1), those unemployed 
# but looking for a job in the past week (labor==2) and those who were unemployed, 
# but looking for a job in the past month



### Climate migrants ###

climate <- subset(Main, movereason!=3)


### Descriptive statistics of dataset ###

# main dataset 
table(main.df$daily_internet)
table(main.df$weekly_internet)
table(main.df$daily_internet, main.df$employed)
table(main.df$weekly_internet, main.df$employed)
aggregate(total_income ~ daily_internet, main.df, mean)
aggregate(total_income ~ weekly_internet, main.df, mean)

# all migrants dataset
table(all_migrants$daily_internet)
table(all_migrants$weekly_internet)
table(all_migrants$daily_internet, all_migrants$employed)
table(all_migrants$weekly_internet, all_migrants$employed)
aggregate(total_income ~ daily_internet, all_migrants, mean)
aggregate(total_income ~ weekly_internet, all_migrants, mean)

# forced migrants dataset 

table(forced_migrants$daily_internet)
table(forced_migrants$weekly_internet)
table(forced_migrants$daily_internet, forced_migrants$employed)
table(forced_migrants$weekly_internet, forced_migrants$employed)
aggregate(total_income ~ daily_internet, forced_migrants, mean)
aggregate(total_income ~ weekly_internet, forced_migrants, mean)


#####################################################################################

                                ### Regressions ###


install.packages("stargazer")
library(stargazer)

model1 <- lm(log(total_income)~daily_internet, data = forced_migrants)
summary(model1)
model2 <- lm(log(total_income)~daily_internet+gender+age+edulevel+yearshere, data = forced_migrants)
summary(model2)


stargazer(model1, model2, 
          title = "Daily Internet Usage Affects on Income for Forced Migrants", 
          dep.var.caption = "DV: Employee Income", 
          covariate.labels = c("Daily Internet Usage", "Male", "Age", "Level of Education", 
                               "Years in Current Municipality"), 
          notes.label = "Significance Levels", 
          type = "html", 
          out = "~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Meeting Preps /Meeting - 06.15.2022 /daily-income-regression.htm")
rm(model1, model2)

model1 <- lm(log(total_income)~weekly_internet, data = forced_migrants)
summary(model1)
model2 <- lm(log(total_income)~weekly_internet+gender+age+edulevel+yearshere, data = forced_migrants)
summary(model2)

stargazer(model1, model2, 
          title = "Weekly Internet Usage Affects on Income for Forced Migrants", 
          dep.var.caption = "DV: Employee Income", 
          covariate.labels = c("Daily Internet Usage", "Male", "Age", "Level of Education", 
                               "Years in Current Municipality"), 
          notes.label = "Significance Levels", 
          type = "html", 
          out = "~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Meeting Preps /Meeting - 06.15.2022 /weekly-income-regression.htm")
rm(model1, model2)


logit2prob <- function(logit){
  odds <- exp(logit)
  prob <- odds / (1 + odds)
  return(prob)
}

model1 <- glm(employed~daily_internet+gender+age+edulevel+yearshere, family = binomial(link = 'logit'), data = forced_migrants)
summary(model1)
coef(model1)
logit2prob(coef(model1))
(intercept <- coef(model1)[1])
(daily <- coef(model1)[2])
(male <- coef(model1)[3])
(age <- coef(model1)[4])
(edulevel <- coef(model1)[5])
logits_daily <- intercept + 1*daily
logits_male <- intercept + 1*male
logits_age40 <- intercept + 40*age 
logits_edulevel9 <- intercept + 9*edulevel
logit2prob(logits_daily)
logit2prob(logits_male)
logit2prob(logits_age40)
logit2prob(logits_edulevel9)
rm(age, edulevel, gender, weekly, intercept, logits_age20, logits_age40, logits_age60, 
   logits_edulevel11, logits_edulevel13, logits_edulevel7, logits_edulevel9, 
   logits_male, logits_daily, daily, male)

stargazer(model1, 
          title = "Daily Internet Usage Affects on Employment Probability for Forced Migrants", 
          dep.var.caption = "DV: Log Odds - Employment", 
          covariate.labels = c("Daily Internet Usage", "Male", "Age", "Level of Education", 
                               "Years in Current Municipality"), 
          notes.label = "Significance Levels", 
          type = "html", 
          out = "~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Meeting Preps /Meeting - 06.15.2022 /prob.regression.htm")

model2 <- logit2prob(coef(model1))
model3 <- logit2prob(logits_daily)
model4 <- logit2prob(logits_male)
model5 <- logit2prob(logits_age40)
model6 <- logit2prob(logits_edulevel9)

stargazer(model2, model3, model4, model5, model6,
          title = "Log Odds to Probability", 
          dep.var.caption = "DV: Log Odds - Employment", 
          covariate.labels = c("Intercept", "Daily Internet Usage", "Male", "Age", "Level of Education", 
                               "Years in Current Municipality"), 
          notes.label = "Significance Levels", 
          type = "html", 
          out = "~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Meeting Preps /Meeting - 06.15.2022 /prob.regression1.htm")
rm(model1, model2, model3, Main, main)



########################################################################################################



### Not controlling for employment or how internet is used ###

### Merge existing datasets ###

data1 <- merge(Employment, Education, by=c("directory", "sequence", "sequence1", "order"), all = TRUE)
data2 <- merge(data1, Personal, by=c("directory", "sequence", "sequence1", "order"), all = TRUE)
mergedata <- merge(data2, Technologies, by=c("directory", "sequence", "sequence1", "order"), all = TRUE)
rm(data1, data2)
rm(Education, Employment, Personal, Technologies)



### Focusing on cohort of interest ###

# 1. forced migrants

Main1 <- mergedata[!is.na(mergedata$movereason),]
Main1$forced <- ifelse(Main1$movereason==2 | Main1$movereason==3, 1, 0)
main <- subset(Main1, forced!=0)
rm(mergedata, Main1)


# 2. labor force participants

Main <- subset(main, labor==1 | labor==2 | unemployed==1)
rm(main)

# We are looking at those who were employed last week (labor==1), those unemployed 
# but looking for a job in the past week (labor==2) and those who were unemployed, 
# but looking for a job in the past month


# 4. income of workers  

Main[is.na(Main)]=0
Main$income <- Main$baseincome+Main$foodassistance+Main$livingassistance+Main$otherincome+
  Main$transassistance+Main$bonus+Main$totalincome+Main$totalincomefarm

Main$income[Main$income ==0]<- 1



### Cleaning up data ###

Main$labor1 <- ifelse(Main$labor ==1, 1, 0)

# unemployed but part of the labor force 
Main$unemployed[Main$unemployed == 2] <- 0 

# internet usage 
Main$daily <- ifelse(Main$internetusage == 1, 1, 0)
Main$weekly <- ifelse(Main$internetusage == 1 |
                        Main$internetusage ==2, 1, 0)

# change 2's to 0's
Main$gender[Main$gender == 2] <-0

# Electronics use daily and at least once a week 
Main$ictuse <- ifelse(Main$desktop==1 | Main$laptop==1 | Main$tablet==1, 1, 0)
Main$ictuse1 <- ifelse(Main$desktop==1 | Main$laptop==1 | Main$tablet==1 | 
                         Main$desktop==2 | Main$laptop==2 | Main$tablet==2, 1, 0)

# Changing income of 0 to income of 1 
Main$income[Main$income==0]<- 1



### Climate migrants ###

climate <- subset(Main, movereason!=3)
rm(climate)


### Descriptive statistics of dataset ###


table(Main$daily)
table(Main$weekly)
table(Main$daily, Main$labor1)
table(Main$weekly, Main$labor1)
aggregate(income ~ daily, Main, mean)
aggregate(income ~ weekly, Main, mean)
table(Main$ictuse)
table(Main$ictuse, Main$labor1)

cor(Main$income, Main$daily, method = c("pearson"))
cor.test(Main$income, Main$daily, method = c("pearson"))



### Regressions ###

model1 <- lm(log(income)~daily, data = Main)
summary(model1)
model2 <- lm(log(income)~daily+gender+age+edulevel+yearshere, data = Main)
summary(model2)
model3 <- lm(log(income)~weekly, data = Main)
summary(model3)
model4 <- lm(log(income)~weekly+gender+age+edulevel+yearshere, data = Main)
summary(model4)


stargazer(model1, model2, 
          title = "Daily Internet Usage Affects on Income for Forced Migrants", 
          dep.var.caption = "Employee Income", 
          covariate.labels = c("Daily Internet Usage", "Male", "Age", "Level of Education", 
                               "Years in Current Municipality"), 
          notes.label = "Significance Levels", 
          type = "html", 
          out = "~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Meeting Preps /Week - 05.30.2022/dailyregression.htm")

stargazer(model3, model4, 
          title = "Weekly Internet Usage Affects on Income for Forced Migrants", 
          dep.var.caption = "Employee Income", 
          covariate.labels = c("Weekly Internet Usage", "Male", "Age", "Level of Education", 
                               "Years in Current Municipality"), 
          notes.label = "Significance Levels", 
          type = "html", 
          out = "~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Meeting Preps /Week - 05.30.2022/weeklyregression.htm")




################################################################################################



### Looking at all the municipalities in the dataset ###

# number of forced migrants per municipality 
Municipalities <- table(Municipality = Main$past_municipality, State = Main$past_state)
Municipalities <- as.data.frame.matrix(Municipalities) 
Municipalities$migrants <- Municipalities$`11`+Municipalities$`13`+Municipalities$`15`+Municipalities$`17`+
  Municipalities$`18`+Municipalities$`19`+Municipalities$`20`+Municipalities$`23`+Municipalities$`25`+
  Municipalities$`27`+Municipalities$`41`+Municipalities$`44`+Municipalities$`47`+Municipalities$`5`+
  Municipalities$`50`+Municipalities$`52`+Municipalities$`54`+Municipalities$`63`+Municipalities$`66`+
  Municipalities$`68`+Municipalities$`70`+Municipalities$`73`+Municipalities$`76`+Municipalities$`8`+
  Municipalities$`81`+Municipalities$`85`+Municipalities$`86`+Municipalities$`91`+Municipalities$`94`+
  Municipalities$`95`+Municipalities$`97`+Municipalities$`99`
Municipalities <- cbind(rownames(Municipalities), Municipalities)
rownames(Municipalities) <- NULL
names(Municipalities)[1] <- "municipality"
names(Municipalities)[34]<-"migrants"
migrants_per_municipality <- data.frame(Municipalities$municipality, Municipalities$migrants)
rm(Municipalities)
names(migrants_per_municipality)[1]<-"municipality"
names(migrants_per_municipality)[2]<-"migrants"

# Municipalities not of 5 and 6th strata (used to remove from "migrants_per_municiplity" dataframe)
rmunicipios <- subset(CT01_Categorizacion_2022, Categoría==1 | Categoría==2 | Categoría==3 | Categoría==4 | Categoría=="ESP")
rmunicipios$`Código CGN` <- sub('....', '', rmunicipios$`Código CGN`)

#remove those municipalities from dataset 
table(rmunicipios$`Código CGN`)
migrants_per_municipality$delete <- ifelse(migrants_per_municipality$municipality==5001 | migrants_per_municipality$municipality==5045 | migrants_per_municipality$municipality==5079 |
                                             migrants_per_municipality$municipality==5088 | migrants_per_municipality$municipality==5129 | migrants_per_municipality$municipality==5148 |
                                             migrants_per_municipality$municipality==5212 | migrants_per_municipality$municipality==5266 | migrants_per_municipality$municipality==5308 |
                                             migrants_per_municipality$municipality==5318 | migrants_per_municipality$municipality==5360 | migrants_per_municipality$municipality==5376 |
                                             migrants_per_municipality$municipality==5380 | migrants_per_municipality$municipality==5440 | migrants_per_municipality$municipality==5604 |
                                             migrants_per_municipality$municipality==5607 | migrants_per_municipality$municipality==5615 | migrants_per_municipality$municipality==5631 |
                                             migrants_per_municipality$municipality==5736 | migrants_per_municipality$municipality==5837 | migrants_per_municipality$municipality==8001 |
                                             migrants_per_municipality$municipality==8433 | migrants_per_municipality$municipality==8573 | migrants_per_municipality$municipality==8758 |
                                             migrants_per_municipality$municipality==11001 | migrants_per_municipality$municipality==13001 | migrants_per_municipality$municipality==13836 |
                                             migrants_per_municipality$municipality==15001 | migrants_per_municipality$municipality==15238 | migrants_per_municipality$municipality==15759 |
                                             migrants_per_municipality$municipality==17001 | migrants_per_municipality$municipality==18001 | migrants_per_municipality$municipality==19001 |
                                             migrants_per_municipality$municipality==20001 | migrants_per_municipality$municipality==20011 | migrants_per_municipality$municipality==23001 |
                                             migrants_per_municipality$municipality==25126 | migrants_per_municipality$municipality==25175 | migrants_per_municipality$municipality==25214 |
                                             migrants_per_municipality$municipality==25269 | migrants_per_municipality$municipality==25286 | migrants_per_municipality$municipality==25290 |
                                             migrants_per_municipality$municipality==25307 | migrants_per_municipality$municipality==25430 | migrants_per_municipality$municipality==25473 |
                                             migrants_per_municipality$municipality==25612 | migrants_per_municipality$municipality==25754 | migrants_per_municipality$municipality==25758 |
                                             migrants_per_municipality$municipality==25799 | migrants_per_municipality$municipality==25817 | migrants_per_municipality$municipality==25899 |
                                             migrants_per_municipality$municipality==27001 | migrants_per_municipality$municipality==41001 | migrants_per_municipality$municipality==41551 |
                                             migrants_per_municipality$municipality==44001 | migrants_per_municipality$municipality==44430 | migrants_per_municipality$municipality==44560 |
                                             migrants_per_municipality$municipality==44847 | migrants_per_municipality$municipality==47001 | migrants_per_municipality$municipality==50001 |
                                             migrants_per_municipality$municipality==50006 | migrants_per_municipality$municipality==50568 | migrants_per_municipality$municipality==50573 |
                                             migrants_per_municipality$municipality==52001 | migrants_per_municipality$municipality==52356 | migrants_per_municipality$municipality==52835 |
                                             migrants_per_municipality$municipality==54001 | migrants_per_municipality$municipality==54405 | migrants_per_municipality$municipality==54874 |
                                             migrants_per_municipality$municipality==63001 | migrants_per_municipality$municipality==66001 | migrants_per_municipality$municipality==66170 |
                                             migrants_per_municipality$municipality==68001 | migrants_per_municipality$municipality==68081 | migrants_per_municipality$municipality==68276 |
                                             migrants_per_municipality$municipality==68307 | migrants_per_municipality$municipality==68547 | migrants_per_municipality$municipality==70001 |
                                             migrants_per_municipality$municipality==73001 | migrants_per_municipality$municipality==73268 | migrants_per_municipality$municipality==76001 |
                                             migrants_per_municipality$municipality==76109 | migrants_per_municipality$municipality==76111 | migrants_per_municipality$municipality==76130 |
                                             migrants_per_municipality$municipality==76147 | migrants_per_municipality$municipality==76364 | migrants_per_municipality$municipality==76520 |
                                             migrants_per_municipality$municipality==76834 | migrants_per_municipality$municipality==76892 | migrants_per_municipality$municipality==81001 |
                                             migrants_per_municipality$municipality==85001 | migrants_per_municipality$municipality==99773, 1, 0)
migrants_per_municipality <- subset(migrants_per_municipality ,delete!=1)
rm(migrants_per_municipality$delete)

