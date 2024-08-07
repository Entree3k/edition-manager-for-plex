# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the main script and modules
COPY edition-manager.py /app/
COPY modules/ /app/modules/

# Copy the config file
COPY config/config.ini /app/config/config.default.ini

# Copy the requirements file and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Make sure the script is executable
RUN chmod +x edition-manager.py

# Set the entrypoint
ENTRYPOINT ["python", "edition-manager.py"]

# Set default command (can be overridden)
CMD ["--all"]
