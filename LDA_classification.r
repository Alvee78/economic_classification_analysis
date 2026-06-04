# ============================
# TASK 2: LDA CLASSIFICATION
# ============================

# Load library
library(MASS)

# Load dataset
data <- read.csv("economic_dataset_120_countries.csv")

# Ensure Category is factor
data$Category <- as.factor(data$Category)

# ----------------------------
# Train-Test Split
# ----------------------------
set.seed(123)

train_index <- sample(1:nrow(data), 0.7 * nrow(data))

train_data <- data[train_index, ]
test_data  <- data[-train_index, ]

# ----------------------------
# LDA Model Training
# ----------------------------
lda_model <- lda(Category ~ GDP_Per_Capita + Inflation + Unemployment +
                   Life_Expectancy + Literacy_Rate +
                   Export_Percent_GDP + Import_Percent_GDP +
                   FDI_Percent_GDP + Poverty_Rate + Internet_Users,
                 data = train_data)

# ----------------------------
# Prediction
# ----------------------------
lda_pred <- predict(lda_model, test_data)

# ----------------------------
# Confusion Matrix
# ----------------------------
conf_matrix <- table(
  Actual = test_data$Category,
  Predicted = lda_pred$class
)

print("Confusion Matrix:")
print(conf_matrix)

# ----------------------------
# Accuracy
# ----------------------------
accuracy <- mean(lda_pred$class == test_data$Category)

print("Accuracy:")
print(accuracy)

# ----------------------------
# Class-wise Performance
# ----------------------------
print("Class-wise Proportions (Recall):")
print(prop.table(conf_matrix, 1))