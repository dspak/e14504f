# adjust_gsheet_E14504F.R
# 
# The spreadsheet names need to be adjusted. There are several names per line 
# and no obvious column that can serve as a tip label for the tree. Rather, a 
# column must be created that contains Genus_species_STRAINID.

# Load the required packages
list.of.packages <- c("googlesheets")
new.packages <- list.of.packages[!(list.of.packages %in% 
                                     installed.packages()[,"Package"])]

# Install missing packages
if (length(new.packages)) install.packages(new.packages, 
                                           repos = "http://cran.rstudio.com/")
# Load required packages
lapply(list.of.packages, require, character.only = TRUE)



# Load table into dataframe
sheet <- gs_title("E14504F")
x <- gs_read(sheet)

# Convert hyphen-only columns to NA
x <- data.frame(apply(x, 2, function(x) gsub("^-$", NA, x)), as.is = TRUE)

# Create a vector of names
names <- x$Name

# Elongate R., T. and C.
names <- gsub("R.", "Rhizoctonia", names, fixed = TRUE)
names <- gsub("R ", "Rhizoctonia ", names, fixed = TRUE)
names <- gsub("T.", "Thanatephorus", names, fixed = TRUE)
names <- gsub("C.", "Ceratobasidium", names, fixed = TRUE)
names <- gsub("C ", "Ceratobasidium ", names, fixed = TRUE)

# Grab anything after a comma
alt.names <- gsub("^\\w+\\.? \\w+, (.*)", "\\1", names)
# Set no-commas to NA
alt.names[-grep(",", names)] <- " "

# Remove extranenous stuff from names
names <- gsub("(^\\w+\\.? \\w+), .*", "\\1", names)

# Push changes to gsheet
gs_edit_cells(sheet, ws = "Sheet1", anchor = "A2", byrow = FALSE,
              input = names)

gs_edit_cells(sheet, ws = "Sheet1", anchor = "B2", byrow = FALSE,
              input = alt.names)
