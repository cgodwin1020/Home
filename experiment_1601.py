#!/usr/bin/env python
from psychopy import visual, core, event, gui, logging
#Turns off annoying warnings
logging.console.setLevel(logging.CRITICAL)
from time import strftime
import random
import numpy
import linecache
from collections import defaultdict
from operator import itemgetter, sub
from random import shuffle
import os, sys

WINDOW_WIDTH = 1024
WINDOW_HEIGHT = 768

DEBUG = False

PARTICIPANT_DATA = None

conditions_order = [1,2]*1#*55
#random.shuffle(conditions_order)

FRAME_RATE = None

GLOBAL_CLOCK = core.MonotonicClock()

videoList = ['EZ1_test_video.mp4'] #['american_flag_ON_final_smaller.mp4',
#'ants3_PN_final_smaller.mp4']#,
#'bear_teeth_AS_final_smaller.mp4',
# 'ca_squirrel_AN_final.mp4',
# 'chickens_AN_final_smaller.mp4',
# 'cockroaches10_PH_final_smaller.mp4',
# 'cockroaches1_PH_final_smaller.mp4',
# 'cockroaches3_PH_final_smaller.mp4',
# 'cockroaches4_PH_final_smaller.mp4',
# 'cockroaches7_PH_final_smaller.mp4',
# 'cockroach_outside_PN_final_smaller.mp4',
# 'construction_ON_final_smaller.mp4',
# 'cougar2_AS_final_smaller.mp4',
# 'cows_eating_AN_final_smaller.mp4',
# 'crocodile_mouth_AS_final_smaller.mp4',
# 'desert_snake_AS_final_smaller.mp4',
# 'digital_ON_final_smaller.mp4',
# 'ducklings3_AN_final_smaller.mp4',
# 'ducklings5_AN_final_smaller.mp4',
# 'dung_beetle_PN_final_smaller.mp4',
# 'flags_swaying_ON_final_smaller.mp4',
# 'flies_8_PH_final_smaller.mp4',
# 'flies_in_mud_PN_final_smaller.mp4',
# 'flipping_book_ON_final_smaller.mp4',
# 'flyonflower_PN_final_smaller.mp4',
# 'hummingbird_cactus_AN_final_smaller.mp4',
# 'lion_attack_AS_final_smaller.mp4',
# 'many_ants_PN_final_smaller.mp4',
# 'rabbit_AN_final_smaller.mp4',
# 'record_player_ON_final_smaller.mp4',
# 'rodents1_PH_final_smaller.mp4',
# 'rodents4_PH_final_smaller.mp4',
# 'rowing_ON_final_smaller.mp4',
# 'seal_AN_final_smaller.mp4',
# 'shark_AS_final_smaller.mp4',
# 'shark_cage_AS_final_smaller.mp4',
# 'sheep_eating_AN_final_smaller.mp4',
# 'sheep_grazing_AN_final_smaller.mp4',
# 'ski_lift2_ON_final_smaller.mp4',
# 'squirrel_eating_AN_final_smaller.mp4',
# 'stalking_lions_AS_final_smaller.mp4',
# 'stingers4_PN_final_smaller.mp4',
# 'stingers8_PN_final_smaller.mp4',
# 'swings_ON_final_smaller.mp4',
# 'tiger_boy_AS_final_smaller.mp4',
# 'two_crocodiles_AS_final_smaller.mp4',
# 'wasp_PH_final_smaller.mp4',
# 'wind_turbine_ON_final_smaller.mp4',
# 'wolves_surround_AS_final_smaller.mp4',
# 'worms2_PN_final_smaller.mp4',
# 'worms_PN_final_smaller.mp4',
# 'worm_table_PH_final_smaller.mp4',
# 'yacht_sailing_ON_final_smaller.mp4',
# 'yellow_jacket_PH_final_smaller.mp4',
# 'ants_ground_PN_final.mp4']

random.shuffle(videoList)

#################
#Setup Functions#
#################

# Prompts for subject input
def experimentSetup():
    dialogInfo = {'Participant Number': ''}
    dialog = gui.DlgFromDict(dictionary = dialogInfo, title = '1601 Movie Viewing')
    if dialog.OK and dialogInfo['Participant Number'] != '':
        # TODO (craig) there has got to be a better way to update this global. works perfectly fine for now
        globals()['PARTICIPANT_DATA'] = {'time': strftime("%Y-%m-%d  %H:%M:%S"),
            'subject': dialogInfo['Participant Number']}

def fileSetup():
    participantFile = '1601MovieViewing_{}.csv'.format(PARTICIPANT_DATA['subject'])
    fh = open(participantFile, 'a')
    fh.write('Participant,onsetTime,condition,videoFile,rating,ratingRT\n')
    return fh

# Sets up visual window and GUI for experiment
def windowSetup():
    win = visual.Window(size=(WINDOW_WIDTH, WINDOW_HEIGHT), color="black", units='pix', allowGUI='False', winType='pyglet')
    event.Mouse(visible=False)
    globals()['FRAME_RATE'] = win.getActualFrameRate()
    if DEBUG:
        print 'FRAME_RATE: ', FRAME_RATE

    # visual.TextStim(
                    # win, text='Welcome! In this experiment, you will view a series of movies showing animals or objects. As you watch the videos, make sure to lie as still as possible. Sometimes a fixation cross will appear on the screen. During these times, you can rest and stay focused on the fixation',
                    # height=30, color='white', pos=[0,100]
                    # ).draw()
    return win

	
def writeToFile(fh, condition, videoFile, rating, ratingRT):
    trialList = [PARTICIPANT_DATA['subject'], GLOBAL_CLOCK.getTime(), condition, videoFile, rating, ratingRT]

    for i in range(0,len(trialList)):
        if trialList[i] is None:
            trialList[i] = 'None'

    trialString = ','.join(map(str,trialList))
    fh.write('{}\n'.format(trialString))	
	

###Experiment Functions###

#shows experiment instructions
def myInstructions(firstIns):
	if firstIns == True:
		psychopyImage = visual.ImageStim(win, image = 'instruction_image.jpg', pos = [0.0, 0.0])
		psychopyImage.draw()
		win.flip()
		event.waitKeys(keyList=['space'])

	else:
		psychopyTxt = visual.TextStim(win, color='white',
			text = "Sometimes you will see a fixation cross [+] on the screen. During these times, you can relax and stay focused on the screen. \n \
			\n \
			Throughout the experiment, make sure to stay as still as you can. \n \
			\n \
			Please let the experimenter know if you have any questions", units='norm', height=0.1, pos=[0.0, 0.0], alignHoriz='center',alignVert='center', wrapWidth=1.75)
		psychopyTxt.draw()
		win.flip()
		event.waitKeys(keyList=['space'])

#end of experiment
def endExp():
		psychopyTxt = visual.TextStim(win, color='white', text = "You have reached the end of the experiment. Please wait for further instructions from the researcher", 
		units='norm', height=0.1, pos=[0.0, 0.0], alignHoriz='center',alignVert='center', wrapWidth=1.75)
		psychopyTxt.draw()
		win.flip()
		event.waitKeys(keyList=['space'])
		
		
#sync with mri scanner		
def performMRISync():
		psychopyTxt = visual.TextStim(win, text = "Syncing with scanner - Get ready!", units='norm', height = .1, color = 'white', pos = [0.0,0.0], alignHoriz='center',alignVert='center', wrapWidth=1.75)
		psychopyTxt.draw()
		win.flip()
		event.waitKeys(keyList=['t'])
		writeToFile(fh, 'performMRISync', None, None, None)

							

#plays a movie for 15 seconds
def playMovies(j):
	global videoFile
	videoFile = videoList[j]
	writeToFile(fh, 'view_movie', videoFile, None, None)
	mov = visual.MovieStim(win, videoFile, size=[854, 480],flipVert=False, flipHoriz=True)
	globalClock = core.Clock()

	while globalClock.getTime()<30:    #movie duration is 15 seconds
		mov.draw()
		win.flip()   #win.update
 	
		
#displays a fixation (rest period) for 15 seconds		
def fixationBlock():
	writeToFile(fh, 'fixation', None, None, None)				
	win.setRecordFrameIntervals()

	psychopyTxt = visual.TextStim(win, color='white',
							text = "+",
							units='norm', height=0.1,
							pos=[0.0, 0.0], alignHoriz='center',alignVert='center')					
	trialClock = core.Clock()
	t=lastFPSupdate=0;
	while t<15:#quits after 15 secs
		t=trialClock.getTime()
		psychopyTxt.draw()
		win.flip()
	
		
#participant gives rating; 3-second time limit
def getRating():
	writeToFile(fh, 'rate', videoFile, None, None)
	myRatingScale = visual.RatingScale(win, pos = None, scale=None, high=5, singleClick=True, showAccept=False)
	question = "Please enter your rating"
	myItem = visual.TextStim(win, text=question, height=.1, units='norm') # item to-be-rated

	event.clearEvents()
	trialClock = core.Clock()
	t=lastFPSupdate=0;
	while t<3: # show for 3 seconds
		t=trialClock.getTime()
		myItem.draw()
		myRatingScale.draw()
		win.flip()

	rating = myRatingScale.getRating() # get the value indicated by the subject
	ratingRT = myRatingScale.getRT() #get reaction time of subject's rating
	writeToFile(fh, 'rate', videoFile, rating, ratingRT)

##########
##########
##########
		
#Main Experiment
experimentSetup()
from psychopy import visual
win = windowSetup()
fh = fileSetup()

myInstructions(True)
myInstructions(False)
performMRISync()

#more complicated than necessary - this was written when we were randomly shuffling and presenting videos and rest blocks. Now they simply alternate, but
#code left as is for flexibility in future
j = 0
for i in range(0,len(conditions_order)):
	if conditions_order[i] == 1:
		playMovies(j)
		getRating()
		j = j+1
	else:
		fixationBlock()

endExp()

win.close()