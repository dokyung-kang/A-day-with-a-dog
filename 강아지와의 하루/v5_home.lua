-----------------------------------------------------------------------------------------
--
-- v5_home.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage("content/PNG/집/backgr.png", display.contentCenterX, display.contentCenterY,
		display.contentWidth, display.contentHeight)


	local limit = 4
	local showLimit = display.newText(limit, 620, 250)
	showLimit:setFillColor(0)
	showLimit.size = 150

	 local function timeAttack( event )
	 	limit = limit - 1
	 	showLimit.text = limit

	 	if limit == 0 then
	 		composer.gotoScene("v6_wash")
	 	end
	 end

	 timer.performWithDelay(1000, timeAttack, 0)


	--레이어 정리--
	sceneGroup:insert(background)
	sceneGroup:insert(showLimit)

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
		composer.removeScene("v5_home")
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