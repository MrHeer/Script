# Created by MrHeer
# Make sure you had install ffmpeg
# Please move it to the dir of your video
# Modify this program and make it suit you
# Run it

import os
import re

# get some info
file_list = []
extension = ''
ext = input("Enter the extension(default -- .ts): ")
if ext.strip() == '':
    extension = '.ts'
else:
    extension = ext

for root, dirs, files in os.walk("."):
    for file in files:
        if re.search(extension + "$", file):
            file_list.append(int(file[0: -len(extension)]))

# create file_list.txt
file_list.sort()
file = open('./file_list.txt', 'w')
for file_name in file_list:
    file.write('file \'' + str(file_name) + extension + '\'\n')
    pass
file.close()

# merge video
os.system('ffmpeg -f concat -i file_list.txt -c copy output.mp4')

# delete video
os.remove('./file_list.txt')
