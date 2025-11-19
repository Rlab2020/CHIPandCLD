rm(list = ls())

packages <- c(
  "reshape2","reshape","plyr","dplyr","tidyr","tidyverse","mice","knitr",
  "lubridate","openair","zoo","car","foreign","stats","data.table",
  "tsModel","stringr","scales","readxl","writexl","santoku","compareGroups",
  "survival","survminer","lme4","lmerTest","glmnet","caret","rms",
  "xgboost","openxlsx","mediation","mmabig"
)
lapply(packages, require, character.only = TRUE)

model1_cld_chip2 <- coxph(
  Surv(cld_time, cld) ~ chip2 + age + sex,
  data = data0
)
model2_cld_chip2 <- coxph(
  Surv(cld_time, cld) ~ chip2 + age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + ast + alt + ggt + gluc + chol + plt,
  data = data0
)

model1_masld_chip2 <- coxph(
  Surv(masld_time, masld) ~ chip2 + age + sex,
  data = data0
)
model2_masld_chip2 <- coxph(
  Surv(masld_time, masld) ~ chip2 + age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + ast + alt + ggt + gluc + chol + plt,
  data = data0
)

model1_ald_chip2 <- coxph(
  Surv(ald_time, ald) ~ chip2 + age + sex,
  data = data0
)
model2_ald_chip2 <- coxph(
  Surv(ald_time, ald) ~ chip2 + age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + ast + alt + ggt + gluc + chol + plt,
  data = data0
)

## Large CHIP（VAF ≥ 10%）

model1_cld_chip10 <- coxph(
  Surv(cld_time, cld) ~ chip10 + age + sex,
  data = data0
)
model2_cld_chip10 <- coxph(
  Surv(cld_time, cld) ~ chip10 + age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + ast + alt + ggt + gluc + chol + plt,
  data = data0
)

model1_masld_chip10 <- coxph(
  Surv(masld_time, masld) ~ chip10 + age + sex,
  data = data0
)
model2_masld_chip10 <- coxph(
  Surv(masld_time, masld) ~ chip10 + age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + ast + alt + ggt + gluc + chol + plt,
  data = data0
)

model1_ald_chip10 <- coxph(
  Surv(ald_time, ald) ~ chip10 + age + sex,
  data = data0
)
model2_ald_chip10 <- coxph(
  Surv(ald_time, ald) ~ chip10 + age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + ast + alt + ggt + gluc + chol + plt,
  data = data0
)

## (analysis for DNMT3A/TET2/ASXL1 CHIP is exactly the same as above, 
## Just replace chip2 / chip10 with chip2_dnmt3a, chip10_dnmt3a, etc.)

# The associations of CHIP (overall, large clone, and gene-specific) 
# with incident CLD, MASLD and ALD were obtained 
# by running the above Cox models.