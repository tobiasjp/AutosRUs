library(dplyr)
MechaCar<- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar)
)
suspension_coil<- read.csv(file='Suspension_Coil.csv', check.names = F, stringsAsFactors = F)
total_summary<- suspension_coil %>% summarize(Mean=mean(suspension_coil$PSI), Median=median(suspension_coil$PSI), Variance=var(suspension_coil$PSI), SD=sd(suspension_coil$PSI))
lot_summary<- suspension_coil %>%group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

suspension_sample<- suspension_coil %>% sample_n(50)
t.test(suspension_sample$PSI, mu=mean(suspension_coil$PSI))

lot1_sub<- subset(suspension_coil, Manufacturing_Lot =='Lot1')
t.test(lot1_sub$PSI, mu=1500)
t.test(lot1_sub$PSI, mu=mean(suspension_coil$PSI))

lot2_sub<- subset(suspension_coil, Manufacturing_Lot =='Lot2')
t.test(lot2_sub$PSI, mu=1500)
t.test(lot2_sub$PSI, mu=mean(suspension_coil$PSI))

lot3_sub<- subset(suspension_coil, Manufacturing_Lot =='Lot3')
t.test(lot3_sub$PSI, mu=1500)
t.test(lot3_sub$PSI, mu=mean(suspension_coil$PSI))
