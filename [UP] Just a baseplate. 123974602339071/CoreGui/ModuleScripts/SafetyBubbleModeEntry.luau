-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.SafetyBubbleModeEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = UserSettings().GameSettings
local v_u_3 = require(v1.Packages.LuauPolyfill)
local v4 = require(v1.Packages.InGameMenuDependencies)
local v_u_5 = require(v1.Packages.Roact)
local v6 = v4.t
local v7 = v4.UIBlox
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v8.Components.ThemedTextLabel)
local v_u_10 = v_u_2:GetPropertyChangedSignal("VRSafetyBubbleMode")
local v_u_11 = require(v8.Utility.ExternalEventConnection)
local v_u_12 = require(script.Parent.InputLabel)
local v_u_13 = v7.App.InputButton.RadioButtonList
local v_u_14 = require(v8.Localization.withLocalization)
local v_u_15 = require(v8.Utility.SendAnalytics)
local v_u_16 = require(v8.Resources.Constants)
local v_u_17 = require(v8.Flags.FFlagFixSafetyBubbleWidth)()
local v_u_18 = {
	["Title"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeTitle",
	["Description"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeDescription",
	["Enum.VRSafetyBubbleMode.NoOne"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeNoOne",
	["Enum.VRSafetyBubbleMode.OnlyFriends"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeOnlyFriends",
	["Enum.VRSafetyBubbleMode.Anyone"] = "CoreScripts.InGameMenu.GameSettings.SafetyBubbleModeAnyone"
}
local v_u_19 = Enum.VRSafetyBubbleMode:GetEnumItems()
local v20 = v_u_5.PureComponent:extend("SafetyBubbleModeEntry")
v20.validateProps = v6.strictInterface({
	["LayoutOrder"] = v6.optional(v6.integer)
})
function v20.init(p21) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_19
	local v22 = {}
	local v23 = v_u_2.VRSafetyBubbleMode
	v22.selectedMode = v_u_3.Array.indexOf(v_u_19, v23)
	p21:setState(v22)
end
function v20.render(p_u_24) -- name: render
	-- upvalues: (copy) v_u_14, (copy) v_u_18, (copy) v_u_5, (copy) v_u_11, (copy) v_u_10, (copy) v_u_2, (copy) v_u_3, (copy) v_u_19, (copy) v_u_12, (copy) v_u_9, (copy) v_u_13, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17
	return v_u_14(v_u_18)(function(p_u_25)
		-- upvalues: (ref) v_u_5, (ref) v_u_11, (ref) v_u_10, (copy) p_u_24, (ref) v_u_2, (ref) v_u_3, (ref) v_u_19, (ref) v_u_12, (ref) v_u_18, (ref) v_u_9, (ref) v_u_13, (ref) v_u_15, (ref) v_u_16, (ref) v_u_17
		local v26 = v_u_5.createFragment
		local v27 = {}
		local v31 = {
			["event"] = v_u_10,
			["callback"] = function() -- name: callback
				-- upvalues: (ref) p_u_24, (ref) v_u_2, (ref) v_u_3, (ref) v_u_19
				local v28 = p_u_24
				local v29 = {}
				local v30 = v_u_2.VRSafetyBubbleMode
				v29.selectedMode = v_u_3.Array.indexOf(v_u_19, v30)
				v28:setState(v29)
			end
		}
		v27.VRSafetyBubbleModeListener = v_u_5.createElement(v_u_11, v31)
		local v32 = v_u_5.createElement
		local v33 = "Frame"
		local v34 = {
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["ZIndex"] = 2,
			["Size"] = UDim2.new(1, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["LayoutOrder"] = p_u_24.props.LayoutOrder
		}
		local v35 = {
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
			["InputLabel"] = v_u_5.createElement(v_u_12, {
				["localizationKey"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["LayoutOrder"] = 1,
				["localizationKey"] = v_u_18.Title,
				["Size"] = UDim2.new(1, 0, 0, 0),
				["Position"] = UDim2.new(0, 0, 0, 0),
				["AnchorPoint"] = Vector2.new(0, 0)
			}),
			["InputDescription"] = v_u_5.createElement(v_u_9, {
				["themeKey"] = "TextDefault",
				["fontKey"] = "CaptionHeader",
				["Text"] = nil,
				["Size"] = nil,
				["AutomaticSize"] = nil,
				["TextWrapped"] = true,
				["LayoutOrder"] = 2,
				["TextXAlignment"] = nil,
				["Text"] = p_u_25.Description,
				["Size"] = UDim2.new(0.9, 0, 0, 0),
				["AutomaticSize"] = Enum.AutomaticSize.Y,
				["TextXAlignment"] = Enum.TextXAlignment.Left
			})
		}
		local v36 = v_u_5.createElement
		local v37 = v_u_13
		local v41 = {
			["layoutOrder"] = 3,
			["radioButtons"] = nil,
			["onActivated"] = nil,
			["currentValue"] = nil,
			["automaticSize"] = true,
			["padding"] = nil,
			["elementSize"] = nil,
			["radioButtons"] = v_u_3.Array.map(v_u_19, function(p38, _)
				-- upvalues: (copy) p_u_25
				return {
					["label"] = p_u_25[tostring(p38)]
				}
			end),
			["onActivated"] = function(p39) -- name: onActivated
				-- upvalues: (ref) v_u_19, (ref) v_u_2, (ref) v_u_15, (ref) v_u_16
				local v40 = v_u_19[p39]
				v_u_2.VRSafetyBubbleMode = v40
				v_u_15(v_u_16.AnalyticsSettingsChangeName, v_u_16.AnalyticsSettingsSafetyBubbleModeChangeName, {
					["mode"] = tostring(v40)
				})
			end,
			["currentValue"] = p_u_24.state.selectedMode,
			["padding"] = UDim.new(0, 20)
		}
		local v42
		if v_u_17 then
			v42 = UDim2.new(1, 0, 0, 20)
		else
			v42 = UDim2.new(0, 0, 0, 20)
		end
		v41.elementSize = v42
		v35.RadioList = v36(v37, v41)
		v27.SafetyBubbleModeEntrySelector = v32(v33, v34, v35)
		return v26(v27)
	end)
end
return v20