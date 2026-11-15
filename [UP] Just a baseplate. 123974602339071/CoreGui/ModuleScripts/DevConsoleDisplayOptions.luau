-- Path: CoreGui.RobloxGui.Modules.DevConsole.Reducers.DevConsoleDisplayOptions
local v_u_1 = require(script.Parent.Parent.Immutable)
local v_u_2 = require(script.Parent.Parent.Constants)
local v_u_3 = require(script.Parent.Parent.Actions.SetDevConsoleVisibility)
local v_u_4 = require(script.Parent.Parent.Actions.SetDevConsoleMinimized)
local v_u_5 = require(script.Parent.Parent.Actions.ChangeDevConsoleSize)
local v_u_6 = require(script.Parent.Parent.Actions.SetDevConsolePosition)
local v_u_7 = require(script.Parent.Parent.Actions.SetActiveTab)
return function(p8, p9)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_1, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7
	local v10 = p8 or {
		["formFactor"] = nil,
		["isVisible"] = false,
		["isMinimized"] = false,
		["position"] = nil,
		["size"] = nil,
		["visibleStartTime"] = 0,
		["formFactor"] = v_u_2.FormFactor.Large,
		["position"] = v_u_2.MainWindowInit.Position,
		["size"] = v_u_2.MainWindowInit.Size
	}
	if p9.type == v_u_3.name then
		local v11 = {
			["isVisible"] = p9.isVisible
		}
		if v11.isVisible then
			v11.isMinimized = false
			v11.visibleStartTime = tick()
		end
		return v_u_1.JoinDictionaries(v10, v11)
	end
	if p9.type == v_u_6.name then
		return v_u_1.Set(v10, "position", p9.position)
	end
	if p9.type == v_u_4.name then
		return v_u_1.Set(v10, "isMinimized", p9.isMinimized)
	end
	if p9.type == v_u_5.name then
		if v10.formFactor == v_u_2.FormFactor.Large then
			return v_u_1.Set(v10, "size", p9.newSize)
		end
	elseif p9.type == v_u_7.name then
		return v_u_1.Set(v10, "isMinimized", false)
	end
	return v10
end