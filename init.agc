TYPE imageLoaded
	imag AS INTEGER
	sprite AS INTEGER
ENDTYPE

function makeAtlasTxt()
	if NOT GetFileExists("spritesheet subimages.txt")
		spritesheetTxt as integer = 0
		spritesheetTxt = OpenToWrite("spritesheet subimages.txt")
		curX as integer = 1
		curY as integer = 1
		debug$ as string
		i as integer = 0
		imgstring$ as string = "Error : imgstring"
		for i=0 to 899
			imgstring$ = "img"+str(i)+":"+str(curX)+":"+str(curY)+":23:23"
			if (mod(i, 2) = 0 AND i < 40)
				debug$ = debug$ + chr(10)
			endif
			debug$ = debug$ + " / " + imgstring$
			WriteLine(spritesheetTxt, imgstring$)
			curX = curX + 23
			if (mod(i+1, 30) = 0)
				curX = 1
				curY = curY + 23
			endif
		next i
		CloseFile(spritesheetTxt)
	endif
	
ENDFUNCTION debug$
