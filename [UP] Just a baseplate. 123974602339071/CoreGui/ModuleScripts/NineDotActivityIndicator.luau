-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.ComponentHosts.NineDotActivityIndicator
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = require(v1.Packages.Foundation)
local v_u_4 = v3.StatusIndicator
local v_u_5 = v3.Enums.StatusIndicatorVariant
local v_u_6 = v3.View
return function(p7) -- name: NineDotActivityIndicator
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	if not p7.visible or p7.hasNotificationBadge then
		return nil
	end
	local v8 = v_u_2.createElement
	local v9 = v_u_6
	local v10 = {
		["Position"] = nil,
		["tag"] = "anchor-top-left auto-xy padding-xxsmall radius-circle bg-surface-0",
		["testId"] = "nine-dot-activity-indicator",
		["Position"] = p7.position
	}
	local v11 = {
		["Indicator"] = v_u_2.createElement(v_u_4, {
			["variant"] = v_u_5.Emphasis
		})
	}
	return v8(v9, v10, v11)
end