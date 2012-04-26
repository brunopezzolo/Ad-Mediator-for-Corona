-->
--overlay.lua
--
--Created by Tapps-06 on 2012-04-26.
--Copyright (c) 2012 __MyCompanyName__. All rights reserved.
--<
local widget = require("widget")

local function new(group)
	local overlay = display.newGroup()
	
	local background = display.newRect( overlay, 0, 0, 320, 480)
	background:setFillColor(0, 0, 0, 127)
	
	local adView = {x = 160, y = 160, width=320, height=320} 
	overlay.adView = adView
	
	local function closeCallback()
		overlay:removeSelf()
	end
	
	function overlay:setCloseCallback(callback)
		closeCallback = callback
	end
	
	local closeButton = widget.newButton{
        label = "close",
        left = 0,
        top = 440,
        width = 100, height = 40,
        onRelease = function() closeCallback() end
    }
	overlay:insert(closeButton)
	
	overlay:addEventListener("touch", function() return true end)
	if group then group:insert(overlay) end
	return overlay
end

local adMediatorOverlay = {}
	adMediatorOverlay.new = new
return adMediatorOverlay