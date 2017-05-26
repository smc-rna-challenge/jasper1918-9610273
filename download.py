# Download Synapse reference and example data using inputs.json
# into "./data"
from getpass import getpass
from synapseclient import Synapse
import json

print '''
This script helps download the reference and example data
from synapse.org. You need a Synapse user account.
https://www.synapse.org/

Data will be downloaded to ./data
'''
username = raw_input("Enter your Synapse account email: ")
password = getpass()

syn = Synapse()

print 'Logging in to synapse.org...'
syn.login(username, password, rememberMe=True)

print 'Loading synapse_inputs.json'
inputs = json.load(open('synapse_inputs.json'))

for k, v in inputs.items():
    print 'Downloading "{}"'.format(k)
    syn.get(v, downloadLocation='data')
