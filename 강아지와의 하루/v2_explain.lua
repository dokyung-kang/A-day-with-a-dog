-----------------------------------------------------------------------------------------
--
-- v2_explain.lua
--
-----------------------------------------------------------------------------------------

-- JSON 파싱
local json = require('json')

local Data, pos, msg

local function parse()
	local filename = system.pathForFile("content/JSON/story.json")
	Data, pos, msg = json.decodeFile(filename)

	--디버그
	if Data then
		print(Data[1].type)
	else
		print(pos)
		print(msg)
	end
	--
end
parse()
--

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)

	local section = display.newRect(display.contentWidth/2, display.contentHeight*0.93, display.contentWidth, display.contentHeight*0.15)
	section:setFillColor(0.4, 0.4, 0.25, 0.5)

	local script = display.newText("더미 텍스트입니다.", section.x+50, section.y+30, display.contentWidth*0.8, 120)
	script.width = display.contentWidth*0.6
	script.size = 50
	script:setFillColor(0)

	local index = 1
	local function nextScript( ... )
		if (index <= #Data) then
			if( Data[index].type == "background" ) then
				
				--배경 바꾸기
				background.fill = {
					type = "image",
					filename = Data[index].img
				}
				index = index + 1
				nextScript()

			elseif( Data[index].type == "Narration" ) then
			 
			 	--해설
				 script.text = Data[index].content
				 index = index + 1
			end
		else
			composer.gotoScene("v3_ready")
		end
	end
	nextScript()


	local function tap( event )
		nextScript()
	end
	background:addEventListener("tap", tap)

	-- 레이어 정리
	sceneGroup:insert(background)
	sceneGroup:insert(section)
	sceneGroup:insert(script)
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
		composer.removeScene("v2_explain")
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