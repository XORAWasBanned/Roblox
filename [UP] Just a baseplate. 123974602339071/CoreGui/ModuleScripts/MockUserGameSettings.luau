-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Mocks.MockUserGameSettings
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new() -- name: new
	-- upvalues: (copy) v_u_1
	local v_u_2 = Instance.new("BindableEvent")
	local v4 = {
		["FullscreenChanged"] = {
			["Connect"] = function(_, p3) -- name: Connect
				-- upvalues: (copy) v_u_2
				return v_u_2.Event:Connect(p3)
			end,
			["GoFullscreen"] = function() -- name: GoFullscreen
				-- upvalues: (copy) v_u_2
				v_u_2:Fire(true)
			end
		}
	}
	local v5 = {
		["__index"] = v_u_1
	}
	setmetatable(v4, v5)
	return v4
end
function v_u_1.InFullScreen(_) -- name: InFullScreen
	return false
end
return v_u_1