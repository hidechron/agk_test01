
// Project: test01 
// Created: 2015-07-21
//#option_explicit
#include "init.agc"
#include "helpers.agc"
#include "playing.agc"
// set window properties
SetWindowTitle("test01")
SetWindowSize(640, 480, 0)

// set display properties
SetVirtualResolution(320, 240)
SetDefaultMagFilter(0)
SetOrientationAllowed(1, 1, 1, 1)
SetRawWritePath(GetReadPath())

#constant INIT 0
#constant TEST -1
#constant MENU 1
#constant INITGAME 2
#constant PLAY 3

image as integer = 0
image = LoadImage("spritesheet.png")
SetImageTransparentColor(image, 94, 129, 162)
debug$ as string = "Error : debug$"
debug$ = makeAtlasTxt()


dim img[899]
for i=0 to 899
	img[i] = LoadSubImage(image,"img"+str(i))
	SetImageTransparentColor(img[i], 94, 129, 162)
next i

var# as float = 0.6
temp as integer = 0
GLOBAL drawStuff as spriteGroup[]
GLOBAL mode = INIT
dim once[5]
GLOBAL loading = 1

do
	Print(ScreenFPS())
	
	select mode
		//========================================
		case INIT:
			if (temp < 80)
				print(GetWritePath())
				print(GetReadPath())
				print(debug$)
				inc temp
			else
				mode = INITGAME
			endif
			
			if (once[0] = 0)
				
				testo as spriteGroup
				testo.name = "test"
				testo.sprlist.insert(makeSprite(img[19], 100, 100, 1))
				testo.sprlist.insert(makeSprite(img[1], 100, 150, 1))
				
				remstart menu_bg as spriteGroup
				for i=1 to GetScreenBoundsBottom() step GetImageHeight(bg_button)+1
					for j=1 to GetScreenBoundsRight() step GetImageWidth(bg_button)+1
						menu_bg.sprlist.insert(makeSprite(bg_button, j, i))
					next j
				next i
				
				drawStuff.insert(testo)
				drawStuff.insert(menu_bg)
				remend
				
				once[0] = 1
			endif
			
			loading = 0
			checkMode()
		endcase
		//=========================================
		case MENU:
			print("This is the menu")
			checkMode()
		endcase
		//=========================================
		case INITGAME:
			loadplay()
			drawAll()
		endcase
		//=========================================
		case PLAY:
			print("Let's play")
		endcase
		//=========================================
		case TEST:
			remstart for i=0 to drawStuff.length
				for j=0 to drawStuff[i].sprlist.length
					SetSpritePosition(drawStuff[i].sprlist[j].ID, 
										drawStuff[i].sprlist[j].X, drawStuff[i].sprlist[j].Y)
					SetSpriteVisible(drawStuff[i].sprlist[j].ID, 1)
				next j
			next i
			remend
			drawAll()
			checkMode()
		endcase
		//=========================================
	endselect
	
    Sync()
loop

function drawAll()
	for i=0 to drawStuff.length
		for j=0 to drawStuff[i].sprlist.length
			SetSpritePosition(drawStuff[i].sprlist[j].ID, 
								drawStuff[i].sprlist[j].X, drawStuff[i].sprlist[j].Y)
			//SetSpriteVisible(drawStuff[i].sprlist[j].ID, 1)
		next j
	next i
endfunction

function checkMode()
	if (GetRawKeyReleased(112))
		mode = TEST
	elseif (GetPointerReleased())
		mode = PLAY
		//DeleteAllSprites()
	endif
endfunction

function makeSprite(imag, x, y, visible)
	tempSprite as sprite
	tempSprite.ID = createSprite(imag)
	tempSprite.X = x
	tempSprite.Y = y
	SetSpritePosition(tempSprite.ID, x, y)
	SetSpriteVisible(tempSprite.ID, visible)
endfunction tempSprite

// TYPES TYPES TYPES TYPES TYPES TYPES TYPES TYPES TYPES

TYPE spriteGroup
	name as string
	sprlist as sprite[]
	pos as position
ENDTYPE

TYPE sprite
	ID AS INTEGER
	X AS INTEGER
	Y AS INTEGER
ENDTYPE

TYPE position
	X as INTEGER
	Y as INTEGER
ENDTYPE
