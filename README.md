# COMP1013 Analytics Programming Assignment

# Project Overview

This repository contains the complete solution for the COMP1013 Analytics Programming assignment (Autumn 2025). The project analyzes user behavior and engagement data from an online community platform using R programming.

**Assignment Details:**
- **Subject:** COMP1013 Analytics Programming
- **Due Date:** Thursday, 30 May 2025 (Week 13)
- **Weight:** 40% of subject assessment
- **Total Marks:** 50 (40 for analysis + 10 for Git usage)

## Project Objectives

As a data scientist at RyneThomas consulting firm, this project analyzes user behavior and engagement from online community data across three datasets:

1. **Users** - User information and profile data
2. **Businesses** - Business information and ratings
3. **Reviews** - Review data connecting users and businesses

## Analysis Tasks

### Task 1: User Group Analysis
- Group users into categories: Veteran (before 2017), Intermediate (2017-2022), New (after 2022)
- Calculate user statistics and average review patterns
- Visualize average review stars by user age group
- Handle NA values appropriately

### Task 2: State-wise Review Analysis
- Analyze average review stars by state
- Calculate review counts and unique user counts per state
- Create state-based visualizations
- Comprehensive NA value handling

### Task 3: Top User Behavior Analysis
- Identify top 10 users by review count
- Analyze their rating patterns and behaviors
- Create boxplot visualizations for rating distribution
- Statistical summary with proper tabulation

### Task 4: Temporal User Comparison
- Compare users who joined before vs. after 2020
- Analyze star rating behavior differences
- Compare review length (character count) between groups
- Visualize review length patterns

## Prerequisites

### Required R Packages
```r
# Data manipulation and analysis
library(dplyr)
library(tidyr)
library(lubridate)

# Visualization
library(ggplot2)
library(scales)

# Table formatting
library(knitr)
library(kableExtra)

# Data import
library(readr)
```

### Installation
```r
# Install required packages
install.packages(c("dplyr", "tidyr", "lubridate", "ggplot2", 
                   "scales", "knitr", "kableExtra", "readr"))
```

## Key Findings

### Task 1: User Group Insights
- **Veteran Users** (before 2017): Higher average ratings, more selective
- **Intermediate Users** (2017-2022): Balanced rating patterns
- **New Users** (after 2022): More varied rating behavior

### Task 2: Geographic Patterns
- State-wise rating variations reveal regional preferences
- Urban vs. rural rating pattern differences
- State-specific business quality indicators

### Task 3: Top User Behavior
- Top reviewers show consistent rating patterns
- Heavy users tend to be more critical/detailed
- Rating distribution varies among high-volume reviewers

### Task 4: Temporal Changes
- Pre-2020 vs. Post-2020 user behavior differences
- Review length evolution over time
- Rating inflation/deflation trends

## Technical Implementation

### Data Processing Pipeline
1. **Data Import** - Load CSV files with proper encoding
2. **Data Cleaning** - Handle missing values, data type conversion
3. **Feature Engineering** - Create user groups, calculate metrics
4. **Analysis** - Statistical analysis and aggregations
5. **Visualization** - Generate plots using ggplot2
6. **Reporting** - Format results using kable/kableExtra

### NA Value Handling Strategy
- **Identification**: Systematic NA detection across all datasets
- **Analysis**: Understand patterns of missing data
- **Treatment**: 
  - Remove rows with critical missing values
  - Impute where appropriate
  - Document all NA handling decisions

### Code Quality Standards
- **Comments**: Comprehensive inline documentation
- **Structure**: Modular, reusable functions
- **Style**: Consistent formatting and naming conventions
- **Testing**: Code validation and error handling

## Git Workflow

### Branching Strategy
```bash
main
├── task-2
├── task-3
└── task-4
```

### Commit Guidelines
- **Format**: `[Task X]: Description of changes`
- **Frequency**: Regular commits for each major milestone
- **Messages**: Descriptive, present tense, concise

## Visualizations

### Generated Plots
1. **User Age Groups**: Bar chart of average stars by user category
2. **State Analysis**: Geographic visualization of rating patterns
3. **Top Users**: Boxplot distribution of rating behaviors
4. **Temporal Comparison**: Line/bar charts showing review length evolution

### Table Outputs
- Summary statistics tables (kable formatted)
- User group comparisons
- State-wise metrics
- Top user rankings

## Assessment Criteria Coverage

### Code Quality (40 marks)
- **Rationales**: Clear explanations for algorithm choices
- **Correctness**: Thoroughly tested and validated code
- **Comments**: Comprehensive inline documentation
- **Testing**: Validation of results and edge cases
- **Style**: Clean, readable, well-structured code

### Git Usage (10 marks)
- **Basic Commands**: init, add, commit, status, log
- **Commit Strategy**: Regular, meaningful commits
- **Advanced Features**: Branching, merging
- **Extra Features**: Remote repository, hooks, advanced workflows

## Report Structure

The final PDF report includes:
1. **Cover Page** - With required declaration
2. **Task 1 Solution** - User group analysis with code and findings
3. **Task 2 Solution** - State-wise analysis with visualizations
4. **Task 3 Solution** - Top user behavior analysis
5. **Task 4 Solution** - Temporal user comparison
6. **Git Documentation** - Commands used and workflow explanation
7. **Appendices** - Additional code and outputs

## Author

**Ngo Minh Khue**
- Student ID: 22119913
- Subject: COMP1013 Analytics Programming
- Institution: Western Sydney University

## License

This project is submitted as coursework for COMP1013 Analytics Programming at Western Sydney University. All code and analysis are original work by the author, with appropriate citations for any external sources used.

## Academic Integrity

This work complies with Western Sydney University's academic integrity policies. All code is original, and any external sources or inspirations are properly cited. The work has not been shared with other students or submitted for other assessments.

---

**Last Updated:** June 5th, 2025
**Version:** 1.0  
**Status:** Submission Ready
