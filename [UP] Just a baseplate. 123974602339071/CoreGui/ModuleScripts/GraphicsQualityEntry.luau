-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.GraphicsQualityEntry
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v_u_5 = UserSettings():GetService("UserGameSettings")
local v_u_6 = settings().Rendering
local v_u_7 = v_u_5:GetPropertyChangedSignal("SavedQualityLevel")
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(script.Parent.ToggleEntry)
local v_u_10 = require(v8.Utility.ExternalEventConnection)
local v_u_11 = require(script.Parent.SliderEntry)
local v_u_12 = require(v8.Utility.SendAnalytics)
local v_u_13 = require(v8.Resources.Constants)
local v_u_14 = #Enum.SavedQualitySetting:GetEnumItems() - 1
local v15 = v_u_3.PureComponent:extend("GraphicsQualityEntry")
v15.validateProps = v4.strictInterface({
	["LayoutOrder"] = v4.integer,
	["canCaptureFocus"] = v4.optional(v4.boolean),
	["isMenuOpen"] = v4.optional(v4.boolean)
})
function v15.init(p_u_16) -- name: init
	-- upvalues: (copy) v_u_5
	local v17 = v_u_5.SavedQualityLevel == Enum.SavedQualitySetting.Automatic
	p_u_16:setState({
		["quality"] = v17 and 5 or v_u_5.SavedQualityLevel.Value,
		["automatic"] = v17
	})
	function p_u_16.onQualityChanged()
		-- upvalues: (ref) v_u_5, (copy) p_u_16
		local v18 = v_u_5.SavedQualityLevel
		local v19 = p_u_16
		local v20 = {}
		local v21
		if v18 == Enum.SavedQualitySetting.Automatic then
			v21 = nil
		else
			v21 = v18.Value or nil
		end
		v20.quality = v21
		v20.automatic = v18 == Enum.SavedQualitySetting.Automatic
		v19:setState(v20)
	end
	if v17 then
		p_u_16:setAutomaticQualityLevel()
	else
		p_u_16:setManualQualityLevel(p_u_16.state.quality)
	end
end
function v15.setAutomaticQualityLevel(_) -- name: setAutomaticQualityLevel
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	v_u_5.SavedQualityLevel = Enum.SavedQualitySetting.Automatic
	v_u_6.QualityLevel = 0
end
function v15.setManualQualityLevel(_, p22) -- name: setManualQualityLevel
	-- upvalues: (copy) v_u_14, (copy) v_u_6, (copy) v_u_5
	local v23 = v_u_14
	local v24 = v_u_6:GetMaxQualityLevel() - 1
	local v25 = 1 + (p22 - 1) * (v24 - 1) / (v23 - 1)
	local v26 = math.floor(v25)
	local v27 = math.clamp(v26, 1, v24)
	v_u_5.SavedQualityLevel = p22
	v_u_6.QualityLevel = v27
	return nil
end
function v15.render(p_u_28) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_12, (copy) v_u_13, (copy) v_u_11, (copy) v_u_10, (copy) v_u_7
	local v29 = v_u_3.createElement
	local v30 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 156),
		["LayoutOrder"] = p_u_28.props.LayoutOrder
	}
	local v32 = {
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["AutoToggle"] = v_u_3.createElement(v_u_9, {
			["LayoutOrder"] = 1,
			["labelKey"] = "CoreScripts.InGameMenu.GameSettings.AutoGraphicsQuality",
			["checked"] = nil,
			["onToggled"] = nil,
			["checked"] = p_u_28.state.automatic,
			["onToggled"] = function() -- name: onToggled
				-- upvalues: (copy) p_u_28, (ref) v_u_12, (ref) v_u_13
				if p_u_28.state.automatic then
					p_u_28:setManualQualityLevel(p_u_28.state.quality)
				else
					p_u_28:setAutomaticQualityLevel()
				end
				v_u_12(v_u_13.AnalyticsSettingsChangeName, nil, {}, true)
			end
		}),
		["Slider"] = v_u_3.createElement(v_u_11, {
			["LayoutOrder"] = 2,
			["labelKey"] = "CoreScripts.InGameMenu.GameSettings.ManualGraphicsQuality",
			["min"] = 1,
			["max"] = 10,
			["stepInterval"] = 1,
			["value"] = nil,
			["disabled"] = nil,
			["valueChanged"] = nil,
			["canCaptureFocus"] = nil,
			["isMenuOpen"] = nil,
			["value"] = p_u_28.state.quality,
			["disabled"] = p_u_28.state.automatic,
			["valueChanged"] = function(p31) -- name: valueChanged
				-- upvalues: (copy) p_u_28, (ref) v_u_12, (ref) v_u_13
				p_u_28:setManualQualityLevel(p31)
				v_u_12(v_u_13.AnalyticsSettingsChangeName, nil, {}, true)
			end,
			["canCaptureFocus"] = p_u_28.props.canCaptureFocus,
			["isMenuOpen"] = p_u_28.props.isMenuOpen
		}),
		["QualityListener"] = v_u_3.createElement(v_u_10, {
			["event"] = v_u_7,
			["callback"] = p_u_28.onQualityChanged
		})
	}
	return v29("Frame", v30, v32)
end
return v15