rm(list = ls())

packages <- c(
  "reshape2","reshape","plyr","dplyr","tidyr","tidyverse","mice","knitr",
  "lubridate","openair","zoo","car","foreign","stats","data.table",
  "tsModel","stringr","scales","readxl","writexl","santoku","compareGroups",
  "survival","survminer","lme4","lmerTest","glmnet","caret","rms",
  "xgboost","openxlsx","mediation","mmabig"
)
lapply(packages, require, character.only = TRUE)

## Modifiable Risk Factors and CHIP
## Example: BMI

model_risk_chip <- glm(
  chip2 ~ bmi + age + sex,
  family = "binomial",
  data   = data0
)

# The associations between modifiable risk factors and incident CHIP
# were estimated using logistic regression models.


## Modifiable Risk Factors and CLD
## Example: BMI

model_risk_cld <- coxph(
  Surv(cld_time, cld) ~ bmi + age + sex,
  data = data0
)

# The associations between modifiable risk factors and incident CLD were 
# estimated using age- and sex-adjusted Cox proportional hazards models.


## Interaction Analysis: Risk Factor × CHIP on CLD
## Example: BMI

## CHIP = FALSE as reference
model_int_chip0 <- coxph(
  Surv(cld_time, cld) ~ 
    bmi * relevel(chip2, ref = "FALSE") +
    age + sex,
  data = data0
)

## CHIP = TRUE  as reference
model_int_chip1 <- coxph(
  Surv(cld_time, cld) ~ 
    bmi * relevel(chip2, ref = "TRUE") +
    age + sex,
  data = data0
)

# Effect modification of the associations between modifiable risk factors 
# and CLD by CHIP status was assessed using Cox models including an 
# interaction term between each risk factor and CHIP. Stratified 
# hazard ratios were obtained by changing the reference level of CHIP.
