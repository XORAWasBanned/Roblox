-- Path: CoreGui.RobloxGui.Modules.Tracker.TrackerMenu
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v3 = v_u_2:WaitForChild("RobloxGui")
local v_u_4 = require(v1.Packages.Roact)
local v_u_5 = require(v3.Modules.Tracker.TrackerPrompt)
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.showPrompt(p7, p8) -- name: showPrompt
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2
	if p7.trackerPrompt then
		v_u_4.update(p7.trackerPrompt, v_u_4.createElement(v_u_5, {
			["promptType"] = p8
		}))
	else
		p7.trackerPrompt = v_u_4.mount(v_u_4.createElement(v_u_5, {
			["promptType"] = p8
		}), v_u_2, "RobloxTrackerPromptGui")
	end
end
function v_u_6.new() -- name: new
	-- upvalues: (copy) v_u_6
	local v9 = {
		["trackerPrompt"] = nil
	}
	local v10 = v_u_6
	setmetatable(v9, v10)
	return v9
end
return v_u_6.new()