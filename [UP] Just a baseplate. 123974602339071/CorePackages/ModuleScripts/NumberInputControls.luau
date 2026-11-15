-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.NumberInput.NumberInputControls
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = require(v2.ReactIs)
local v_u_6 = require(v1.Providers.Style.useTokens)
local v7 = v1.Components
local v_u_8 = require(v1.Constants)
local v_u_9 = require(v7.Icon)
require(v1.Components.Types)
local v_u_10 = require(v7.View)
local v_u_11 = require(v1.Utility.blendTransparencies)
local v_u_12 = require(v1.Utility.mapBindable)
local v_u_13 = require(v7.NumberInput.useNumberInputVariants)
require(v1.Enums.InputSize)
require(v1.Enums.IconSize)
require(v1.Enums.InputVariant)
require(v1.Enums.NumberInputControlsVariant)
local v_u_14 = require(v1.Enums.StateLayerAffordance)
local function v_u_29(p_u_15) -- name: IncrementButton
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (copy) v_u_12, (copy) v_u_14, (copy) v_u_9, (copy) v_u_11, (copy) v_u_8
	local v_u_16 = v_u_6()
	local v17 = v_u_4.useMemo(function()
		-- upvalues: (copy) p_u_15, (copy) v_u_16
		return {
			["radius"] = UDim.new(0, p_u_15.radius),
			["offset"] = v_u_16.Size.Size_150,
			["borderWidth"] = v_u_16.Stroke.Thicker
		}
	end, { p_u_15.radius, v_u_16.Size.Size_150, v_u_16.Stroke.Thicker })
	local v18 = v_u_4.createElement
	local v19 = v_u_10
	local v20 = {
		["onActivated"] = p_u_15.onActivated
	}
	local v21
	if v_u_5.isBinding(p_u_15.isDisabled) then
		v21 = false
	else
		v21 = p_u_15.isDisabled
	end
	v20.isDisabled = v21
	v20.selection = {
		["Selectable"] = v_u_12(p_u_15.isDisabled, function(p22)
			return not p22
		end)
	}
	v20.stateLayer = {
		["affordance"] = v_u_12(p_u_15.isDisabled, function(p23)
			-- upvalues: (ref) v_u_14
			if p23 then
				return v_u_14.None
			else
				return v_u_14.Background
			end
		end)
	}
	v20.cursor = v17
	v20.cornerRadius = UDim.new(0, p_u_15.radius)
	v20.Size = UDim2.fromOffset(p_u_15.size, p_u_15.size)
	v20.LayoutOrder = p_u_15.LayoutOrder
	v20.testId = p_u_15.testId
	local v24 = {}
	local v25
	if p_u_15.hasDivider then
		v25 = v_u_4.createElement(v_u_10, {
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.fromScale(0, 0.5),
			["Size"] = UDim2.new(0, v_u_16.Stroke.Standard, 1, 0),
			["backgroundStyle"] = v_u_16.Color.Stroke.Default,
			["testId"] = ("%*--divider"):format(p_u_15.testId)
		})
	else
		v25 = nil
	end
	v24.Divider = v25
	v24.Icon = v_u_4.createElement(v_u_9, {
		["name"] = p_u_15.icon,
		["size"] = p_u_15.iconSize,
		["style"] = v_u_12(p_u_15.isDisabled, function(p26)
			-- upvalues: (copy) v_u_16, (ref) v_u_11, (ref) v_u_8
			local v27 = {
				["Color3"] = v_u_16.Color.ActionUtility.Foreground.Color3
			}
			local v28
			if p26 then
				v28 = v_u_11(v_u_16.Color.ActionUtility.Foreground.Transparency, v_u_8.DISABLED_TRANSPARENCY)
			else
				v28 = v_u_16.Color.ActionUtility.Foreground.Transparency
			end
			v27.Transparency = v28
			return v27
		end),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["testId"] = ("%*--icon"):format(p_u_15.testId)
	})
	return v18(v19, v20, v24)
end
local function v_u_36(p30) -- name: IncrementControls
	-- upvalues: (copy) v_u_6, (copy) v_u_13, (copy) v_u_4, (copy) v_u_10, (copy) v_u_29, (copy) v_u_3
	local v31 = v_u_13(v_u_6(), p30.size).controls
	local v32 = v_u_4.createElement
	local v33 = v_u_10
	local v34 = {
		["tag"] = nil,
		["Size"] = nil,
		["LayoutOrder"] = 1,
		["testId"] = nil,
		["tag"] = v31.tag,
		["Size"] = UDim2.fromOffset(v31.width, v31.buttonSize),
		["testId"] = ("%*--increment-buttons"):format(p30.testId)
	}
	local v35 = {
		["ControlDecrement"] = v_u_4.createElement(v_u_29, {
			["icon"] = nil,
			["iconSize"] = nil,
			["isDisabled"] = nil,
			["onActivated"] = nil,
			["radius"] = nil,
			["size"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["icon"] = v_u_3.Icon.MinusSmall,
			["iconSize"] = v31.iconSize,
			["isDisabled"] = p30.decrement.isDisabled,
			["onActivated"] = p30.decrement.onClick,
			["radius"] = v31.radius,
			["size"] = v31.buttonSize,
			["testId"] = ("%*--decrement"):format(p30.testId)
		}),
		["ControlIncrement"] = v_u_4.createElement(v_u_29, {
			["icon"] = nil,
			["iconSize"] = nil,
			["hasDivider"] = nil,
			["isDisabled"] = nil,
			["onActivated"] = nil,
			["radius"] = nil,
			["size"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["icon"] = v_u_3.Icon.PlusSmall,
			["iconSize"] = v31.iconSize,
			["hasDivider"] = p30.hasDivider,
			["isDisabled"] = p30.increment.isDisabled,
			["onActivated"] = p30.increment.onClick,
			["radius"] = v31.radius,
			["size"] = v31.buttonSize,
			["testId"] = ("%*--increment"):format(p30.testId)
		})
	}
	return v32(v33, v34, v35)
end
return function(p37) -- name: NumberInputControls
	-- upvalues: (copy) v_u_4, (copy) v_u_36
	return v_u_4.createElement(v_u_36, p37)
end