-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Components.Divider
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Packages.Cryo)
local v_u_5 = v2.Core.Style.withStyle
return function(p_u_6) -- name: Divider
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	return v_u_5(function(p7)
		-- upvalues: (ref) v_u_3, (ref) v_u_4, (copy) p_u_6
		return v_u_3.createElement("Frame", v_u_4.Dictionary.join({
			["Size"] = UDim2.new(1, 0, 0, 1)
		}, p_u_6, {
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BackgroundColor3"] = p7.Theme.Divider.Color,
			["BackgroundTransparency"] = p7.Theme.Divider.Transparency
		}))
	end)
end