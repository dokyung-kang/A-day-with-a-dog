-----------------------------------------------------------------------------------------
--
-- v4_wash.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local physics = require("physics")
	physics.start()

	local background = display.newImage("content/PNG/산책/backgr.png", display.contentCenterX, display.contentCenterY,
		display.contentWidth, display.contentHeight)
	
	local arrive = display.newImage("content/PNG/산책/arrive.png", 1150, 100)

	local dog = display.newImage("content/PNG/산책/dog.png", 100, 70)
	physics.addBody(dog, "static")

	local ex = display.newImage("content/PNG/산책/ex.png", 600, 640)

	local grass = display.newImage("content/PNG/산책/grass.png", 450, 125)

	local bomb1 = display.newImage("content/PNG/산책/bomb.png", 100, 600)

	local bomb2 = display.newImage("content/PNG/산책/bomb.png", 1200, 600)

	local can1 = display.newImage("content/PNG/산책/can.png", 500, 350)

	local can2 = display.newImage("content/PNG/산책/can.png", 1150, 250)

	local sharp1 = display.newImage("content/PNG/산책/sharp.png", 1100, 500)

	local sharp2 = display.newImage("content/PNG/산책/sharp.png", 650, 250)

	local cnt = 0

	-- 개 움직임 --
	local function dogMove(event)
		if(event.keyName == "right") then
			if(dog.x < 1280) then
				transition.moveBy(dog, {x=50, y=0, time=300})
			else
				transition.moveBy(dog, {x=0, y=0, time=300})
			end
		elseif(event.keyName == "left") then
			if(dog.x > 80) then
				transition.moveBy(dog, {x=-50, y=0, time=300})
			else
				transition.moveBy(dog, {x=0, y=0, time=300})
			end
		elseif(event.keyName == "down") then
			if(dog.y < 700) then
				transition.moveBy(dog, {x=0, y=50, time=300})
			else
				transition.moveBy(dog, {x=0, y=0, time=300})
			end
		elseif(event.keyName == "up") then
			if(dog.y > 60) then
				transition.moveBy(dog, {x=0, y=-50, time=300})
			else
				transition.moveBy(dog, {x=0, y=0, time=30})
			end
		end

		if dog.x > 920 and dog.y < 200 then --도착--
			Runtime:addEventListener("key", dogMove)
			local nextB = display.newImage("content/PNG/산책/next.png", 640, 360)
	 		sceneGroup:insert(nextB)

	 			local function start(event)
					composer.gotoScene("v5_home")
				end
				nextB:addEventListener("tap", start)
		elseif dog.x > 180 and dog.x < 700 and dog.y > 0 and dog.y < 300 then	-- 장애물 --
			Runtime:addEventListener("key", dogMove)
			dog.x, dog.y = 100, 70
		elseif dog.x > 50 and dog.x < 150 and dog.y > 460 and dog.y < 750 then	
			Runtime:addEventListener("key", dogMove)
			dog.x, dog.y = 100, 70
		elseif dog.x > 1050 and dog.x < 1250 and dog.y > 460 and dog.y < 750 then	
			Runtime:addEventListener("key", dogMove)
			dog.x, dog.y = 100, 70
		elseif dog.x > 330 and dog.x < 700 and dog.y > 300 and dog.y < 470 then	
			Runtime:addEventListener("key", dogMove)
			dog.x, dog.y = 100, 70
		elseif dog.x > 1000 and dog.x < 1250 and dog.y > 250 and dog.y < 370 then	
			Runtime:addEventListener("key", dogMove)
			dog.x, dog.y = 100, 70
		elseif dog.x > 950 and dog.x < 1170 and dog.y > 350 and dog.y < 650 then	
			Runtime:addEventListener("key", dogMove)
			dog.x, dog.y = 100, 70
		elseif dog.x > 550 and dog.x < 820 and dog.y > 100 and dog.y < 400 then	
			Runtime:addEventListener("key", dogMove)
			dog.x, dog.y = 100, 70
	 	end
	end
	Runtime:addEventListener("key", dogMove)




	sceneGroup:insert(background)
	sceneGroup:insert(arrive)
	sceneGroup:insert(ex)
	sceneGroup:insert(grass)
	sceneGroup:insert(bomb1)
	sceneGroup:insert(bomb2)
	sceneGroup:insert(can1)
	sceneGroup:insert(can2)
	sceneGroup:insert(sharp1)
	sceneGroup:insert(sharp2)
	sceneGroup:insert(dog)
end




function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
		composer.removeScene("v4_walk")
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
