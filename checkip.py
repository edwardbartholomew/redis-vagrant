import urllib
from datetime import datetime

# read webpage into content
content = urllib.urlopen("http://checkip.dyndns.org/").read()

# parse 
index1 = content.find("<body>")
index2 = content.find("</body>")
data = content[index1 + len("<body>") : index2].strip()

# open output file in append mode and write string
with open("/tmp/checkip.txt", "a") as outputfile:
  outputfile.write(str(datetime.now()) +  '|' + data + '\n')

