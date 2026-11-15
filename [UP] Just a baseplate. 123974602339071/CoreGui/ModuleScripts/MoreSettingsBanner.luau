-- Path: CoreGui.RobloxGui.Modules.Settings.Components.MoreSettingsBanner
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = require(v1.Packages.Foundation)
local v4 = require(v1.Workspace.Packages.Localization)
local v5 = script.Parent.Parent
local v_u_6 = require(v5.shouldShowMoreSettingsBanner)
local v_u_7 = v4.Hooks.useLocalization
local v_u_8 = v3.Hooks.useTokens
local v_u_9 = v3.Icon
local v_u_10 = v3.Enums.IconName
local v_u_11 = v3.Enums.IconSize
local v_u_12 = v3.Text
local v_u_13 = v3.View
return function(p14) -- name: MoreSettingsBanner
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6, (copy) v_u_13, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12
	local v_u_15 = p14.isPioneerLaunch
	local v_u_16 = p14.getAvailability
	local v17, v_u_18 = v_u_2.useState(false)
	local v19 = v_u_7({
		["text"] = "CoreScripts.InGameMenu.GameSettings.MoreSettingsAvailable"
	})
	local v20 = v_u_8()
	v_u_2.useEffect(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_15, (copy) v_u_16, (copy) v_u_18
		local v_u_21 = false
		task.spawn(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_15, (ref) v_u_16, (ref) v_u_21, (ref) v_u_18
			if not v_u_21 and v_u_6(v_u_15, v_u_16) then
				v_u_18(true)
			end
		end)
		return function()
			-- upvalues: (ref) v_u_21
			v_u_21 = true
		end
	end, { v_u_15, v_u_16 })
	if not v17 or v19.text == "" then
		return nil
	end
	local v22 = v_u_2.createElement
	local v23 = v_u_13
	local v24 = {
		["tag"] = "size-full-0 auto-y",
		["padding"] = nil,
		["padding"] = {
			["left"] = UDim.new(0, 10),
			["right"] = UDim.new(0, 10),
			["bottom"] = UDim.new(0, v20.Padding.Large)
		}
	}
	local v25 = {}
	local v26 = v_u_2.createElement
	local v27 = v_u_13
	local v28 = {
		["Icon"] = v_u_2.createElement(v_u_9, {
			["LayoutOrder"] = 1,
			["name"] = nil,
			["size"] = nil,
			["name"] = v_u_10.CircleI,
			["size"] = v_u_11.Small
		}),
		["Label"] = v_u_2.createElement(v_u_12, {
			["LayoutOrder"] = 2,
			["Text"] = nil,
			["tag"] = "fill auto-y text-body-medium text-wrap text-align-x-left content-default",
			["testId"] = "MoreSettingsAvailableText",
			["Text"] = v19.text
		})
	}
	v25.Banner = v26(v27, {
		["tag"] = "row align-y-center gap-small size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium",
		["testId"] = "MoreSettingsBanner"
	}, v28)
	return v22(v23, v24, v25)
end