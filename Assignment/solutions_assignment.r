### 1a ########################################################################

  # To load Stata data
  library(foreign)
  
  # Read file (on N-drive, old EDSD course)
  file <- "N:/IMPRSD/EDSD 19-20/EDSD 140 Computer Programming/Data/soep_lebensz_en.dta"
  soep <- read.dta(file,convert.factors=F)
  
  
### 1b ########################################################################

  # Number of unique IDs
  length(unique(soep$id))
  

### 1c ########################################################################
  
  # Tabulate number of obs per year
  table(soep$year)
  # For example, there are 3198 obs for 2000
  
  
### 1d ########################################################################
  
  # Restrict data
  soep_2004 <- subset(soep,subset=year==2004)
  
  # Simple check whether it worked
  table(soep_2004$year)
  
  # Proportion of females
  tab <- table(soep_2004$sex)
  prop.table(tab)
  # About 54% are female  
  
  # Average satisfaction by sex
  by(soep_2004$health_org,soep_2004$sex,mean)
  # Females are slightly less satisfied 
  
  
### 2a ########################################################################
  
  # Swedish data (on N-drive, old EDSD course)
  filename <- "N:/IMPRSD/EDSD 19-20/EDSD 140 Computer Programming/Data/SWE_E0per.txt"
  e0swe <- read.table(file=filename,
                      header=T,skip=2)
  
  
### 2b ########################################################################
  
  # Basic plot for females
  plot(e0swe$Year,e0swe$Female,type="l",
       xlab="Year",ylab="e0",
       panel.first=grid(),col="red",
       main="Life expectancy in Sweden")
  # Adding males
  lines(e0swe$Year,e0swe$Male,col="blue")
  # Adding legend
  legend(x=1750,y=80,lty=1,
         col=c("red","blue"),
         legend=c("Females","Males"))
  
  
### 2c ########################################################################
  
  # Calculate gender gap
  gendergap <- e0swe$Female-e0swe$Male
  
  # Plot
  plot(e0swe$Year,gendergap,type="l",
       xlab="Year",ylab="Female e0-male e0",
       panel.first=grid(),col="red",
       main="Gender gap in life expectancy in Sweden",
       ylim=c(-1,7))
  abline(h=0)
  # I include the range from -1 to 7 for the y-axis in the plot
  # as this allows to include a reference line at zero.
  # For values below that line males are doing better and
  # values above the reference line mean that women are doing better.
  # This makes reading the figure a bit easier: You can immediately see
  # that women in Sweden have always been doing better
  
  
