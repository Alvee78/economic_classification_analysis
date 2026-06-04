set.seed(123)

# ==================================================
# COUNTRY NAMES
# ==================================================

developed_countries <- c(
  "United States","Canada","United Kingdom","Germany","France",
  "Italy","Spain","Netherlands","Belgium","Switzerland",
  "Austria","Sweden","Norway","Denmark","Finland",
  "Ireland","Iceland","Luxembourg","Portugal","Australia",
  "New Zealand","Japan","South Korea","Singapore","Israel",
  "Czech Republic","Slovakia","Slovenia","Estonia","Latvia",
  "Lithuania","Poland","Hungary","Greece","Croatia",
  "Malta","Cyprus","United Arab Emirates","Qatar","Kuwait"
)

developing_countries <- c(
  "India","China","Brazil","Mexico","Argentina",
  "Chile","Colombia","Peru","Thailand","Malaysia",
  "Indonesia","Vietnam","Philippines","Bangladesh","Pakistan",
  "Sri Lanka","Nepal","Mongolia","Turkey","South Africa",
  "Egypt","Morocco","Tunisia","Algeria","Jordan",
  "Lebanon","Oman","Saudi Arabia","Iran","Iraq",
  "Ecuador","Bolivia","Paraguay","Uruguay","Panama",
  "Costa Rica","Dominican Republic","Kazakhstan","Uzbekistan","Azerbaijan"
)

lower_developing_countries <- c(
  "Afghanistan","Yemen","Somalia","Ethiopia","Sudan",
  "South Sudan","Chad","Niger","Mali","Burkina Faso",
  "Burundi","Rwanda","Uganda","Tanzania","Mozambique",
  "Malawi","Zambia","Zimbabwe","Madagascar","Sierra Leone",
  "Liberia","Guinea","Guinea-Bissau","Benin","Togo",
  "Central African Republic","Democratic Republic of the Congo",
  "Republic of the Congo","Cameroon","Gambia",
  "Lesotho","Eswatini","Haiti","Myanmar","Laos",
  "Cambodia","Timor-Leste","Papua New Guinea",
  "Djibouti","Eritrea"
)

n <- 40

# ==================================================
# DEVELOPED COUNTRIES
# ==================================================

developed <- data.frame(
  Country = developed_countries,
  GDP_Per_Capita = round(rnorm(n, 55000, 5000),0),
  Inflation = round(rnorm(n, 2.5, 0.8),2),
  Unemployment = round(rnorm(n, 5, 1.5),2),
  Life_Expectancy = round(rnorm(n, 81, 2),1),
  Literacy_Rate = round(rnorm(n, 98, 1),1),
  Export_Percent_GDP = round(rnorm(n, 55, 8),1),
  Import_Percent_GDP = round(rnorm(n, 50, 8),1),
  FDI_Percent_GDP = round(rnorm(n, 7, 1.5),2),
  Poverty_Rate = round(rnorm(n, 6, 2),1),
  Internet_Users = round(rnorm(n, 92, 4),1),
  Category = "Developed"
)

# ==================================================
# DEVELOPING COUNTRIES
# ==================================================

developing <- data.frame(
  Country = developing_countries,
  GDP_Per_Capita = round(rnorm(n, 18000, 4000),0),
  Inflation = round(rnorm(n, 5.5, 1.5),2),
  Unemployment = round(rnorm(n, 8, 2),2),
  Life_Expectancy = round(rnorm(n, 72, 3),1),
  Literacy_Rate = round(rnorm(n, 88, 4),1),
  Export_Percent_GDP = round(rnorm(n, 42, 8),1),
  Import_Percent_GDP = round(rnorm(n, 45, 8),1),
  FDI_Percent_GDP = round(rnorm(n, 4.5, 1.2),2),
  Poverty_Rate = round(rnorm(n, 18, 5),1),
  Internet_Users = round(rnorm(n, 68, 8),1),
  Category = "Developing"
)

# ==================================================
# LOWER DEVELOPING COUNTRIES
# ==================================================

lower_developing <- data.frame(
  Country = lower_developing_countries,
  GDP_Per_Capita = round(rnorm(n, 3500, 1000),0),
  Inflation = round(rnorm(n, 10, 3),2),
  Unemployment = round(rnorm(n, 12, 3),2),
  Life_Expectancy = round(rnorm(n, 63, 4),1),
  Literacy_Rate = round(rnorm(n, 65, 8),1),
  Export_Percent_GDP = round(rnorm(n, 28, 7),1),
  Import_Percent_GDP = round(rnorm(n, 35, 7),1),
  FDI_Percent_GDP = round(rnorm(n, 2.5, 1),2),
  Poverty_Rate = round(rnorm(n, 42, 8),1),
  Internet_Users = round(rnorm(n, 32, 10),1),
  Category = "Lower Developing"
)

# ==================================================
# COMBINE DATASETS
# ==================================================

economic_data <- rbind(
  developed,
  developing,
  lower_developing
)

# ==================================================
# CHECK DATA
# ==================================================

head(economic_data)

dim(economic_data)

summary(economic_data)

# ==================================================
# SAVE CSV FILE
# ==================================================

write.csv(
  economic_data,
  "economic_dataset_120_countries.csv",
  row.names = FALSE
)

cat("Dataset generated successfully!\n")
cat("Rows:", nrow(economic_data), "\n")
cat("Columns:", ncol(economic_data), "\n")