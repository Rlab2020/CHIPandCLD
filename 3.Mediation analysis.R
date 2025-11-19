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

## Mediation Analysis for single mediator
## Example: A certain blood trait/metabolite/protein, suppose named "IL6"

med_IL6 <- mediate(
  model.m = modelM_IL6,
  model.y = modelD_IL6,
  treat   = "chip2",
  mediator= "IL6"
)

summary(med_IL6)

# The natural direct effect, natural indirect effect, and proportion 
# mediated for each blood trait/metabolite/protein were obtained by repeating the above mediation 
# procedure for each candidate mediator.

### Multiple Mediator Analysis

med_multi <- mmabig::mma.big(
  x        = x_data,
  y        = y_surv,
  pred     = pred_data,
  mediator = m_vars,
  type     = "risk"
)

# The joint and individual mediation effects of multiple 
# mediators in the association between CHIP and CLD were obtained 
# using the mma.big function, with CHIP as the exposure, incident CLD 
# as the outcome, and the selected blood traits/metabolites/proteins as mediators.
