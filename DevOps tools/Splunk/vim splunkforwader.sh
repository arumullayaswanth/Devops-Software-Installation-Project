# first step-1 Splunk.sh
# 2nd step-1 vim splunkforwader.sh

wget -O splunkforwarder-9.3.1-0b8d769cb912.x86_64.rpm "https://download.splunk.com/products/universalforwarder/releases/9.3.1/linux/splunkforwarder-9.3.1-0b8d769cb912.x86_64.rpm"

#Install downloaded rpm package
sudo yum install splunkforwarder-9.3.1-0b8d769cb912.x86_64.rpm -y

#Switch to splunkforwarder bin directory 
cd /opt/splunkforwarder/bin/

#Strat the splunk 
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
#would you like to change ports? y
#enter a new mgmt. port: 8091

# Indicate the Splunk Forwarder setup has completed successfully
echo "✅ Splunk Forwarder setup complete!"
echo "✅ Splunk forwarder is successfully started!"

cd /opt/splunkforwarder/bin/
