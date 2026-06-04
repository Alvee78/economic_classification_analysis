# ============================
# TASK 3: PCA + BIPLOT
# ============================

# Load dataset
data <- read.csv("economic_dataset_120_countries.csv")

# Ensure category is factor
data$Category <- as.factor(data$Category)

# ----------------------------
# Step 1: Select numeric variables only
# ----------------------------
numeric_data <- data[, c(
  "GDP_Per_Capita",
  "Inflation",
  "Unemployment",
  "Life_Expectancy",
  "Literacy_Rate",
  "Export_Percent_GDP",
  "Import_Percent_GDP",
  "FDI_Percent_GDP",
  "Poverty_Rate",
  "Internet_Users"
)]

# ----------------------------
# Step 2: Run PCA
# ----------------------------
pca_model <- prcomp(numeric_data, scale. = TRUE)

# ----------------------------
# Step 3: PCA Summary (variance explained)
# ----------------------------
summary(pca_model)

# ----------------------------
# Step 4: Scree Plot
# ----------------------------
plot(pca_model, type = "l", main = "Scree Plot")

# ----------------------------
# Step 5: Biplot (Base R)
# ----------------------------
biplot(pca_model,
       scale = 0,
       cex = 0.7)

# ----------------------------
# Step 6: Colored PCA Plot (better visualization)
# ----------------------------
library(factoextra)

fviz_pca_biplot(
  pca_model,
  label = "var",
  habillage = data$Category,
  addEllipses = TRUE,
  ellipse.level = 0.95
)

# ----------------------------
# Step 7: PCA Scores (optional export)
# ----------------------------
pca_scores <- as.data.frame(pca_model$x)
pca_scores$Category <- data$Category
pca_scores$Country <- data$Country

head(pca_scores)

# Save PCA results
write.csv(pca_scores, "pca_results.csv", row.names = FALSE)