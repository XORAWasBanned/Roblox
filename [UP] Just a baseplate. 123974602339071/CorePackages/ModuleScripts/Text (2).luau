-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Text.Text
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactIs)
local v_u_5 = require(v1.Components.Interactable)
local v_u_6 = require(v1.Utility.Flags)
local v_u_7 = require(v1.Utility.GuiObjectChildren)
require(v1.Components.Types)
local v_u_8 = require(v1.Utility.indexBindable)
local v_u_9 = require(v1.Utility.normalizeFontFace)
local v_u_10 = require(v1.Utility.useDefaultTags)
local v_u_11 = require(v1.Utility.withDefaults)
local v_u_12 = require(v1.Utility.withGuiObjectProps)
local v_u_13 = require(v1.Providers.Style.useStyleTags)
local v_u_14 = require(script.Parent.FontScales)
local v_u_15 = {
	["AutoLocalize"] = false,
	["AutoButtonColor"] = false,
	["BorderSizePixel"] = 0,
	["isDisabled"] = false
}
return v_u_3.memo(v_u_3.forwardRef(function(p16, p17) -- name: Text
	-- upvalues: (copy) v_u_11, (copy) v_u_15, (copy) v_u_10, (copy) v_u_13, (copy) v_u_3, (copy) v_u_6, (copy) v_u_9, (copy) v_u_4, (copy) v_u_14, (copy) v_u_12, (copy) v_u_8, (copy) v_u_5, (copy) v_u_7
	local v_u_18 = v_u_11(p16, v_u_15)
	local v19 = (v_u_18.onStateChanged ~= nil or v_u_18.onActivated ~= nil) and true or v_u_18.onSecondaryActivated ~= nil
	local v20 = v_u_18.backgroundStyle == nil and "gui-object-defaults text-defaults text-size-defaults text-color-defaults" or "gui-object-defaults text-defaults text-size-defaults text-color-defaults x-default-transparency"
	if v_u_18.fontStyle and v_u_18.fontStyle.FontSize then
		v20 = v20 .. " x-default-text-size"
	end
	local v21 = v_u_13((v_u_10(v_u_18.tag, v20)))
	local v_u_24 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_18, (ref) v_u_9, (ref) v_u_4
		if v_u_6.FoundationFontFaceMigration then
			local v22
			if v_u_18.fontStyle == nil then
				v22 = nil
			else
				v22 = v_u_18.fontStyle.Font
			end
			return v_u_9(v22)
		else
			local v23
			if v_u_18.fontStyle == nil then
				v23 = nil
			else
				v23 = v_u_18.fontStyle.Font
			end
			if typeof(v23) == "table" and not v_u_4.isBinding(v23) then
				return Font.new(v23.Family, v23.Weight, v23.Style)
			elseif typeof(v23) == "EnumItem" then
				return Font.fromEnum(v23)
			else
				return v23
			end
		end
	end, { v_u_18.fontStyle })
	local v27 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_18, (copy) v_u_24, (ref) v_u_4, (ref) v_u_14
		if v_u_18.fontStyle == nil or (v_u_18.fontStyle.LineHeight == nil or (v_u_18.fontStyle.FontSize == nil or v_u_24 == nil)) then
			return 0
		end
		local v25
		if v_u_4.isBinding(v_u_24) then
			v25 = v_u_24:getValue().Family
		else
			v25 = v_u_24.Family
		end
		local v26 = v_u_14[v25]
		return v26 == nil and 0 or (v_u_18.fontStyle.FontSize / v26 * (v_u_18.fontStyle.LineHeight * v26) - v_u_18.fontStyle.FontSize) / 2
	end, { v_u_24, v_u_18.fontStyle })
	if v_u_18.padding == nil and v27 ~= 0 then
		v_u_18.padding = Vector2.new(0, v27)
	end
	local v28 = v19 and "TextButton" or "TextLabel"
	local v29 = v_u_12
	local v30 = {}
	local v31
	if v28 == "TextButton" then
		v31 = v_u_18.AutoButtonColor
	else
		v31 = nil
	end
	v30.AutoButtonColor = v31
	v30.FontFace = v_u_24
	local v32
	if v_u_18.fontStyle == nil then
		v32 = nil
	else
		v32 = v_u_18.fontStyle.LineHeight
	end
	v30.LineHeight = v32
	v30.RichText = v_u_18.RichText
	v30.Text = v_u_18.Text
	local v33
	if v_u_18.textStyle then
		v33 = v_u_8(v_u_18.textStyle, "Color3")
	else
		v33 = nil
	end
	v30.TextColor3 = v33
	local v34
	if v_u_18.textStyle then
		v34 = v_u_8(v_u_18.textStyle, "Transparency")
	else
		v34 = nil
	end
	v30.TextTransparency = v34
	v30.TextDirection = v_u_18.TextDirection
	v30.TextScaled = v_u_18.TextScaled
	local v35
	if v_u_18.fontStyle == nil then
		v35 = nil
	else
		v35 = v_u_18.fontStyle.FontSize
	end
	v30.TextSize = v35
	v30.TextTruncate = v_u_18.TextTruncate
	v30.TextWrapped = v_u_18.TextWrapped
	v30.TextXAlignment = v_u_18.TextXAlignment
	v30.TextYAlignment = v_u_18.TextYAlignment
	v30.ref = p17
	v30[v_u_3.Tag] = v21
	local v36 = v29(v_u_18, v30)
	local v37
	if v19 then
		v37 = v_u_5
		v36.component = v28
		v36.onActivated = v_u_18.onActivated
		v36.onSecondaryActivated = v_u_18.onSecondaryActivated
		v36.onStateChanged = v_u_18.onStateChanged
		v36.stateLayer = v_u_18.stateLayer
		v36.isDisabled = v_u_18.isDisabled
		v36.cursor = v_u_18.cursor
	else
		v37 = v28
	end
	return v_u_3.createElement(v37, v36, v_u_7(v_u_18))
end))