rm(list = ls())

packages <- c(
  "reshape2","reshape","plyr","dplyr","tidyr","tidyverse","mice","knitr",
  "lubridate","openair","zoo","car","foreign","stats","data.table",
  "tsModel","stringr","scales","readxl","writexl","santoku","compareGroups",
  "survival","survminer","lme4","lmerTest","glmnet","caret","rms",
  "xgboost","openxlsx","mediation","mmabig"
)
lapply(packages, require, character.only = TRUE)

## Example: A certain blood trait/metabolit/protein, suppose named "IL6"
model_chip2_IL6 <- glm(
  IL6 ~ chip2 + age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + fastt + proteinage + season,
  family = "gaussian",
  data   = data0
)

# The associations of any CHIP (and its subtypes) with each circulating 
# feature were obtained using multivariable linear regression models with 
# the same adjustment set as above, applied to each protein biomarker.


## Example: IL6 and CLD, MASLD, ALD outcomes
model_IL6_cld <- coxph(
  Surv(cld_time, cld) ~ IL6 + age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + fastt + proteinage + season,
  data = data0
)

model_IL6_masld <- coxph(
  Surv(masld_time, masld) ~ IL6 + age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + fastt + proteinage + season,
  data = data0
)

model_IL6_ald <- coxph(
  Surv(ald_time, ald) ~ IL6 + age + sex + ethnic + imd + bmi +
    nosmoking + drinkingM + sleeph + regular + dieth +
    htnp + dmp + fastt + proteinage + season,
  data = data0
)

# The associations of each circulating feature with incident CLD, MASLD, 
# and ALD were obtained by fitting the above Cox models separately for 
# each protein biomarker.