# Created by Heer
# Make sure you had install ffmpeg
# Please move it to the dir of your videos
# Modify this program and make it suit you
# Run it

import os

# create filelist.txt
file = open('./filelist.txt', 'w')
for i in range(1, 9):
    file.write('file \'' + str(i) + '\'\n')
    pass
file.close()

# merge videos
os.system('ffmpeg -f concat -i filelist.txt -c copy output.mp4')

# delete filelist.txt
os.remove('./filelist.txt')
