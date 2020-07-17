import pandas as pd
import json
import requests

#Import Ridership Data from the API into a DataFrame
ridership_api_data = requests.get('http://service.civicpdx.org/transportation-systems/passenger-census/passenger-census/').json()
raw_ridership_data = pd.DataFrame(ridership_api_data)
l = raw_ridership_data['results']['features']

#Import Ridership Data from the API into a DataFrame
ridership_api_data = requests.get('http://service.civicpdx.org/transportation-systems/passenger-census/system/annual/total/').json()
raw_ridership_data = pd.io.json.json_normalize(ridership_api_data)

#Import National Data
national_ridership_api_data = requests.get('http://service.civicpdx.org/transportation-systems/passenger-census/national/ridership/').json()
national_ridership_data = pd.io.json.json_normalize(national_ridership_api_data)

