import googlemaps
from datetime import datetime
from dotenv import load_dotenv
import os
import pandas as pd

def get_locations(location_list):
    retter = []
    gmaps = googlemaps.Client(key=os.environ.get('GOOGLE_MAP_API_KEY'))

    for loc in location_list:
        try:
            # Geocoding an address
            geocode_result = gmaps.geocode(loc)
            retter.append(geocode_result[0]['geometry']['location'])
        except:
            retter.append(None)

    return retter

if __name__ == '__main__':
    load_dotenv()

    rank = pd.read_csv('data/rankings.csv').drop_duplicates()
    uk = rank[rank['country'] == 'United Kingdom']

    uk['Location'] = uk['institution'].apply(lambda x: x + ", United Kingdom")

    print(uk['Location'])
