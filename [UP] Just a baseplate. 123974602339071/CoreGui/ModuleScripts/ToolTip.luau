-- Path: CoreGui.RobloxGui.Modules.FTUX.Components.Tooltips.ToolTip
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v_u_3 = v2.App.Dialog.Enum.TooltipOrientation
local v_u_4 = v2.App.Dialog.TooltipV2.withTooltip
local v_u_5 = require(v1.Packages.React)
return function(p6) -- name: Tooltip
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
	local v_u_7 = p6.controllerPart
	local v8 = v_u_7:WaitForChild("BillboardGui")
	return v_u_4({
		["bodyText"] = p6.tooltipText
	}, {
		["preferredOrientation"] = nil,
		["guiTarget"] = nil,
		["DisplayOrder"] = 0,
		["triggerPointName"] = "TriggerPart",
		["active"] = true,
		["DEBUG_useTargetDirectly"] = true,
		["preferredOrientation"] = v_u_3.Bottom,
		["guiTarget"] = v8
	}, function(p9)
		-- upvalues: (ref) v_u_5, (copy) v_u_7
		local v10 = v_u_5.createElement
		local v11 = {
			["Parent"] = nil,
			["Adornee"] = nil,
			["AlwaysOnTop"] = true,
			["Active"] = false,
			["Size"] = nil,
			["Parent"] = v_u_7,
			["Adornee"] = v_u_7,
			["Size"] = UDim2.new(0.5, 0, 0.5, 0)
		}
		local v12 = {
			["TriggerBody"] = v_u_5.createElement("Frame", {
				["Transparency"] = 1,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = UDim2.new(0.49, 0, 1.02, 0),
				[v_u_5.Change.AbsoluteSize] = p9,
				[v_u_5.Change.AbsolutePosition] = p9
			})
		}
		return v10("BillboardGui", v11, v12)
	end)
end