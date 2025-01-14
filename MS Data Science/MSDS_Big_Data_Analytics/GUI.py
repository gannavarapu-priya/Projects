import tkinter as tk
from PIL import ImageTk, Image
import os

# Function to display an image in a window
def show_image(image_path):
    root = tk.Toplevel()
    root.title("Result Image")

    img = Image.open(image_path)
    img = img.resize((800, 600), Image.LANCZOS)  # Use Image.LANCZOS for high-quality resizing
    img = ImageTk.PhotoImage(img)

    panel = tk.Label(root, image=img)
    panel.image = img
    panel.pack()

# Directory containing result images
image_directory = r"output"

# Create dictionary mapping image names to file paths
result_images = {}
for filename in os.listdir(image_directory):
    if filename.endswith(".png"):
        image_name = os.path.splitext(filename)[0]  # Remove extension from filename
        result_images[image_name] = os.path.join(image_directory, filename)

# Function to display selected image
def display_image(image_name):
    image_path = result_images[image_name]
    show_image(image_path)

# Create main window
root = tk.Tk()
root.title("Result Showcase")

# Create buttons for each result image
for image_name in result_images:
    button = tk.Button(root, text=image_name, command=lambda name=image_name: display_image(name))
    button.pack(pady=10, padx=20, fill=tk.BOTH, expand=True)

# Display dataset description
dataset_description = """
Dataset Description
The competition dataset is based on the 2016 NYC Yellow Cab trip record data made available in Big Query on Google Cloud Platform. The data was originally published by the NYC Taxi and Limousine Commission (TLC). The data was sampled and cleaned for the purposes of this playground competition. Based on individual trip attributes, participants should predict the duration of each trip in the test set.

File Descriptions:
- train.csv: the training set (contains 1,458,644 trip records)
- test.csv: the testing set (contains 625,134 trip records)
- sample_submission.csv: a sample submission file in the correct format

Data Fields:
- id: a unique identifier for each trip
- vendor_id: a code indicating the provider associated with the trip record
- pickup_datetime: date and time when the meter was engaged
- dropoff_datetime: date and time when the meter was disengaged
- passenger_count: the number of passengers in the vehicle (driver-entered value)
- pickup_longitude: the longitude where the meter was engaged
- pickup_latitude: the latitude where the meter was engaged
- dropoff_longitude: the longitude where the meter was disengaged
- dropoff_latitude: the latitude where the meter was disengaged
- store_and_fwd_flag: This flag indicates whether the trip record was held in vehicle memory before sending to the vendor because the vehicle did not have a connection to the server (Y=store and forward; N=not a store and forward trip)
- trip_duration: duration of the trip in seconds

Disclaimer: The decision was made to not remove dropoff coordinates from the dataset in order to provide an expanded set of variables to use in Kernels.
"""

text = tk.Text(root, height=20, width=100)
text.insert(tk.END, dataset_description)
text.pack(pady=20, padx=20)

# Run the main event loop
root.mainloop()
