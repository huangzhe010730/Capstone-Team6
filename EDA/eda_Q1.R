#### Packages ####
library(ggplot2)
library(dplyr)

raw <- read.csv("~/Downloads/hipm_2023.csv")


#### Data cleaning ####
any(is.na(raw))
na_index <- which(any(is.na(raw)))
raw[, na_index] # Looks like py_res (14th column) has a bunch of NAs

# For now we can omit py_res, since it's not involved in our key questions
df <- raw[, -14]
any(is.na(df)) # More NAs

# Turn indicator variables into factors
df$hitype <- factor(df$hitype, levels = -1:15)  # Insurance type
df$expansion <- factor(df$expansion, levels = c(0,1)) # Binary status indicators
df$subsidy <- factor(df$subsidy, levels = c(0,1))
df$hipm_poor <- factor(df$hipm_poor, levels = c(0,1))

# Summary stats
summary(df)



#### EDA visualizations ####

# Mosaic plots
plot(prop.table(table(df$hipm_poor, df$subsidy)), main = 'HIPM Poverty Status vs. Subsidy Status')
plot(prop.table(table(df$hipm_poor, df$expansion)), main = 'HIPM Poverty Status vs.\n Medicaid Expansion Status')


# Histograms
ggplot(df, aes(x = unit_need)) +
  geom_histogram(binwidth = 3000, color = "black", fill = "lightblue") +
  labs(title = "HI Unit Health Need Distribution", x = "HI Unit Health Need", y = "Count")

hist(df$unit_benefits, main = 'HI Unit Benefits Distribution', xlab = 'HI Unit Benefits') 

ggplot(df, aes(x = unit_benefits)) +
  geom_histogram(binwidth = 10000, color = "black", fill = "lightblue") + 
  labs(title = "HI Unit Benefits Distribution", x = "HI Unit Benefits", y = "Count") 
# ^ Fix x-axis intervals?
# Also not quite sure what "HI Unit Health Need" and "HI Unit Benefits" mean, may want to ask Emily

ggplot(df, aes(x = hi_resources)) +
  geom_histogram(binwidth = 3000, color = "black", fill = "lightblue") +
  labs(title = "Individual HI Resources Distribution", x = "Individual HI Resources", y = "Count")



# Scatterplots
ggplot(df, aes(x = unit_need, y = unit_benefits)) +
  geom_point(color = "black", alpha = 0.4) + 
  labs(title = "HI Unit Need vs. HI Unit Benefits", x = "HI Unit Need", y = "HI Unit Benefits")

ggplot(df, aes(x = unit_need, y = moop_cap)) +
  geom_point(color = "black", alpha = 0.4) +
  labs(title = "HI Unit Need vs. MOOP Cap", x = "HI Unit Need", y = "MOOP Cap")



# Boxplots
ggplot(df, aes(x = hipm_poor, y = unit_need)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(title = "HI Unit Health Need by HIPM Poverty Status", x = "HIPM Poverty Status", y = "HI Unit Health Need")

ggplot(df, aes(x = hipm_poor, y = unit_benefits)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(title = "HI Unit Benefits by HIPM Poverty Status", x = "HIPM Poverty Status", y = "HI Unit Benefits")

ggplot(df, aes(x = expansion, y = unit_need)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(title = "HI Unit Health Need by Medicaid Expansion Status", x = "Medicaid Expansion Status", y = "HI Unit Health Need")

ggplot(df, aes(x = expansion, y = unit_benefits)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(title = "HI Unit Benefits by Medicaid Expansion Status", x = "Medicaid Expansion Status", y = "HI Unit Benefits")


# Bar charts
ggplot(df) + 
  geom_bar(mapping = aes(x = hitype), 
           color = 'black', fill = 'lightblue') +
  labs(title = 'Individuals with Each HI Type', x = 'HI Type', y = 'Count') 
# Most of the individals have type 6: Employer Sponsored Insurance (ESI)

ggplot(df[which(df$hipm_poor == 1), ]) + 
  geom_bar(mapping = aes(x = hitype), 
           color = 'black', fill = 'lightblue') +
  labs(title = "HIPM Poor Individuals by HI Type", x = "HI Type", y = "Count") 
# Individuals with type 6 and type 14 (Uninsured) make up the majority of HIPM poor individuals


