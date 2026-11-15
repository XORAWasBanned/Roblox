-- Path: CoreGui.RobloxGui.Modules.Settings.Components.renderSettingsHeader
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.ReactRoblox)
local v4 = require(v1.Packages.Foundation)
local v5 = require(v1.Workspace.Packages.Localization)
local v6 = require(v1.Workspace.Packages.SettingReactView)
local v7 = require(v1.Workspace.Packages.CoreScriptsCommon)
local v8 = script.Parent.Parent
local v_u_9 = require(v8.InExperienceMenuReact)
local v_u_10 = require(v1.Workspace.Packages.AppCommonLib).Create
local v_u_11 = v5.Hooks.useLocalization
local v_u_12 = v6.HeaderText
local v_u_13 = v7.SettingsShowSignal
local v_u_14 = v4.View
local v_u_15 = v4.Hooks.useTokens
local function v_u_23(p16) -- name: HeaderTextContainer
	-- upvalues: (copy) v_u_11, (copy) v_u_15, (copy) v_u_2, (copy) v_u_14, (copy) v_u_12
	local v17 = v_u_11({
		["headerText"] = p16.text
	})
	local v18 = v_u_15()
	local v19 = v_u_2.createElement
	local v20 = v_u_14
	local v21 = {
		["tag"] = "auto-xy",
		["padding"] = nil,
		["padding"] = {
			["left"] = UDim.new(0, 10),
			["bottom"] = UDim.new(0, v18.Padding.Small)
		}
	}
	local v22 = {
		["Text"] = v_u_2.createElement(v_u_12, {
			["text"] = v17.headerText
		})
	}
	return v19(v20, v21, v22)
end
return function(p_u_24) -- name: renderSettingsHeader
	-- upvalues: (copy) v_u_10, (copy) v_u_13, (copy) v_u_3, (copy) v_u_2, (copy) v_u_9, (copy) v_u_23
	local v_u_25 = v_u_10("Frame")({
		["Name"] = "HeaderWrapper",
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = nil,
		["LayoutOrder"] = nil,
		["Parent"] = nil,
		["Size"] = UDim2.fromScale(1, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = p_u_24.layoutOrder,
		["Parent"] = p_u_24.parent
	})
	local v_u_26 = nil
	v_u_13:connect(function(p27)
		-- upvalues: (ref) v_u_26, (copy) v_u_25, (copy) p_u_24, (ref) v_u_3, (ref) v_u_2, (ref) v_u_9, (ref) v_u_23
		if p27 then
			v_u_25.Parent = p_u_24.parent
			v_u_26 = v_u_3.createRoot(v_u_25)
			local v28 = v_u_26
			local v29 = v_u_2.createElement
			local v30 = v_u_9
			local v31 = {
				["HeaderTextContainer"] = v_u_2.createElement(v_u_23, {
					["text"] = p_u_24.headerText
				})
			}
			v28:render(v29(v30, nil, v31))
		elseif v_u_26 then
			v_u_26:unmount()
			v_u_26 = nil
			v_u_25.Parent = nil
		end
	end)
	return v_u_25
end