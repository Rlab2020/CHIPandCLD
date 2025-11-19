rm(list = ls())

packages <- c(
  "reshape2","reshape","plyr","dplyr","tidyr","tidyverse","mice","knitr",
  "lubridate","openair","zoo","car","foreign","stats","data.table",
  "tsModel","stringr","scales","readxl","writexl","santoku","compareGroups",
  "survival","survminer","lme4","lmerTest","glmnet","caret","rms",
  "xgboost","openxlsx","mediation","mmabig"
)
lapply(packages, require, character.only = TRUE)

set.seed(123)

## Interaction Analysis
## Example: A certain blood trait/metabolite/protein, suppose named "IL6"

## CHIP = FALSE as reference
model_int_chip0 <- coxph(
  Surv(cld_time, cld) ~ 
    IL6 * relevel(chip2, ref = "FALSE") +
    age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + fastt + proteinage + season,
  data = data0
)

## Model 2：CHIP = TRUE as reference
model_int_chip1 <- coxph(
  Surv(cld_time, cld) ~ 
    IL6 * relevel(chip2, ref = "TRUE") +
    age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + fastt + proteinage + season,
  data = data0
)

# The effect modification of the association between blood traits/metabolites/proteins 
# and incident CLD by CHIP status was assessed by including a 
# blood traits/metabolites/proteins × CHIP interaction term in multivariable Cox models. 
# Stratified hazard ratios for CHIP-negative and CHIP-positive 
# individuals were extracted by changing the reference level of CHIP.
