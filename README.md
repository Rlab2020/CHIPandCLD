# CHIP&CLD
Code utilized in paper "Integrative Multi-Omics and Exposome Insights Into Clonal Hematopoiesis of Indeterminate Potential and Chronic Liver Disease"


### EXPOSURE
- `chip2`: Any CHIP with VAF ≥ 2% (binary: TRUE/FALSE)  
- `chip10`: Large CHIP with VAF ≥ 10%  
- `chip2_dnmt3a`, `chip10_dnmt3a`: DNMT3A-specific CHIP  
- `chip2_tet2`, `chip10_tet2`: TET2-specific CHIP  
- `chip2_asxl1`, `chip10_asxl1`: ASXL1-specific CHIP  

### DEMOGRAPHIC FACTORS
- `age`: continuous (years)  
- `sex`: categorical (male / female)  
- `ethnic`: categorical (white / asian / black / mixed)  
- `imd`: continuous index of multiple deprivation  
- `bmi`: continuous  

### HEALTHY LIFESTYLE FACTORS
- `nosmoking`: yes = never smokers / no = current or former smokers  
- `drinkingM`: yes = 0–16 g/day / no = >16 g/day  
- `sleeph`: yes = ≥4 healthy sleep components / no = <4  
- `regular`: yes = ≥150 min/week moderate or ≥75 min/week vigorous activity  
- `dieth`: yes = ≥4 healthy diet components / no = <4  

### OTHER CLINICAL / METABOLIC FACTORS
- `htnp`: hypertension (yes/no)  
- `dmp`: prevalent diabetes (yes/no)  
- `gluc`: glucose level  
- `chol`: cholesterol  
- `plt`: platelet count  
- `alt`, `ast`, `ggt`: liver enzymes  
- `statin`: statin use (yes/no)  
- `steroid`: steroid use (yes/no)

### TECHNICAL FACTORS
- `fastt`: fasting time (hours)  
- `sampleage`: time from blood draw to measurement (days)  
- `season`: sample collection season  
  - summer & autumn / winter & spring  

### OUTCOMES
#### Chronic Liver Disease (Primary)
- `cld`: incident chronic liver disease  
#### CLD Subtypes
- `masld`: metabolic dysfunction–associated steatotic liver disease  
- `ald`: alcohol-related liver disease  
