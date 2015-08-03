function loadplay()
	if (once[1] = 0)
		menu_bg as spriteGroup
		menu_bg.name = "menu_bg"
		bg_button = LoadImage("button.png")
		for i=1 to GetScreenBoundsBottom() step GetImageHeight(bg_button)+1
			for j=1 to GetScreenBoundsRight() step GetImageWidth(bg_button)+1
				menu_bg.sprlist.insert(makeSprite(bg_button, j, i))
			next j
		next i
		
		drawStuff.insert(menu_bg)
		
		//img_loading_screen = CreateImageColor(255, 50, 50, 255)
		//loading_screen = CreateSprite(img_loading_screen)
		//SetSpriteSize(loading_screen, GetScreenBoundsRight(), GetScreenBoundsBottom())
		//SetSpritePosition(loading_screen, 0, 0)
		loading_screen_x# as float = 0.1
		DeepRight = GetScreenBoundsRight()
		DeepDown = GetScreenBoundsBottom()
		color1 = MakeColor(255, 0, 0)
		color2 = MakeColor(255, 80, 80)
		
		SetRenderToImage(20, 0)
		DrawBox(loading_screen_x#, 0, DeepRight, DeepDown,
					color1, color2, color1, color2, 1)
		SetRenderToScreen()
		spriteLoadingScreen = CreateSprite(20)
		menu_fg as spriteGroup
		menu_fg.name = "menu_fg"
		menu_fg.sprlist.insert(makeSprite(spriteLoadingScreen, 0, 0))
		drawStuff.insert(menu_fg)
		once[1] = 1
	endif
	
	myFgGroup = drawStuff.find("menu_fg")
	inc drawStuff[myFgGroup].pos.x, 0.1
	print(drawStuff[myFgGroup].pos.x)
	print(drawStuff[myFgGroup].name)
	//print(GetSpriteX(loading_screen))
	//SetSpritePosition(loading_screen, loading_screen_x#, 0)
	if (loading_screen_x# > 320)
		mode = PLAY
	endif
endfunction

function playing()
	
endfunction
