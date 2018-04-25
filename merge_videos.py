# Created by MrHeer
# Make sure you had install ffmpeg
# Please move it to the dir of your videos
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
            file_list.append(file)

# create filelist.txt
file = open('./file_list.txt', 'w')
for file_name in file_list:
    file.write('file \'' + file_name + '\'\n')
    pass
file.close()

# merge videos
os.system('ffmpeg -f concat -i filelist.txt -c copy output.mp4')

# delete filelist.txt
os.remove('./file_list.txt')
