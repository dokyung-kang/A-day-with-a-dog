-----------------------------------------------------------------------------------------
--
-- v3_ready.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background =display.newImage("content/PNG/준비물/backgr.png", display.contentCenterX, display.contentCenterY,
		display.contentWidth, display.contentHeight)

	local ex = display.newImage("content/PNG/준비물/ex.png", 600, 65)

	local basket = display.newImage("content/PNG/준비물/basket.png", 644, 397)

    local food = display.newImage("content/PNG/준비물/food.png", 100, 100)

    local bag = display.newImage("content/PNG/준비물/bag.png", 100, 300)

    local light = display.newImage("content/PNG/준비물/light.png", 100, 530)

    local neck = display.newImage("content/PNG/준비물/neck.png", 270, 605)

    local poo = display.newImage("content/PNG/준비물/poo.png", 950, 100)

    local shoe = display.newImage("content/PNG/준비물/shoe.png", 1150, 100)

    local tire = display.newImage("content/PNG/준비물/tire.png", 1150, 320)

    local water = display.newImage("content/PNG/준비물/water.png", 1150, 540)

    local cnt = 0


    -- 담는 것 --
 	food.id = 2
 	bag.id = 4
 	neck.id = 6
 	water.id = 8

 	-- 안 담는 것 --
 	light.id = 1
 	poo.id = 3
 	shoe.id = 5
 	tire.id = 7

	 local function catch( event )
	 	if (event.phase == "began") then

	 		display.getCurrentStage():setFocus( event.target )
	 		event.target.isFocus = true
	 	elseif (event.phase == "moved" ) then
	 		if (event.target.isFocus ) then
	 			event.target.x = event.xStart + event.xDelta
	 			event.target.y = event.yStart + event.yDelta

	 		end
	 	elseif (event.phase == "ended" or event.phase == "cancelled" ) then
	 		if (event.target.isFocus ) then

	 			if event.target.x < basket.x + 200 and event.target.x > basket.x - 200
	 				and event.target.y < basket.y + 200 and event.target.y > basket.y - 200 then


	 				if (event.target.id % 2 == 0) then
	 					cnt = cnt + 1

	 				else
	 					event.target.x = event.xStart
	 					event.target.y = event.yStart
	 				end


	 				if cnt == 4 then
	 					composer.gotoScene("v4_walk")
	 				end
	 			else
	 				event.target.x = event.xStart
	 				event.target.y = event.yStart
	 			end



	 		display.getCurrentStage():setFocus(nil)
	 		event.target.isFocus = false
	 		end
	 		display.getCurrentStage():setFocus(nil)
	 		event.target.isFocus = false
	 	end
	 end

	 	food:addEventListener("touch", catch)
	 	bag:addEventListener("touch", catch)
	 	neck:addEventListener("touch", catch)
	 	water:addEventListener("touch", catch)

	 	light:addEventListener("touch", catch)
	 	poo:addEventListener("touch", catch)
	 	shoe:addEventListener("touch", catch)
	 	tire:addEventListener("touch", catch)



	 --레이어 정리--
	sceneGroup:insert(background)
	sceneGroup:insert(ex)
	sceneGroup:insert(basket)
	sceneGroup:insert(food)
	sceneGroup:insert(bag)
	sceneGroup:insert(light)
	sceneGroup:insert(neck)
	sceneGroup:insert(poo)
	sceneGroup:insert(shoe)
	sceneGroup:insert(tire)
	sceneGroup:insert(water)
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
		composer.removeScene("v3_ready")
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