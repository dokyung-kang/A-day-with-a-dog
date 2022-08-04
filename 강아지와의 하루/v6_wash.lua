-----------------------------------------------------------------------------------------
--
-- v6_wash.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImage("content/PNG/샤워/backgr.png", display.contentCenterX, display.contentCenterY,
		display.contentWidth, display.contentHeight)

	local dog2 = display.newImage("content/PNG/샤워/dog2.png",650, 322)

	local bubble = {}
	local bubbleGroup = display.newGroup()

	local ex = display.newImage("content/PNG/샤워/ex.png", 100, 170)

	local cnt = 0

	-- 하늘 버블 --
	for i = 1, 6 do
		bubble[i] = display.newImage(bubbleGroup, "content/PNG/샤워/bubble.png")
		bubble[i].x, bubble[i].y = dog2.x + math.random(-300, 300), dog2.y + math.random(-200, 200)
	end
	-- 파랑 버블 --
	for i = 7, 12 do
		bubble[i] = display.newImage(bubbleGroup, "content/PNG/샤워/bubble2.png")
		bubble[i].x, bubble[i].y = dog2.x + math.random(-300, 300), dog2.y + math.random(-200, 200)
	end

	--이동--
	local function catch( event )
		display.remove( event.target )

		cnt = cnt + 1

		if cnt == 12 then
			composer.gotoScene("v7_sleep")
		end
	end

	for i = 1, 12 do
		bubble[i]:addEventListener("tap", catch)
	end
	


	sceneGroup:insert(background)
	sceneGroup:insert(dog2)
	sceneGroup:insert(bubbleGroup)
	sceneGroup:insert(ex)
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
		composer.removeScene("v6_wash")
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