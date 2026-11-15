-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.FtuxTooltipAnchor
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.React)
local v4 = require(v1.Packages.UIBlox)
local v_u_5 = v4.App.Dialog.TooltipV2.withTooltip
local v_u_6 = v4.App.Dialog.Enum.TooltipOrientation
return v_u_3.forwardRef(function(p7, p8)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_6, (copy) v_u_3
	return v_u_5({
		["ref"] = p8,
		["headerText"] = p7.headerText,
		["bodyText"] = p7.bodyText
	}, {
		["DisplayOrder"] = 10,
		["active"] = nil,
		["guiTarget"] = nil,
		["preferredOrientation"] = nil,
		["active"] = p7.shouldShowTooltip,
		["guiTarget"] = v_u_2,
		["preferredOrientation"] = v_u_6.Bottom
	}, function(p9)
		-- upvalues: (ref) v_u_3
		return v_u_3.createElement("Frame", {
			["Size"] = UDim2.new(1, 0, 1, 0),
			["BackgroundTransparency"] = 1,
			[v_u_3.Change.AbsoluteSize] = p9,
			[v_u_3.Change.AbsolutePosition] = p9
		})
	end)
end)