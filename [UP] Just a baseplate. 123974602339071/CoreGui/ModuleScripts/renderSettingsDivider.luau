-- Path: CoreGui.RobloxGui.Modules.Settings.Components.renderSettingsDivider
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.ReactRoblox)
local v4 = require(v1.Packages.Foundation)
local v5 = require(v1.Workspace.Packages.CoreScriptsCommon)
local v6 = script.Parent.Parent
local v_u_7 = require(v6.InExperienceMenuReact)
local v_u_8 = require(v1.Workspace.Packages.AppCommonLib).Create
local v_u_9 = v5.SettingsShowSignal
local v_u_10 = v4.View
local v_u_11 = v4.Divider
local v_u_12 = v4.Enums.DividerOrientation
local v_u_13 = v4.Hooks.useTokens
local function v_u_19() -- name: DividerContainer
	-- upvalues: (copy) v_u_13, (copy) v_u_2, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12
	local v14 = v_u_13()
	local v15 = v_u_2.createElement
	local v16 = v_u_10
	local v17 = {
		["tag"] = "auto-xy",
		["padding"] = nil,
		["padding"] = {
			["left"] = UDim.new(0, 10),
			["top"] = UDim.new(0, v14.Padding.XSmall),
			["bottom"] = UDim.new(0, v14.Padding.Large)
		}
	}
	local v18 = {
		["Divider"] = v_u_2.createElement(v_u_11, {
			["orientation"] = v_u_12.Horizontal
		})
	}
	return v15(v16, v17, v18)
end
return function(p_u_20) -- name: renderSettingsDivider
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_3, (copy) v_u_2, (copy) v_u_7, (copy) v_u_19
	local v_u_21 = v_u_8("Frame")({
		["Name"] = "DividerWrapper",
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = nil,
		["LayoutOrder"] = nil,
		["Parent"] = nil,
		["Size"] = UDim2.fromScale(1, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = p_u_20.layoutOrder,
		["Parent"] = p_u_20.parent
	})
	local v_u_22 = nil
	v_u_9:connect(function(p23)
		-- upvalues: (ref) v_u_22, (copy) v_u_21, (copy) p_u_20, (ref) v_u_3, (ref) v_u_2, (ref) v_u_7, (ref) v_u_19
		if p23 then
			v_u_21.Parent = p_u_20.parent
			v_u_22 = v_u_3.createRoot(v_u_21)
			v_u_22:render(v_u_2.createElement(v_u_7, nil, {
				["DividerContainer"] = v_u_2.createElement(v_u_19)
			}))
		elseif v_u_22 then
			v_u_22:unmount()
			v_u_22 = nil
			v_u_21.Parent = nil
		end
	end)
	return v_u_21
end