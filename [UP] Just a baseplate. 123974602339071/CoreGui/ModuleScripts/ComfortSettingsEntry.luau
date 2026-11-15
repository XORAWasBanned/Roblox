-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.ComfortSettingsEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = UserSettings().GameSettings
local v_u_3 = require(v1.Packages.LuauPolyfill)
local v4 = require(v1.Packages.InGameMenuDependencies)
local v_u_5 = require(v1.Packages.Roact)
local v6 = v4.t
local v_u_7 = v4.UIBlox.App.Control.SegmentedControl
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v8.Components.ThemedTextLabel)
local v_u_10 = v_u_2:GetPropertyChangedSignal("VRComfortSetting")
local v_u_11 = require(v8.Utility.ExternalEventConnection)
local v_u_12 = require(v8.Localization.withLocalization)
local v_u_13 = require(v8.Utility.SendAnalytics)
local v_u_14 = require(v8.Resources.Constants)
local v_u_15 = {
	["Description"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingsDescription",
	["Enum.VRComfortSetting.Comfort"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingComfort",
	["Enum.VRComfortSetting.Normal"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingNormal",
	["Enum.VRComfortSetting.Expert"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingExpert",
	["Enum.VRComfortSetting.Custom"] = "CoreScripts.InGameMenu.GameSettings.ComfortSettingCustom"
}
local v_u_16 = Enum.VRComfortSetting:GetEnumItems()
local v17 = v_u_5.PureComponent:extend("ComfortSettingsEntry")
v17.validateProps = v6.strictInterface({
	["LayoutOrder"] = v6.optional(v6.integer)
})
function v17.init(p18) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_16
	local v19 = {}
	local v20 = v_u_2.VRComfortSetting
	v19.selectedMode = v_u_3.Array.indexOf(v_u_16, v20)
	p18:setState(v19)
end
function v17.render(p_u_21) -- name: render
	-- upvalues: (copy) v_u_12, (copy) v_u_15, (copy) v_u_5, (copy) v_u_11, (copy) v_u_10, (copy) v_u_2, (copy) v_u_3, (copy) v_u_16, (copy) v_u_9, (copy) v_u_7, (copy) v_u_13, (copy) v_u_14
	return v_u_12(v_u_15)(function(p_u_22)
		-- upvalues: (ref) v_u_5, (ref) v_u_11, (ref) v_u_10, (copy) p_u_21, (ref) v_u_2, (ref) v_u_3, (ref) v_u_16, (ref) v_u_9, (ref) v_u_7, (ref) v_u_13, (ref) v_u_14
		local v23 = v_u_5.createFragment
		local v24 = {}
		local v28 = {
			["event"] = v_u_10,
			["callback"] = function() -- name: callback
				-- upvalues: (ref) p_u_21, (ref) v_u_2, (ref) v_u_3, (ref) v_u_16
				local v25 = p_u_21
				local v26 = {}
				local v27 = v_u_2.VRComfortSetting
				v26.selectedMode = v_u_3.Array.indexOf(v_u_16, v27)
				v25:setState(v26)
			end
		}
		v24.VRComfortSettingListener = v_u_5.createElement(v_u_11, v28)
		local v29 = v_u_5.createElement
		local v30 = {
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["ZIndex"] = 2,
			["Size"] = UDim2.new(1, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["LayoutOrder"] = p_u_21.props.LayoutOrder
		}
		local v31 = {
			["Padding"] = v_u_5.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 24),
				["PaddingRight"] = UDim.new(0, 24),
				["PaddingBottom"] = UDim.new(0, 15),
				["PaddingTop"] = UDim.new(0, 15)
			}),
			["ListLayout"] = v_u_5.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 20)
			}),
			["InputDescription"] = v_u_5.createElement(v_u_9, {
				["themeKey"] = "TextDefault",
				["fontKey"] = "CaptionHeader",
				["Text"] = nil,
				["Size"] = nil,
				["AutomaticSize"] = nil,
				["TextWrapped"] = true,
				["LayoutOrder"] = 1,
				["TextXAlignment"] = nil,
				["Text"] = p_u_22.Description,
				["Size"] = UDim2.new(0.9, 0, 0, 0),
				["AutomaticSize"] = Enum.AutomaticSize.Y,
				["TextXAlignment"] = Enum.TextXAlignment.Left
			})
		}
		local v32 = v_u_5.createElement
		local v33 = {
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.new(1, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}
		local v37 = {
			["SegmentedControl"] = v_u_5.createElement(v_u_7, {
				["width"] = UDim.new(1, 0),
				["selectedTabIndex"] = p_u_21.state.selectedMode,
				["onTabActivated"] = function(p34) -- name: onTabActivated
					-- upvalues: (ref) v_u_16, (ref) v_u_2, (ref) v_u_13, (ref) v_u_14
					local v35 = v_u_16[p34]
					v_u_2.VRComfortSetting = v35
					v_u_13(v_u_14.AnalyticsSettingsChangeName, v_u_14.AnalyticsSettingsVRComfortSettingChangeName, {
						["mode"] = tostring(v35)
					})
				end,
				["tabs"] = v_u_3.Array.map(v_u_16, function(p36, _)
					-- upvalues: (copy) p_u_22
					return {
						["tabName"] = p_u_22[tostring(p36)]
					}
				end)
			})
		}
		v31.Frame = v32("Frame", v33, v37)
		v24.ComfortSettingEntrySelector = v29("Frame", v30, v31)
		return v23(v24)
	end)
end
return v17