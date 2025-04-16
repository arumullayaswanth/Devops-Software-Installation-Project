# Download the Splunk RPM package
wget -O splunk-9.3.1-0b8d769cb912.x86_64.rpm "https://download.splunk.com/products/splunk/releases/9.3.1/linux/splunk-9.3.1-0b8d769cb912.x86_64.rpm"

# List files in the current directory
ls

# Install the Splunk RPM package using yum
sudo yum install splunk-9.3.1-0b8d769cb912.x86_64.rpm -y 

# Navigate to the Splunk binary directory
cd /opt/splunk/bin/

# Start Splunk and accept license terms
sudo ./splunk start --accept-license --answer-yes


echo "Creating password seed file..."
# Create password seed file for admin user
#Create credentials for the administrator account.
#Characters do not appear on the screen when you type in credentials.
#Please enter an administrator username: admin
#Password must contain at least:
  # * 8 total printable ASCII character(s).
#Please enter a new password: yaswanth
#Please confirm new password: Yaswanth

echo "✅ Splunk installation and setup complete!"
echo "Login at http://localhost:8000 with username: $SPLUNK_USER and password: $SPLUNK_PASSWORD"

# Enable Splunk to start automatically on system boot
./splunk enable boot-start
