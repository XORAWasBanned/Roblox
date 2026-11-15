-- Path: CoreGui.RobloxGui.Modules.Settings.Components.renderMoreSettingsBanner
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.ReactRoblox)
local v4 = require(v1.Workspace.Packages.CoreScriptsCommon)
local v5 = script.Parent.Parent
local v_u_6 = require(v5.InExperienceMenuReact)
local v_u_7 = require(script.Parent.MoreSettingsBanner)
local v_u_8 = require(v1.Workspace.Packages.AppCommonLib).Create
local v_u_9 = require(v1.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v_u_10 = v4.SettingsShowSignal
return function(p_u_11) -- name: renderMoreSettingsBanner
	-- upvalues: (copy) v_u_9, (copy) v_u_8, (copy) v_u_10, (copy) v_u_3, (copy) v_u_2, (copy) v_u_6, (copy) v_u_7
	if not (p_u_11.isPioneerLaunch or v_u_9)() then
		return nil
	end
	local v_u_12 = v_u_8("Frame")({
		["Name"] = "MoreSettingsBannerWrapper",
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = nil,
		["LayoutOrder"] = nil,
		["Parent"] = nil,
		["Size"] = UDim2.fromScale(1, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = p_u_11.layoutOrder,
		["Parent"] = p_u_11.parent
	})
	local v_u_13 = nil
	v_u_10:connect(function(p14)
		-- upvalues: (ref) v_u_13, (copy) v_u_12, (copy) p_u_11, (ref) v_u_3, (ref) v_u_2, (ref) v_u_6, (ref) v_u_7
		if p14 then
			v_u_12.Parent = p_u_11.parent
			v_u_13 = v_u_3.createRoot(v_u_12)
			v_u_13:render(v_u_2.createElement(v_u_6, nil, {
				["MoreSettingsBanner"] = v_u_2.createElement(v_u_7)
			}))
		elseif v_u_13 then
			v_u_13:unmount()
			v_u_13 = nil
			v_u_12.Parent = nil
		end
	end)
	return v_u_12
end