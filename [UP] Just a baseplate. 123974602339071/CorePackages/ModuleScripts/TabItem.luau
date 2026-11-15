-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Tabs.TabItem
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.BuilderIcons)
local v_u_5 = require(v1.Components.Icon)
local v_u_6 = require(v1.Components.Image)
local v_u_7 = require(v1.Components.StatusIndicator)
require(v1.Enums.StatusIndicatorShape)
require(v1.Enums.StatusIndicatorVariant)
local v_u_8 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_9 = require(v1.Components.View)
local v_u_10 = require(v1.Providers.Style.useTokens)
local v_u_11 = v_u_4.Migration.uiblox
local v_u_12 = require(v1.Enums.FillBehavior)
require(v1.Enums.InputSize)
local v_u_13 = require(v1.Utility.getIconScale)
local v14 = require(v1.Utility.iconMigrationUtils)
local v_u_15 = v14.isMigrated
local v_u_16 = v14.isBuilderOrMigratedIcon
local v_u_17 = require(v1.Constants)
local v_u_18 = require(script.Parent.useTabItemVariants)
return v_u_3.memo(v_u_3.forwardRef(function(p_u_19, p20) -- name: TabItem
	-- upvalues: (copy) v_u_10, (copy) v_u_12, (copy) v_u_18, (copy) v_u_3, (copy) v_u_4, (copy) v_u_16, (copy) v_u_5, (copy) v_u_15, (copy) v_u_11, (copy) v_u_13, (copy) v_u_6, (copy) v_u_9, (copy) v_u_17, (copy) v_u_8, (copy) v_u_7
	local v_u_21 = v_u_10()
	local v22
	if p_u_19.isActive then
		v22 = v_u_21.Color.Content.Default
	else
		v22 = v_u_21.Color.Content.Emphasis
	end
	local v23 = p_u_19.fillBehavior == v_u_12.Fill
	local v24 = v_u_18(v_u_21, p_u_19.size, v23)
	local v25 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_21
		return {
			["radius"] = nil,
			["offset"] = 0,
			["borderWidth"] = nil,
			["radius"] = UDim.new(0, 0),
			["borderWidth"] = v_u_21.Stroke.Thicker
		}
	end, { v_u_21 })
	local v27 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_19, (ref) v_u_4
		if p_u_19.icon == nil then
			return nil
		end
		local v26 = p_u_19.icon
		return typeof(v26) == "string" and {
			["name"] = p_u_19.icon,
			["variant"] = v_u_4.IconVariant.Regular
		} or p_u_19.icon
	end, { p_u_19.icon })
	local v28 = nil
	if v27 then
		if v_u_16(v27.name) then
			local v29 = v_u_3.createElement
			local v30 = v_u_5
			local v31 = {}
			local v32
			if v_u_15(v27.name) then
				v32 = v_u_11[v27.name].name
			else
				v32 = v27.name
			end
			v31.name = v32
			local v33
			if v_u_15(v27.name) then
				v33 = v_u_11[v27.name].variant
			else
				v33 = v27.variant
			end
			v31.variant = v33
			v31.size = v24.icon.size
			v31.style = v22
			v28 = v29(v30, v31)
		else
			local v34, v35 = v_u_13(v27.name, v24.icon.size)
			if v34 then
				v28 = v_u_3.createElement(v_u_6, {
					["Image"] = v27.name,
					["Size"] = UDim2.fromOffset(v34.X, v34.Y),
					["imageStyle"] = v22,
					["scale"] = v35
				})
			end
		end
	end
	local v36 = v_u_3.createElement
	local v37 = v_u_9
	local v38 = {
		["tag"] = v24.container.tag
	}
	local v39
	if p_u_19.isDisabled then
		v39 = v_u_17.DISABLED_TRANSPARENCY
	else
		v39 = nil
	end
	v38.GroupTransparency = v39
	v38.testId = p_u_19.testId
	local v40 = {
		["Interactive"] = v_u_3.createElement(v_u_9, {
			["LayoutOrder"] = 1,
			["Size"] = nil,
			["onActivated"] = nil,
			["selection"] = nil,
			["cursor"] = nil,
			["isDisabled"] = nil,
			["ref"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_19
				p_u_19.onActivated(p_u_19.id)
			end,
			["selection"] = {
				["Selectable"] = not p_u_19.isDisabled
			},
			["cursor"] = v25,
			["isDisabled"] = p_u_19.isDisabled,
			["ref"] = p20
		})
	}
	local v41 = v_u_3.createElement
	local v42 = v_u_9
	local v43 = {
		["LayoutOrder"] = 2,
		["tag"] = nil,
		["Size"] = nil,
		["tag"] = v24.content.tag,
		["Size"] = v24.content.Size
	}
	local v44 = {}
	if not p_u_19.icon then
		v28 = nil
	end
	v44.Icon = v28
	v44.Text = v_u_3.createElement(v_u_8, {
		["Text"] = nil,
		["style"] = nil,
		["tag"] = nil,
		["LayoutOrder"] = 2,
		["Text"] = p_u_19.text,
		["style"] = v22,
		["tag"] = v24.text.tag
	})
	local v45
	if p_u_19.indicator then
		local v46 = v_u_3.createElement
		local v47 = v_u_7
		local v48
		if p_u_19.indicator.value then
			v48 = {
				["value"] = nil,
				["variant"] = nil,
				["max"] = nil,
				["LayoutOrder"] = 3,
				["testId"] = nil,
				["value"] = p_u_19.indicator.value,
				["variant"] = p_u_19.indicator.variant,
				["max"] = p_u_19.indicator.max,
				["testId"] = ("%*--indicator"):format(p_u_19.testId)
			}
		else
			v48 = {
				["variant"] = nil,
				["shape"] = nil,
				["LayoutOrder"] = 3,
				["testId"] = nil,
				["variant"] = p_u_19.indicator.variant,
				["shape"] = p_u_19.indicator.shape,
				["testId"] = ("%*--indicator"):format(p_u_19.testId)
			}
		end
		v45 = v46(v47, v48)
	else
		v45 = nil
	end
	v44.Indicator = v45
	v40.Content = v41(v42, v43, v44)
	return v36(v37, v38, v40)
end))