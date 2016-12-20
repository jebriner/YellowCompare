#161219 Jennifer Briner
#Discriminability modeling: a script for calculating the discriminability of different yellows (Eueides vs. Heliconius) 
#-------------------------------------------------

#Goal: for each visual system, get the percentage of pairwise pigment comparisons (Eueides vs. Heliconius yellow) that are greater than 1 JND

#Inputs: spreadsheet of reflectances for different yellow pigments (2 categories), visual system spreadsheets from Kyle's electrophysiology experiments.

  #Visual systems used
    #H. erato female: UV1, UV2, B, L
    #H. erato male: UV2, B, L
    #H. erato male hypothetical: UV1, B, L (models a hypothetical, ancestral male eye expressing only UV1 rather than the derived UV2)
    #H. melpomene (sexually monomorphic): UV1, B, L
    #H. ismenius (sexually monomorphic): UV1, B, L


#----------------------
#Preliminaries 
#----------------------

rm(list = ls())


#Read in data 

  setwd("/home/jbriner/Dropbox/School/UCI/Briscoe/Experiments/DiscriminabilityModeling/YellowCompare_HeliconiusEueides/InputFiles/Attempt2_Correct")
  
  #visual systems (processed data from SPEC [options selected: account for VK and irradiance])
    herato_f_Kyle.df <- read.delim("R_161219_Yellows_Herato_F_Kyle.csv", header=TRUE, sep = ",", row.names=1)
    herato_m_Kyle.df <- read.delim("R_161219_Yellows_Herato_M_Kyle.csv", header=TRUE, sep = ",", row.names=1)
    herato_h_Kyle.df <- read.delim("R_161219_Yellows_Herato_H_Kyle.csv", header=TRUE, sep = ",", row.names=1) #hypothetical H. erato male
    hmelpomene_f_Kyle.df <- read.delim("R_161219_Yellows_Hmelpomene_F_Kyle.csv", header=TRUE, sep = ",", row.names=1)
    hismenius_f_Kyle.df <- read.delim("R_161219_Yellows_Hismenius_F_Kyle.csv", header=TRUE, sep = ",", row.names=1)


          #manually set the visual system to test
            visualsystem.df <- herato_h_Kyle.df
            
          #manually set JND boundaries
            number_GreaterThan <- 1.0
  
  
            
#------------------------------    
#Yellows data
#------------------------------ 
  
#Choose which pigments to compare: 
  # A) the full pigment set (except HY+ and HY-) or 
  # B) only the Heliconius vs. the Eueides pigments ( / vice versa )           

#1. if A
  visualsystem_clean.df <- as.data.frame(visualsystem.df[1:25, 1:25])   #removes only HY+ and HY-
          
              
#1. if B: handle the yellows data (physical stimuli) to generate data frame of pertinent differences
    #Only keep interspecific pigment comparisons (exclude instances where HER is compared against HER and EUE against EUE). Also excludes last two rows and last two columns: HY+ and HY-
  
      visualsystem_clean.df <- as.data.frame(
        visualsystem.df[ (grepl("EEA|EIS|ESU|ETH", names(visualsystem.df))) , 
                               (grepl("HER", names(visualsystem.df))) ])  
      
                #The inverse creates a data frame with identical elements, so ignore: 
                
                    # visualsystem_2.df <- as.data.frame(
                     # visualsystem.df[ (grepl("HER", names(visualsystem.df))) , 
                                            # (grepl("EEA|EIS|ESU|ETH", names(visualsystem.df))) ]) 
       
    
#2. Find how many yellow values meet the JND cutoff
      
    #Make a new data frame which reads TRUE for cells where the JND is greater than (number_GreaterThan)
       yellow_compare.df = as.data.frame(visualsystem_clean.df > number_GreaterThan )
          
    #What percentage of these values meet the JND cutoff?   
      yellows_compare.percent <- (length(yellow_compare.df[yellow_compare.df==TRUE]) /    
       ( nrow(yellow_compare.df) * ncol(yellow_compare.df) ) 
       ) * 100
    
          yellows_compare.percent

      
      
#------------------------------    
#Output
#------------------------------ 

      
# A) the full pigment set (except HY+ and HY-)   
#---------------------------------------------
  # H. erato F: 40
  # H. erato M: 44.8
  # H. erato H: 40.64
  # H. melpomene F: 46.08     
  # H. ismenius F: 41.92
      
      
# B) only the Heliconius vs. the Eueides pigments ( / vice versa )   
#----------------------------------------------------------------
  # H. erato F: 72.72727
  # H. erato M: 85.71429
  # H. erato H: 70.77922
  # H. melpomene F: 87.01299     
  # H. ismenius F: 77.92208
  
      