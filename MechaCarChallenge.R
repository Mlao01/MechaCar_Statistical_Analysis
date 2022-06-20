#-------------------- Deliverable 1: Linear Regression to Predict MPG --------------------

#Load library packages
library(dplyr)

#Import MechaCar_mpg and create dataframe
mechacar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#Perform linear regression
linear_model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mechacar_mpg)

#Summary stats
summary(linear_model)


#-------------------- Deliverable 2: Summary Statistics on Suspension Coils --------------------

#Import Suspension_Coil.csv and create dataframe
suspension_data <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#Total summary of suspension_data
total_summary <- suspension_data %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')


#Summary data grouped by lot
lot_summary <- suspension_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')


#-------------------- Deliverable 3: T-Tests on Suspension Coils --------------------

#T-Test for all lots
t.test(suspension_data$PSI, mu=1500)

#T-tests for each lot
#Lot 1
t.test((subset(suspension_data, Manufacturing_Lot=='Lot1'))$PSI, mu=1500)

#Lot 2
t.test((subset(suspension_data, Manufacturing_Lot=='Lot2'))$PSI, mu=1500)

#Lot 3
t.test((subset(suspension_data, Manufacturing_Lot=='Lot3'))$PSI, mu=1500)