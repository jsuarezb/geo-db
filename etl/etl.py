import json
import requests

URL = 'https://tarjetasube.sube.gob.ar/subeweb//jsonPrivate/PointsWeb/SearchTest?type[0]=4'
headers = {
    '__RequestVerificationSource': 'SrcRefW',
    '__RequestVerificationToken': 'mTcv-pKlM3uIPwGdUY9WQekAZkUk-rYv3x4h4sCPJ3TYdiJ5b0FI-GvCJPjEYt85aav4NuOq4sUoVl9R75J0kDdF9KY1:icKXJnTA4uW532mjtzID4OSrTUUk4_CwaoX45Uj4LWup74PEF-0ZLPE2n-VM2Sq8bz4tGK89MR_pTCbsUjhixO4fl_Q1'
}
r = requests.get(URL, headers=headers)

print(r.json())
