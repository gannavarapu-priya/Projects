# Big Data Analytics
Created regression models to predict NYC Yellow Cab trip durations with optimized machine learning models.

# NYC Taxi Trip Analysis and Visualization

This project explores the spatial and temporal patterns of New York City's cab usage using the 2016 NYC Yellow Cab trip record data. The aim is to uncover trends, behaviors, and insights through various analyses, including clustering, density mapping, and temporal visualization.

---

## Table of Contents

- [Overview](#overview)  
- [Dataset Description](#dataset-description)  
- [Installation](#installation)  
- [Features](#features)  
- [Visualization Highlights](#visualization-highlights)  
- [Clustering Analysis](#clustering-analysis)  
- [Usage](#usage)  
- [Results](#results)  
- [Acknowledgments](#acknowledgments)

---

## Overview

This project provides insights into how New Yorkers utilize taxi services. It analyzes pickup and drop-off locations, trip durations, and temporal variations to draw meaningful conclusions. Key outputs include spatial density plots, clustering results, and a zoomed-in view of Manhattan's taxi activity.

---

## Dataset Description

The dataset is based on the **2016 NYC Yellow Cab trip record data**.  
**Key files:**
- `train.csv`: Training set (1,458,644 records)
- `test.csv`: Testing set (625,134 records)
- `sample_submission.csv`: Sample submission format  

**Fields in the dataset:**
- **id**: Unique identifier for trips  
- **vendor_id**: Code for the provider  
- **pickup/dropoff_datetime**: Start and end timestamps  
- **pickup/dropoff_latitude & longitude**: Geospatial coordinates  
- **passenger_count**: Number of passengers  
- **trip_duration**: Duration in seconds  

---

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd nyc-taxi-trip-analysis
   ```
2. Install the required Python packages:
   ```bash
   pip install -r requirements.txt
   ```

---

## Features

- **Data Preprocessing**: Removal of outliers and transformation to meaningful units.  
- **Spatial Density Analysis**: Visualize pickup and drop-off activity on a heatmap.  
- **Temporal Trends**: Analyze usage patterns by hour, day, and month.  
- **Clustering**: Group trips into templates to summarize NYC's taxi activity.  

---

## Visualization Highlights

1. **Trip Duration Distribution**: Histogram of trip durations.  
2. **Spatial Density Maps**: Log-scaled density plots for pickups and drop-offs.  
3. **Manhattan Focus**: Zoomed-in view of Manhattan's taxi activity.  
4. **Cluster Analysis**: Template trips visualized on NYC's map with source-destination connections.

---

## Clustering Analysis

- **Attributes Used**:  
  - Source latitude and longitude  
  - Destination latitude and longitude  
  - Trip duration  
- **Clustering Algorithm**: MiniBatch KMeans with 80 clusters.
- **Outcome**: Identifies stereotypical trip patterns in NYC.

---

## Usage

### Run the Analysis and Visualization

1. Place the dataset in the `data/` directory.
2. Execute the main script:
   ```bash
   python nyc_taxi_analysis.py
   ```
3. Results will include visualizations such as spatial density maps and cluster templates.

### GUI Showcase for Result Images

The GUI showcases result images generated from the analysis.  
Run the following command to start the GUI:
```bash
python gui_showcase.py
```

---

## Results

- **Temporal Trends**:  
  - Higher cab usage during weekdays compared to weekends.  
  - Peak hours observed during mornings and evenings.  
- **Spatial Insights**:  
  - Dense activity around Manhattan.  
  - Clear trends in commuter and leisure travel patterns.  
- **Clustering Outcomes**:  
  - 80 clusters summarizing the variety of trips.  

---

## Acknowledgments

- Dataset provided by the NYC Taxi and Limousine Commission (TLC).  
- Visualization techniques inspired by open datasets and tools in data science.

---
