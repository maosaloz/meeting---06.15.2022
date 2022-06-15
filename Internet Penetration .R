

                        ### Organizing Municipalities of Interest ###

# number of forced migrants per municipality 
Municipalities <- table(Municipality = all_migrants$past_municipality, State = all_migrants$past_state)
Municipalities <- as.data.frame.matrix(Municipalities) 
Municipalities$migrants <- Municipalities$`11`+Municipalities$`13`+Municipalities$`15`+Municipalities$`17`+
  Municipalities$`18`+Municipalities$`19`+Municipalities$`20`+Municipalities$`23`+Municipalities$`25`+
  Municipalities$`27`+Municipalities$`41`+Municipalities$`44`+Municipalities$`5`+
  Municipalities$`50`+Municipalities$`52`+Municipalities$`54`+Municipalities$`63`+Municipalities$`66`+
  Municipalities$`68`+Municipalities$`70`+Municipalities$`73`+Municipalities$`76`+Municipalities$`8`+
  Municipalities$`81`+Municipalities$`85`+Municipalities$`86`+Municipalities$`88`+Municipalities$`91`+Municipalities$`94`+
  Municipalities$`95`+Municipalities$`97`
Municipalities <- cbind(rownames(Municipalities), Municipalities)
rownames(Municipalities) <- NULL
names(Municipalities)[1] <- "municipality"
names(Municipalities)[35]<-"migrants"
migrants_per_municipality <- data.frame(Municipalities$municipality, Municipalities$migrants)
rm(Municipalities)
names(migrants_per_municipality)[1]<-"municipality"
names(migrants_per_municipality)[2]<-"migrants"

# Municipalities not of 5 and 6th strata (used to remove from "migrants_per_municiplity" dataframe)
CT01_Categorizacion_2022 <- read_excel("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/Municipality Classification/CT01 Categorizacion 2022.xlsx")
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
rm(rmunicipios, CT01_Categorizacion_2022)


#############################################################################################

              ### Number of Broadband Internet in each Municipality ###

# Importing Datasets

Internet_Access_2010 <- read_excel("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/Internet Penetration/Internet Access 2010.xlsx")
Internet_Access_2011 <- read_excel("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/Internet Penetration/Internet Access 2011.xlsx")
Internet_Access_2012 <- read_excel("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/Internet Penetration/Internet Access 2012.xlsx")
Internet_Access_2013 <- read_excel("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/Internet Penetration/Internet Access 2013.xlsx")
Internet_Access_2014 <- read_excel("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/Internet Penetration/Internet Access 2014.xlsx")
Internet_Access_2015 <- read_excel("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/Internet Penetration/Internet Access 2015.xlsx")
Internet_Access_2016 <- read_excel("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/Internet Penetration/Internet Access 2016.xlsx")
Internet_Access_2017 <- read_excel("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/Internet Penetration/Internet Access 2017.xlsx")
Internet_Access_2020 <- read_excel("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/Internet Penetration/Internet Access 2020.xlsx")

# Removing unwanted rows

year2010 <- Internet_Access_2010[-c(1,2,3,4), ]
year2011 <- Internet_Access_2011[-c(1,2,3,4), ]
year2012 <- Internet_Access_2012[-c(1,2,3,4), ]
year2013 <- Internet_Access_2013[-c(1,2,3,4), ]
year2014 <- Internet_Access_2014[-c(1,2,3,4), ]
year2015 <- Internet_Access_2015[-c(1,2,3,4), ]
year2016 <- Internet_Access_2016[-c(1,2,3,4), ]
year2017 <- Internet_Access_2017[-c(1,2,3,4), ]
Internet2020 <- Internet_Access_2020[-c(1, 2, 3,4), ]

# Creating headers 

# year 2010 
names(year2010) <- as.matrix(year2010[1, ])
year2010 <- year2010[-1, ]
year2010[] <- lapply(year2010, function(x) type.convert(as.character(x)))
year2010

# year 2011
names(year2011) <- as.matrix(year2011[1, ])
year2011 <- year2011[-1, ]
year2011[] <- lapply(year2011, function(x) type.convert(as.character(x)))
year2011

# year 2012
names(year2012) <- as.matrix(year2012[1, ])
year2012 <- year2012[-1, ]
year2012[] <- lapply(year2012, function(x) type.convert(as.character(x)))
year2012

# year 2013
names(year2013) <- as.matrix(year2013[1, ])
year2013 <- year2013[-1, ]
year2013[] <- lapply(year2013, function(x) type.convert(as.character(x)))
year2013

# year 2014
names(year2014) <- as.matrix(year2014[1, ])
year2014 <- year2014[-1, ]
year2014[] <- lapply(year2014, function(x) type.convert(as.character(x)))
year2014

# year 2015
names(year2015) <- as.matrix(year2015[1, ])
year2015 <- year2015[-1, ]
year2015[] <- lapply(year2015, function(x) type.convert(as.character(x)))
year2015

# year 2016
names(year2016) <- as.matrix(year2016[1, ])
year2016 <- year2016[-1, ]
year2016[] <- lapply(year2016, function(x) type.convert(as.character(x)))
year2016

# year 2017
names(year2017) <- as.matrix(year2017[1, ])
year2017 <- year2017[-1, ]
year2017[] <- lapply(year2017, function(x) type.convert(as.character(x)))
year2017

# year 2018 - 2021 
names(Internet2020)[1]<-paste("year")
names(Internet2020)[2]<-paste("trimester")
names(Internet2020)[3]<-paste("state")
names(Internet2020)[4]<-paste("municipality")
names(Internet2020)[5]<-paste("internet")
names(Internet2020)[6]<-paste("population")
names(Internet2020)[7]<-paste("penetration")

# Seperating years 2018, 2019 and 2020

Internet2020$one <- ifelse(Internet2020$year=="2018", 1, 0)
year2018<-subset(Internet2020, one!=0)
names(year2018)[5]<-paste("2018")

Internet2020$two <- ifelse(Internet2020$year=="2019", 1, 0)
year2019<-subset(Internet2020, two!=0)
names(year2019)[5]<-paste("2019")

Internet2020$three <- ifelse(Internet2020$year=="2020", 1, 0)
year2020<-subset(Internet2020, three!=0)
names(year2020)[5]<-paste("2020")

Internet2020$four <- ifelse(Internet2020$year=="2021", 1, 0)
year2021<-subset(Internet2020, four!=0)
names(year2021)[5]<-paste("2021")

# Seperating the trimesters 

year2018$T4 <- ifelse(year2018$trimester=="4", 1, 0)
year2018t4 <- subset(year2018, T4!=0)
names(year2018t4)[5]<-paste("4T-2018")

year2019$T4 <- ifelse(year2019$trimester=="4", 1, 0)
year2019t4 <- subset(year2019, T4!=0)
names(year2019t4)[5]<-paste("4T-2019")

year2020$T4 <- ifelse(year2020$trimester=="4", 1, 0)
year2020t4 <- subset(year2020, T4!=0)
names(year2020t4)[5]<-paste("4T-2020")

# Cleaning up data 

names(year2010)[3]<-paste("one")
names(year2010)[5]<-paste("two")
names(year2010)[7]<-paste("three")
names(year2010)[8]<-paste("four")
names(year2010)[9]<-paste("five")
names(year2010)[10]<-paste("six")
n2011 <- subset(year2010, select = -c(one, two, three, four, five, six))
rm(Internet_Access_2010, year2010)

names(year2011)[3]<-paste("one")
names(year2011)[5]<-paste("two")
names(year2011)[7]<-paste("three")
names(year2011)[8]<-paste("four")
names(year2011)[9]<-paste("five")
names(year2011)[10]<-paste("six")
n2012 <- subset(year2011, select = -c(one, two, three, four, five, six))
rm(Internet_Access_2011, year2011)

names(year2012)[3]<-paste("one")
names(year2012)[5]<-paste("two")
names(year2012)[7]<-paste("three")
names(year2012)[8]<-paste("four")
names(year2012)[9]<-paste("five")
names(year2012)[10]<-paste("six")
n2013 <- subset(year2012, select = -c(one, two, three, four, five, six))
rm(Internet_Access_2012, year2012)

names(year2013)[3]<-paste("one")
names(year2013)[5]<-paste("two")
names(year2013)[7]<-paste("three")
names(year2013)[8]<-paste("four")
names(year2013)[9]<-paste("five")
names(year2013)[10]<-paste("six")
n2014 <- subset(year2013, select = -c(one, two, three, four, five, six))
rm(Internet_Access_2013, year2013)

names(year2014)[3]<-paste("one")
names(year2014)[4]<-paste("two")
names(year2014)[6]<-paste("three")
names(year2014)[8]<-paste("four")
names(year2014)[9]<-paste("five")
names(year2014)[10]<-paste("six")
n2015 <- subset(year2014, select = -c(one, two, three, four, five, six))
rm(Internet_Access_2014, year2014)

names(year2015)[3]<-paste("one")
names(year2015)[5]<-paste("two")
names(year2015)[6]<-paste("three")
names(year2015)[8]<-paste("four")
names(year2015)[9]<-paste("five")
names(year2015)[10]<-paste("six")
names(year2015)[11]<-paste("seven")
names(year2015)[12]<-paste("eight")
n2016 <- subset(year2015, select = -c(one, two, three, four, five, six, seven, eight))
rm(Internet_Access_2015, year2015)

names(year2016)[3]<-paste("one")
names(year2016)[5]<-paste("two")
names(year2016)[6]<-paste("three")
names(year2016)[8]<-paste("four")
names(year2016)[9]<-paste("five")
names(year2016)[10]<-paste("six")
names(year2016)[11]<-paste("seven")
names(year2016)[12]<-paste("eight")
n2017 <- subset(year2016, select = -c(one, two, three, four, five, six, seven, eight))
rm(Internet_Access_2016, year2016)

names(year2017)[3]<-paste("one")
names(year2017)[5]<-paste("two")
names(year2017)[6]<-paste("three")
names(year2017)[8]<-paste("four")
names(year2017)[9]<-paste("five")
names(year2017)[10]<-paste("six")
names(year2017)[11]<-paste("seven")
names(year2017)[12]<-paste("eight")
n2018 <- subset(year2017, select = -c(one, two, three, four, five, six, seven, eight))
rm(Internet_Access_2017, year2017)

names(year2018t4)[1]<-paste("one")
names(year2018t4)[2]<-paste("two")
names(year2018t4)[7]<-paste("three")
names(year2018t4)[8]<-paste("four")
names(year2018t4)[9]<-paste("five")
n2019 <- subset(year2018t4, select = -c(one, two, three, four, five))
rm(year2018t4, year2018)

names(year2019t4)[1]<-paste("one")
names(year2019t4)[2]<-paste("two")
names(year2019t4)[7]<-paste("three")
names(year2019t4)[8]<-paste("four")
names(year2019t4)[9]<-paste("five")
names(year2019t4)[10]<-paste("six")
n2020 <- subset(year2019t4, select = -c(one, two, three, four, five, six))
rm(year2019t4, year2019)

names(year2020t4)[1]<-paste("one")
names(year2020t4)[2]<-paste("two")
names(year2020t4)[7]<-paste("three")
names(year2020t4)[8]<-paste("four")
names(year2020t4)[9]<-paste("five")
names(year2020t4)[10]<-paste("six")
names(year2020t4)[11]<-paste("seven")
n2021 <- subset(year2020t4, select = -c(one, two, three, four, five, six, seven))
rm(year2020t4, year2020)

names(year2021)[1]<-paste("one")
names(year2021)[2]<-paste("two")
names(year2021)[7]<-paste("three")
names(year2021)[8]<-paste("four")
names(year2021)[9]<-paste("five")
names(year2021)[10]<-paste("six")
names(year2021)[11]<-paste("seven")
n2022 <- subset(year2021, select = -c(one, two, three, four, five, six, seven))
rm(year2021, Internet2020, Internet_Access_2020)

# Merge data

data1 <- merge(n2011, n2012, by=c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)
data2 <- merge(data1, n2013, by=c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)
data3 <- merge(data2, n2014, by=c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)
data4 <- merge(data3, n2015, by=c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)
data5 <- merge(data4, n2016, by=c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)
data6 <- merge(data5, n2017, by=c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)
data7 <- merge(data6, n2018, by=c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)

names(n2019)[1]<-paste("DEPARTAMENTO")
names(n2019)[2]<-paste("MUNICIPIO")
names(n2019)[4]<-paste("POBLACIÓN 2018")
names(n2020)[1]<-paste("DEPARTAMENTO")
names(n2020)[2]<-paste("MUNICIPIO")
names(n2020)[4]<-paste("POBLACIÓN 2019")
names(n2021)[1]<-paste("DEPARTAMENTO")
names(n2021)[2]<-paste("MUNICIPIO")
names(n2021)[4]<-paste("POBLACIÓN 2020")
names(n2022)[1]<-paste("DEPARTAMENTO")
names(n2022)[2]<-paste("MUNICIPIO")
names(n2022)[4]<-paste("POBLACIÓN 2021")

data8 <- merge(data7, n2019, by=c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)
data9 <- merge(data8, n2020, by=c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)
data10 <- merge(data9, n2021, by=c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)
internet <- merge(data10, n2022, by=c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)

# removing old datasets 

rm(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, n2011, n2012, n2013, n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021, n2022)


####################################################################################


                            ### Organizing the dataset ###

# Change special characters to normal characters
internet$MUNICIPIO <- gsub('Í', 'I', internet$MUNICIPIO)
internet$DEPARTAMENTO <- gsub('Í', 'I', internet$DEPARTAMENTO)
internet$MUNICIPIO <- gsub('Ó', 'O', internet$MUNICIPIO)
internet$DEPARTAMENTO <- gsub('Ó', 'O',internet$DEPARTAMENTO)
internet$MUNICIPIO <- gsub('Á', 'A', internet$MUNICIPIO)
internet$DEPARTAMENTO <- gsub('Á', 'A',internet$DEPARTAMENTO)
internet$MUNICIPIO <- gsub('Ñ', 'N', internet$MUNICIPIO)
internet$DEPARTAMENTO <- gsub('Ñ', 'N',internet$DEPARTAMENTO)
internet$MUNICIPIO <- gsub('É', 'E', internet$MUNICIPIO)
internet$DEPARTAMENTO <- gsub('É', 'E', internet$DEPARTAMENTO)
internet$MUNICIPIO <- gsub('Ú', 'U', internet$MUNICIPIO)
internet$DEPARTAMENTO <- gsub('Ú', 'U', internet$DEPARTAMENTO)
internet$MUNICIPIO <- gsub('Ü', 'U', internet$MUNICIPIO)
internet$DEPARTAMENTO <- gsub('Ü', 'U', internet$DEPARTAMENTO)

internet$MUNICIPIO[which(internet$MUNICIPIO=="CALOTO (2)")]<-"CALOTO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="CALOTO(1)(3)")]<-"CALOTO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="CHIMA (1) (5)")]<-"CHIMA"
internet$MUNICIPIO[which(internet$MUNICIPIO=="GUACHENE (1)")]<-"GUACHENE"
internet$MUNICIPIO[which(internet$MUNICIPIO=="GUACHENE (2)")]<-"GUACHENE"
internet$MUNICIPIO[which(internet$MUNICIPIO=="MONTELIBANO(1)(3)")]<-"MONTELIBANO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="NOROSI (1)")]<-"NOROSI"
internet$MUNICIPIO[which(internet$MUNICIPIO=="RIO VIEJO (1)")]<-"RIO VIEJO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="RIO VIEJO (1)(3)")]<-"RIO VIEJO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="RIOSUCIO(2)")]<-"RIOSUCIO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SAN ANDRES SOTAVENTO (1) (3)")]<-"SAN ANDRES SOTAVENTO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SAN ANDRES SOTAVENTO (1) (5)")]<-"SAN ANDRES SOTAVENTO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SAN JOSE DE URE(1)")]<-"SAN JOSE DE URE"
internet$MUNICIPIO[which(internet$MUNICIPIO=="TUCHIN (1)")]<-"TUCHIN"
internet$MUNICIPIO[which(internet$MUNICIPIO=="TUCHIN (1) (5)")]<-"TUCHIN"
internet$MUNICIPIO[which(internet$MUNICIPIO=="CARTAGENA DE INDIAS")]<-"CARTAGENA"
internet$MUNICIPIO[which(internet$MUNICIPIO=="CERRO SAN ANTONIO")]<-"CERRO DE SAN ANTONIO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="CUASPUD CARLOSAMA")]<-"CUASPUD"
internet$MUNICIPIO[which(internet$MUNICIPIO=="DONMATIAS")]<-"DON MATIAS"
internet$MUNICIPIO[which(internet$MUNICIPIO=="GUICAN DE LA SIERRA")]<-"GUICAN"
internet$MUNICIPIO[which(internet$MUNICIPIO=="LOPEZ DE MICAY")]<-"LOPEZ"
internet$MUNICIPIO[which(internet$MUNICIPIO=="MANAURE BALCON DEL CESAR")]<-"MANAURE"
internet$MUNICIPIO[which(internet$MUNICIPIO=="PAPUNAHUA")]<-"PAPUNAUA"
internet$MUNICIPIO[which(internet$MUNICIPIO=="PIENDAMO - TUNIA")]<-"PIENDAMO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="PUERTO LEGUIZAMO")]<-"LEGUIZAMO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="PURISIMA DE LA CONCEPCION")]<-"PURISIMA"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SAN ANDRES DE SOTAVENTO")]<-"SAN ANDRES SOTAVENTO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SAN JUAN DE RIO SECO")]<-"SAN JUAN DE RIOSECO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SAN VICENTE FERRER")]<-"SAN VICENTE"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SOTARA PAISPAMBA")]<-"SOTARA"
internet$MUNICIPIO[which(internet$MUNICIPIO=="BARRANCOMINAS")]<-"BARRANCO MINAS"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SAN JOSE DE TOLUVIEJO")]<-"TOLU VIEJO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SAN SEBASTIAN DE MARIQUITA")]<-"MARIQUITA"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SANTAFE DE ANTIOQUIA")]<-"SANTA FE DE ANTIOQUIA"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SAN PEDRO DE LOS MILAGROS")]<-"SAN PEDRO"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SANTA CRUZ DE MOMPOX")]<-"MOMPOS"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SAN JOSE DE CUCUTA")]<-"CUCUTA"
internet$MUNICIPIO[which(internet$MUNICIPIO=="SAN LUIS DE CUBARRAL")]<-"CUBARRAL"

library(dplyr)

internet <- internet %>%
  group_by(MUNICIPIO, DEPARTAMENTO) %>%
  summarise_each(funs(first(na.omit(.))))

names(internet)[3]<-paste("2011")
names(internet)[4]<-paste("POBLACION 2011")
names(internet)[5]<-paste("2012")
names(internet)[6]<-paste("POBLACION 2012")
names(internet)[7]<-paste("2013")
names(internet)[8]<-paste("POBLACION 2013")
names(internet)[9]<-paste("2014")
names(internet)[10]<-paste("POBLACION 2014")
names(internet)[11]<-paste("2015")
names(internet)[12]<-paste("POBLACION 2015")
names(internet)[13]<-paste("2016")
names(internet)[14]<-paste("POBLACION 2016")
names(internet)[15]<-paste("2017")
names(internet)[16]<-paste("POBLACION 2017")
names(internet)[17]<-paste("2018")
names(internet)[18]<-paste("POBLACION 2018")
names(internet)[19]<-paste("2019")
names(internet)[20]<-paste("POBLACION 2019")
names(internet)[21]<-paste("2020")
names(internet)[22]<-paste("POBLACION 2020")
names(internet)[23]<-paste("2021")
names(internet)[24]<-paste("POBLACION 2021")
names(internet)[25]<-paste("2022")
names(internet)[26]<-paste("POBLACION 2022")


#########################################################################################################


                              ### Add postal code to data ###



DIVIPOLA._C_digos_municipios <- read.csv("~/Downloads/DIVIPOLA-_C_digos_municipios.csv")
names(DIVIPOLA._C_digos_municipios)[2]<-paste("postalcode")
names(DIVIPOLA._C_digos_municipios)[3]<-paste("DEPARTAMENTO")
names(DIVIPOLA._C_digos_municipios)[4]<-paste("MUNICIPIO")
postalcodes <- data.frame(DIVIPOLA._C_digos_municipios$DEPARTAMENTO, DIVIPOLA._C_digos_municipios$MUNICIPIO, 
                          DIVIPOLA._C_digos_municipios$postalcode)
names(postalcodes)[1]<-paste("DEPARTAMENTO")
names(postalcodes)[2]<-paste("MUNICIPIO")
names(postalcodes)[3]<-paste("postalcode")
rm(DIVIPOLA._C_digos_municipios)

postalcodes$MUNICIPIO <- gsub('Í', 'I', postalcodes$MUNICIPIO)
postalcodes$DEPARTAMENTO <- gsub('Í', 'I', postalcodes$DEPARTAMENTO)
postalcodes$MUNICIPIO <- gsub('Ó', 'O', postalcodes$MUNICIPIO)
postalcodes$DEPARTAMENTO <- gsub('Ó', 'O',postalcodes$DEPARTAMENTO)
postalcodes$MUNICIPIO <- gsub('Á', 'A', postalcodes$MUNICIPIO)
postalcodes$DEPARTAMENTO <- gsub('Á', 'A',postalcodes$DEPARTAMENTO)
postalcodes$MUNICIPIO <- gsub('Ñ', 'N', postalcodes$MUNICIPIO)
postalcodes$DEPARTAMENTO <- gsub('Ñ', 'N',postalcodes$DEPARTAMENTO)
postalcodes$MUNICIPIO <- gsub('É', 'E', postalcodes$MUNICIPIO)
postalcodes$DEPARTAMENTO <- gsub('É', 'E', postalcodes$DEPARTAMENTO)
postalcodes$MUNICIPIO <- gsub('Ú', 'U', postalcodes$MUNICIPIO)
postalcodes$DEPARTAMENTO <- gsub('Ú', 'U', postalcodes$DEPARTAMENTO)
postalcodes$MUNICIPIO <- gsub('Ü', 'U', postalcodes$MUNICIPIO)
postalcodes$DEPARTAMENTO <- gsub('Ü', 'U', postalcodes$DEPARTAMENTO)

df <- merge(internet, postalcodes, by = c("DEPARTAMENTO", "MUNICIPIO"), all = TRUE)
rm(internet, postalcodes)

df <- df[-c(1, 2, 3, 4, 5), ]

df$MUNICIPIO[which(df$MUNICIPIO=="DONMATIAS")]<-"DON MATIAS"
df$MUNICIPIO[which(df$MUNICIPIO=="SAN PEDRO DE LOS MILAGROS")]<-"SAN PEDRO"
df$MUNICIPIO[which(df$MUNICIPIO=="SAN VICENTE FERRER")]<-"SAN VICENTE"
df$DEPARTAMENTO[which(df$DEPARTAMENTO=="ARCHIPIELAGO DE SAN ANDRES. PROVIDENCIA Y SANTA CATALINA")]<-"SAN ANDRES"
df$DEPARTAMENTO[which(df$DEPARTAMENTO=="ARCHIPIELAGO DE SAN ANDRES, PROVIDENCIA Y SANTA CATALINA")]<-"SAN ANDRES"
df$DEPARTAMENTO[which(df$DEPARTAMENTO=="ARCHIPIELAGO DE SAN ANDRES")]<-"SAN ANDRES"
df$MUNICIPIO[which(df$MUNICIPIO=="CARTAGENA DE INDIAS")]<-"CARTAGENA"
df$MUNICIPIO[which(df$MUNICIPIO=="SANTA CRUZ DE MOMPOX")]<-"MOMPOS"
df$MUNICIPIO[which(df$MUNICIPIO=="GUICAN DE LA SIERRA")]<-"GUICAN"
df$MUNICIPIO[which(df$MUNICIPIO=="LOPEZ DE MICAY")]<-"LOPEZ"
df$MUNICIPIO[which(df$MUNICIPIO=="PIENDAMO - TUNIA")]<-"PIENDAMO"
df$MUNICIPIO[which(df$MUNICIPIO=="SOTARA PAISPAMBA")]<-"SOTARA"
df$MUNICIPIO[which(df$MUNICIPIO=="MANAURE BALCON DEL CESAR")]<-"MANAURE"
df$MUNICIPIO[which(df$MUNICIPIO=="PURISIMA DE LA CONCEPCION")]<-"PURISIMA"
df$MUNICIPIO[which(df$MUNICIPIO=="SAN ANDRES DE SOTAVENTO")]<-"SAN ANDRES SOTAVENTO"
df$MUNICIPIO[which(df$MUNICIPIO=="BARRANCOMINAS")]<-"BARRANCO MINAS"
df$MUNICIPIO[which(df$MUNICIPIO=="CUASPUD CARLOSAMA")]<-"CUASPUD"
df$MUNICIPIO[which(df$MUNICIPIO=="SAN JOSE DE CUCUTA")]<-"CUCUTA"
df$MUNICIPIO[which(df$MUNICIPIO=="PUERTO LEGUIZAMO")]<-"LEGUIZAMO"
df$MUNICIPIO[which(df$MUNICIPIO=="SAN JOSE DE TOLUVIEJO")]<-"TOLU VIEJO"
df$MUNICIPIO[which(df$MUNICIPIO=="SAN SEBASTIAN DE MARIQUITA")]<-"MARIQUITA"
df$MUNICIPIO[which(df$MUNICIPIO=="PAPUNAHUA")]<-"PAPUNAUA"

postalcodes <- df %>%
  group_by(MUNICIPIO, DEPARTAMENTO) %>%
  summarise_each(funs(first(na.omit(.))))
rm(df)

postalcodes$delete <- ifelse(postalcodes$MUNICIPIO=="TOTAL"| postalcodes$MUNICIPIO=="TOTA"| postalcodes$DEPARTAMENTO=="TOTAL" |
                               postalcodes$DEPARTAMENTO=="TOTAL NACIONAL", 1, 0)
postalcodes <- subset(postalcodes, delete!=1)
internet <- postalcodes[!is.na(postalcodes$postalcode),]
rm(postalcodes)

#################################################################################################################


                                    ### Clean up data ###

# clean up
CT01_Categorizacion_2022 <- read_excel("~/Documents/Education/Ecole Polytechnique/Year 1 /Third Trimester (Internship) /Data/Municipality Classification/CT01 Categorizacion 2022.xlsx")
municipios_de_interes <- CT01_Categorizacion_2022
municipios_de_interes$POBLACION <- as.numeric(municipios_de_interes$`Población DANE`)
municipios_de_interes$remove <- ifelse(municipios_de_interes$POBLACION<=20000, 1, 0)
data1 <- subset(municipios_de_interes, remove==1)
data1 <- data.frame(data1$`Código CGN`, data1$Departamento, 
                    data1$Municipio, data1$Categoría)
rm(municipios_de_interes)
names(data1)[1]<-paste("CODIGO POSTAL")
names(data1)[2]<-paste("DEPARTAMENTO")
names(data1)[3]<-paste("MUNICIPIO")
names(data1)[4]<-paste("CATEGORIA")
data1$`CODIGO POSTAL` <- sub('....', '', data1$`CODIGO POSTAL`)
data1$DEPARTAMENTO <- sub('................', '', data1$DEPARTAMENTO)
rm(CT01_Categorizacion_2022)
names(internet)[27] <- paste("CODIGO POSTAL")

# removing special characters
data1$MUNICIPIO <- gsub('Í', 'I', data1$MUNICIPIO)
data1$DEPARTAMENTO <- gsub('Í', 'I', data1$DEPARTAMENTO)
data1$MUNICIPIO <- gsub('Ó', 'O', data1$MUNICIPIO)
data1$DEPARTAMENTO <- gsub('Ó', 'O',data1$DEPARTAMENTO)
data1$MUNICIPIO <- gsub('Á', 'A', data1$MUNICIPIO)
data1$DEPARTAMENTO <- gsub('Á', 'A',data1$DEPARTAMENTO)
data1$MUNICIPIO <- gsub('Ñ', 'N', data1$MUNICIPIO)
data1$DEPARTAMENTO <- gsub('Ñ', 'N',data1$DEPARTAMENTO)
data1$MUNICIPIO <- gsub('É', 'E', data1$MUNICIPIO)
data1$DEPARTAMENTO <- gsub('É', 'E',data1$DEPARTAMENTO)
data1$MUNICIPIO <- gsub('Ú', 'U', data1$MUNICIPIO)
data1$DEPARTAMENTO <- gsub('Ú', 'U', data1$DEPARTAMENTO)
data1$MUNICIPIO <- gsub('Ü', 'U', data1$MUNICIPIO)
data1$DEPARTAMENTO <- gsub('Ü', 'U', data1$DEPARTAMENTO)

info_municipio <- merge(internet, data1, by=c("CODIGO POSTAL", "MUNICIPIO", "DEPARTAMENTO"), all = TRUE)
rm(internet, data1)

info_municipio <- info_municipio %>%
  group_by(MUNICIPIO, DEPARTAMENTO) %>%
  summarise_each(funs(first(na.omit(.))))

# changing names of municipalities
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="ALTO BAUDO (PIE DE PATO)")]<-"ALTO BAUDO"
info_municipio$DEPARTAMENTO[which(info_municipio$DEPARTAMENTO=="LA GUAJIRA")]<-"GUAJIRA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="ANSERMA DE LOS CABALLEROS")]<-"ASERMA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="APULO (RAFAEL REYES)")]<-"APULO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="ARBOLEDA (BERRUECOS)")]<-"ARBOLEDA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="ARIGUANI (EL DIFICIL)")]<-"ARIGUANI"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="ARMERO (GUAYABAL)")]<-"ARMERO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="BAHIA SOLANO (MUTIS)")]<-"BAHIA SOLANO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="BAJO BAUDO (PIZARRO)")]<-"BAJO BAUDO"
info_municipio$DEPARTAMENTO[which(info_municipio$DEPARTAMENTO==" META")]<-"META"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="BELEN DE LOS ANDAQUIES")]<-"BELEN ANDAQUIES"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="BOJAYA (BELLAVISTA)")]<-"BOJAYA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="CALIMA DEL DARIEN")]<-"CALIMA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="EL CANTON DEL SAN PABLO")]<-"CANTON DEL SAN PABLO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="CARMEN DE APICALA")]<-"CARMEN APICALA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="CAROLINA DEL PRINCIPE")]<-"CAROLINA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="CERRO DE SAN ANTONIO")]<-"CERRO SAN ANTONIO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="COLON(GENOVA)")]<-"COLON"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="CUASPUD (CARLOSAMA)")]<-"CUASPUD"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="EL CARMEN DE ATRATO")]<-"EL CARMEN"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="EL CARMEN DE CHUCURI")]<-"EL CARMEN"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="EL TABLON DE GOMEZ")]<-"EL TABLON"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="LA JAGUA DE IBIRICO")]<-"LA JAGUA IBIRICO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="EL LITORAL DEL SAN JUAN")]<-"LITORAL DEL SAN JUAN"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="LOPEZ DE MICAY")]<-"LOPEZ"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="MAGUI (PAYAN)")]<-"MAGUI"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="MANAURE BALCON DEL CESAR")]<-"MANAURE"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="MEDIO BAUDO (BOCA DE PEPE)")]<-"MEDIO BAUDO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="PATIA (EL BORDO)")]<-"PATIA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="PAZ DE RIO")]<-"PAZ DEL RIO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="POLO NUEVO")]<-"POLONUEVO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="PUERTO INIRIDA")]<-"INIRIDA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="PUERTO LEGUIZAMO")]<-"LEGUIZAMO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="PUERTO NARE (LA MAGDALENA)")]<-"PUERTO NARE"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="PURACE (COCONUCO)")]<-"PURACE"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="SAN ANDRES DE CUERQUIA")]<-"SAN ANDRES"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="SAN ANTONIO DE PALMITO")]<-"PALMITO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="SAN BERNARDO DEL VIENTO")]<-"SAN BERNARDO VIENTO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="SAN JOSE DE FRAGUA")]<-"SAN JOSE DEL FRAGUA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="SANTA BARBARA (ISCUANDE)")]<-"SANTA BARBARA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="SANTA CRUZ DE MOMPOX")]<-"MOMPOS"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="SAN LUIS DE SINCE")]<-"SINCE"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="SOLITA1")]<-"SOLITA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="SOTARA (PAISPAMBA)")]<-"SOTARA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="TOLUVIEJO")]<-"TOLU VIEJO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="SANTIAGO DE TOLU")]<-"TOLU"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="TUTASA")]<-"TUTAZA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="VILLA DE SAN DIEGO DE UBATE")]<-"UBATE"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="VALLE DE SAN JOSE")]<-"VALLE SAN JOSE"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="VENECIA (OSPINA PEREZ)")]<-"VENECIA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="VILLA DE LEIVA")]<-"VILLA DE LEYVA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="YONDO (CASABE)")]<-"YONDO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="VILLACARO")]<-"VILLA CARO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="CANTON DE SAN PABLO")]<-"CANTON DEL SAN PABLO"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="LA URIBE")]<-"URIBE"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="ROBLES (LA PAZ)")]<-"LA PAZ"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="SAN CARLOS DE GUAROA")]<-"SAN CARLOS GUAROA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="VISTAHERMOSA")]<-"VISTA HERMOSA"
info_municipio$MUNICIPIO[which(info_municipio$MUNICIPIO=="ASERMA")]<-"ANSERMA"

# grouping rows by municipality and state
info_municipio <- info_municipio %>%
  group_by(MUNICIPIO, DEPARTAMENTO) %>%
  summarise_each(funs(first(na.omit(.))))

# merge info_municipio and migrants per municipality 
names(migrants_per_municipality)[1]<-paste("CODIGO POSTAL")
internet_migrant_info <- merge(info_municipio, migrants_per_municipality, by=c("CODIGO POSTAL"), all = TRUE)
rm(data, data1)

# changing postal code to match both of them 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05004")]<-5004
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05021")]<-5021 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05036")]<-5036 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05038")]<-5038 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05040")]<-5040 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05044")]<-5044 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05055")]<-5055 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05059")]<-5059 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05086")]<-5086 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05091")]<-5091 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05093")]<-5093 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05107")]<-5107 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05113")]<-5113 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05125")]<-5125 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05134")]<-5134 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05138")]<-5138 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05142")]<-5142 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05145")]<-5145 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05190")]<-5190 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05197")]<-5197 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05206")]<-5206 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05237")]<-5237 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05240")]<-5240 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05264")]<-5264 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05306")]<-5306 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05310")]<-5310 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05313")]<-5313 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05315")]<-5315 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05321")]<-5321 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05347")]<-5347 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05353")]<-5353 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05364")]<-5364 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05368")]<-5368 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05390")]<-5390 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05411")]<-5411 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05425")]<-5425 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05467")]<-5467 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05475")]<-5475 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05480")]<-5480 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05483")]<-5483 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05501")]<-5501 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05543")]<-5543 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05576")]<-5576 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05591")]<-5591 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05628")]<-5628 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05642")]<-5642 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05647")]<-5647 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05649")]<-5649 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05652")]<-5652 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05656")]<-5656 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05658")]<-5658 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05660")]<-5660 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05667")]<-5667 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05690")]<-5690 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05761")]<-5761 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05789")]<-5789 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05792")]<-5792 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05809")]<-5809 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05819")]<-5819 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05842")]<-5842 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05854")]<-5854 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05856")]<-5856 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05858")]<-5858 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05861")]<-5861 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05873")]<-5873 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "05885")]<-5885 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "08141")]<-8141 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "08549")]<-8549 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "08558")]<-8558 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "08675")]<-8675 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "08770")]<-8770 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "08832")]<-8832 
internet_migrant_info$`CODIGO POSTAL`[which(internet_migrant_info$`CODIGO POSTAL`== "08849")]<-8849 

# unifying rows that have the same postal code 
internet_migrant_info <- internet_migrant_info %>%
  group_by(`CODIGO POSTAL`) %>%
  summarise_each(funs(first(na.omit(.))))

# looking at our municipalities of interest 
data <- internet_migrant_info[!is.na(internet_migrant_info$migrants),]
data <- data.frame(data$DEPARTAMENTO, data$MUNICIPIO, data$`CODIGO POSTAL`, data$CATEGORIA , data$`2011`, data$`POBLACION 2011`, 
                   data$`2012`, data$`POBLACION 2012`, data$`2013`, data$`POBLACION 2013`, data$`2014`, data$`POBLACION 2014`, 
                   data$`2015`, data$`POBLACION 2015`, data$`2016`, data$`POBLACION 2016`, data$`2017`, data$`POBLACION 2017`, 
                   data$`2018`, data$`POBLACION 2018`, data$`2019`, data$`POBLACION 2019`, data$`2020`, data$`POBLACION 2020`, 
                   data$`2021`, data$`POBLACION 2021`, data$`2022`, data$`POBLACION 2022`, data$migrants)

# renaming columns 
names(data)[1]<- paste("DEPARTAMENTO")
names(data)[2]<- paste("MUNICIPIO")
names(data)[3]<- paste("CODIGO POSTAL")
names(data)[4]<- paste("CATEGORIA")
names(data)[5]<- paste("2011")
names(data)[6]<- paste("POBLACION 2011")
names(data)[7]<- paste("2012")
names(data)[8]<- paste("POBLACION 2012")
names(data)[9]<- paste("2013")
names(data)[10]<- paste("POBLACION 2013")
names(data)[11]<- paste("2014")
names(data)[12]<- paste("POBLACION 2014")
names(data)[13]<- paste("2015")
names(data)[14]<- paste("POBLACION 2015")
names(data)[15]<- paste("2016")
names(data)[16]<- paste("POBLACION 2016")
names(data)[17]<- paste("2017")
names(data)[18]<- paste("POBLACION 2017")
names(data)[19]<- paste("2018")
names(data)[20]<- paste("POBLACION 2018")
names(data)[21]<- paste("2019")
names(data)[22]<- paste("POBLACION 2019")
names(data)[23]<- paste("2020")
names(data)[24]<- paste("POBLACION 2020")
names(data)[25]<- paste("2021")
names(data)[26]<- paste("POBLACION 2021")
names(data)[27]<- paste("2022")
names(data)[28]<- paste("POBLACION 2022")
names(data)[29]<- paste("MIGRANTS")
internet_penetration <- data
rm(info_municipio, migrants_per_municipality, internet_migrant_info, data)
internet_penetration <- internet_penetration[!is.na(internet_penetration$CATEGORIA),]

##########################################################################################################

                            ### Visualization ###

# Changing class of variable
internet_penetration$`2019` <- as.numeric(internet_penetration$`2019`)
internet_penetration$`POBLACION 2019`<- as.numeric(internet_penetration$`POBLACION 2019`)
internet_penetration$`2020` <- as.numeric(internet_penetration$`2020`)
internet_penetration$`POBLACION 2020` <- as.numeric(internet_penetration$`POBLACION 2020`)
internet_penetration$`2021` <- as.numeric(internet_penetration$`2021`)
internet_penetration$`POBLACION 2021` <- as.numeric(internet_penetration$`POBLACION 2021`)
internet_penetration$`2022` <- as.numeric(internet_penetration$`2022`)
internet_penetration$`POBLACION 2022` <- as.numeric(internet_penetration$`POBLACION 2022`)

# Creating a variable that looks at internet penetration in proportion to population 
internet_penetration$`PROPORCION 2011` <- internet_penetration$`2011`/internet_penetration$`POBLACION 2011`
internet_penetration$`PROPORCION 2012` <- internet_penetration$`2012`/internet_penetration$`POBLACION 2012`
internet_penetration$`PROPORCION 2013` <- internet_penetration$`2013`/internet_penetration$`POBLACION 2013`
internet_penetration$`PROPORCION 2014` <- internet_penetration$`2014`/internet_penetration$`POBLACION 2014`
internet_penetration$`PROPORCION 2015` <- internet_penetration$`2015`/internet_penetration$`POBLACION 2015`
internet_penetration$`PROPORCION 2016` <- internet_penetration$`2016`/internet_penetration$`POBLACION 2016`
internet_penetration$`PROPORCION 2017` <- internet_penetration$`2017`/internet_penetration$`POBLACION 2017`
internet_penetration$`PROPORCION 2018` <- internet_penetration$`2018`/internet_penetration$`POBLACION 2018`
internet_penetration$`PROPORCION 2019` <- internet_penetration$`2019`/internet_penetration$`POBLACION 2019`
internet_penetration$`PROPORCION 2020` <- internet_penetration$`2020`/internet_penetration$`POBLACION 2020`
internet_penetration$`PROPORCION 2021` <- internet_penetration$`2021`/internet_penetration$`POBLACION 2021`
internet_penetration$`PROPORCION 2022` <- internet_penetration$`2022`/internet_penetration$`POBLACION 2022`

# Identify change in internet penetration


  

