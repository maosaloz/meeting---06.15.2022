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
rm(model1, model2, model3, model4, model5, model6)




