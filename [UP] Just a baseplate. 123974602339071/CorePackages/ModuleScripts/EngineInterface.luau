-- Path: CorePackages.Packages._Index.FocusNavigation.FocusNavigation.EngineInterface
local v_u_1 = game:GetService("GuiService")
local v2 = game:GetService("UserInputService")
local v3 = script.Parent.Parent
local v_u_4 = require(v3.FocusNavigationUtils).mockableWarn
require(script.Parent.types)
local v5, v6 = pcall(function()
	-- upvalues: (copy) v_u_1
	return v_u_1:GetPropertyChangedSignal("SelectedCoreObject")
end)
local v_u_7, v_u_8 = pcall(function()
	return game:GetService("CoreGui")
end)
return {
	["CoreGui"] = {
		["getSelection"] = function() -- name: getSelection
			-- upvalues: (copy) v_u_1
			return v_u_1.SelectedCoreObject
		end,
		["setSelection"] = function(p9) -- name: setSelection
			-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_4, (copy) v_u_1
			if _G.__DEV__ and (v_u_7 and (p9 ~= nil and not p9:IsDescendantOf(v_u_8))) then
				v_u_4(string.format("Attempting to focus non-CoreGui descendant \'%s\' from a CoreGui FocusNavigationService instance. Consider creating this FocusNavigationService with `FocusNavigation.EnginInterface.PlayerGui` instead", p9:GetFullName()))
			end
			if p9 and not p9.Selectable then
				v_u_1:Select(p9)
			else
				v_u_1.SelectedCoreObject = p9
			end
		end,
		["SelectionChanged"] = not v5 and {
			["Connect"] = function() -- name: Connect
				error("Could not access SelectedCoreObject signal; you may not have the correct permissions")
			end
		} or v6,
		["InputBegan"] = v2.InputBegan,
		["InputChanged"] = v2.InputChanged,
		["InputEnded"] = v2.InputEnded,
		["LastInputTypeChanged"] = v2.LastInputTypeChanged
	},
	["PlayerGui"] = {
		["getSelection"] = function() -- name: getSelection
			-- upvalues: (copy) v_u_1
			return v_u_1.SelectedObject
		end,
		["setSelection"] = function(p10) -- name: setSelection
			-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_4, (copy) v_u_1
			if _G.__DEV__ and (v_u_7 and (p10 ~= nil and p10:IsDescendantOf(v_u_8))) then
				v_u_4(string.format("Attempting to focus CoreGui descendant \'%s\' from a non-CoreGui FocusNavigationService instance.Consider creating this FocusNavigationService with `FocusNavigation.EnginInterface.CoreGui` instead", p10:GetFullName()))
			end
			if p10 and not p10.Selectable then
				v_u_1:Select(p10)
			else
				v_u_1.SelectedObject = p10
			end
		end,
		["SelectionChanged"] = v_u_1:GetPropertyChangedSignal("SelectedObject"),
		["InputBegan"] = v2.InputBegan,
		["InputChanged"] = v2.InputChanged,
		["InputEnded"] = v2.InputEnded,
		["LastInputTypeChanged"] = v2.LastInputTypeChanged
	}
}