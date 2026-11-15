-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.IconButton.IconButton
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = v_u_3.Migration.uiblox
local v6 = require(v1.Enums.InputSize)
local v_u_7 = require(v1.Enums.FillBehavior)
require(v1.Enums.IconSize)
local v8 = require(v1.Enums.ButtonVariant)
require(v1.Enums.Radius)
local v_u_9 = require(v1.Providers.Style.useTokens)
local v_u_10 = require(v1.Providers.Style.PresentationContext).usePresentationContext
local v_u_11 = require(v1.Utility.getIconScale)
local v12 = require(v1.Utility.iconMigrationUtils)
local v_u_13 = require(v1.Utility.isBuilderIcon)
local v_u_14 = require(script.Parent.useIconButtonVariants)
local v_u_15 = require(v1.Utility.useIconSize)
local v_u_16 = require(v1.Utility.withCommonProps)
local v_u_17 = require(v1.Utility.withDefaults)
local v_u_18 = v12.isMigrated
local v_u_19 = v12.isBuilderOrMigratedIcon
local v_u_20 = require(v1.Constants)
local v_u_21 = require(v1.Components.Image)
local v_u_22 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_23 = require(v1.Components.View)
local v_u_24 = {
	["isDisabled"] = false,
	["size"] = nil,
	["width"] = nil,
	["isCircular"] = false,
	["variant"] = nil,
	["testId"] = "--foundation-icon-button",
	["size"] = v6.Medium,
	["width"] = UDim.new(0, 0),
	["variant"] = v8.Utility
}
return v_u_4.memo(v_u_4.forwardRef(function(p25, p26) -- name: IconButton
	-- upvalues: (copy) v_u_17, (copy) v_u_24, (copy) v_u_9, (copy) v_u_10, (copy) v_u_19, (copy) v_u_11, (copy) v_u_14, (copy) v_u_15, (copy) v_u_13, (copy) v_u_4, (copy) v_u_7, (copy) v_u_23, (copy) v_u_16, (copy) v_u_20, (copy) v_u_22, (copy) v_u_18, (copy) v_u_5, (copy) v_u_3, (copy) v_u_21
	local v27 = v_u_17(p25, v_u_24)
	local v_u_28 = v_u_9()
	local v29 = v_u_10()
	local v30 = v27.icon
	local v31
	if typeof(v30) == "table" then
		v31 = v27.icon.name
	else
		v31 = v27.icon
	end
	local v32 = v27.icon
	local v33
	if typeof(v32) == "table" then
		v33 = v27.icon.variant
	else
		v33 = nil
	end
	local v34, v35
	if v_u_19(v31) then
		v34 = 1
		v35 = nil
	else
		v35, v34 = v_u_11(v31, v27.size)
	end
	local v36 = v_u_14
	local v37 = v27.size
	local v38 = v27.variant
	local v39
	if v29 then
		v39 = v29.colorNamespace
	else
		v39 = nil
	end
	local v40 = v36(v_u_28, v37, v38, v39)
	local v41 = v40.container.size
	local v_u_42
	if v27.isCircular then
		v_u_42 = UDim.new(0, v_u_28.Radius.Circle)
	else
		v_u_42 = UDim.new(0, v40.container.radius or v_u_28.Radius.Large)
	end
	local v43 = v_u_15(v27.size, v_u_13(v31), true)
	local v44 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_42, (copy) v_u_28
		return {
			["radius"] = v_u_42,
			["offset"] = v_u_28.Size.Size_150,
			["borderWidth"] = v_u_28.Stroke.Thicker
		}
	end, { v_u_28, v_u_42 })
	local v45 = v27.fillBehavior == v_u_7.Fill
	local v46 = v27.width.Scale ~= 0 and true or v27.width.Offset ~= 0
	local v47
	if v45 then
		v47 = UDim.new(1, 0)
	elseif v46 then
		v47 = v27.width
	else
		v47 = v41.X
	end
	local v48 = v_u_4.createElement
	local v49 = v_u_23
	local v50 = v_u_16
	local v51 = {
		["onActivated"] = v27.onActivated,
		["Size"] = UDim2.new(v47, UDim.new(0, v41.Y.Offset))
	}
	local v52
	if v27.fillBehavior then
		v52 = {}
		local v53
		if v27.fillBehavior == v_u_7.Fill then
			v53 = Enum.UIFlexMode.Fill
		else
			v53 = Enum.UIFlexMode.Shrink
		end
		v52.FlexMode = v53
	else
		v52 = nil
	end
	v51.flexItem = v52
	local v54 = {}
	local v55
	if v27.isDisabled then
		v55 = false
	else
		v55 = v27.Selectable
	end
	v54.Selectable = v55
	v54.NextSelectionUp = v27.NextSelectionUp
	v54.NextSelectionDown = v27.NextSelectionDown
	v54.NextSelectionLeft = v27.NextSelectionLeft
	v54.NextSelectionRight = v27.NextSelectionRight
	v51.selection = v54
	v51.isDisabled = v27.isDisabled
	v51.stateLayer = v40.container.stateLayer
	v51.padding = v40.container.padding
	v51.cornerRadius = v_u_42
	v51.backgroundStyle = v40.container.style
	v51.stroke = v40.container.stroke
	v51.cursor = v44
	local v56
	if v27.isDisabled then
		v56 = v_u_20.DISABLED_TRANSPARENCY
	else
		v56 = nil
	end
	v51.GroupTransparency = v56
	v51.ref = p26
	local v57 = v50(v27, v51)
	local v58 = {}
	local v59
	if v_u_19(v31) then
		local v60 = v_u_4.createElement
		local v61 = v_u_22
		local v62 = {
			["Text"] = nil,
			["fontStyle"] = nil,
			["tag"] = "position-center-center anchor-center-center",
			["Size"] = nil,
			["textStyle"] = nil,
			["testId"] = nil
		}
		local v63
		if v_u_18(v31) then
			v63 = v_u_5[v31].name
		else
			v63 = v31
		end
		v62.Text = v63
		local v64 = {}
		local v65 = v_u_3.Font
		local v66
		if v_u_18(v31) then
			v66 = v_u_5[v31].variant
		else
			v66 = v33 or v_u_3.IconVariant.Regular
		end
		v64.Font = v65[v66]
		v64.FontSize = v43.Y.Offset
		v62.fontStyle = v64
		v62.Size = v43
		v62.textStyle = v40.content.style
		v62.testId = ("%*--icon"):format(v27.testId)
		v59 = v60(v61, v62)
	else
		local v67 = v_u_4.createElement
		local v68 = v_u_21
		local v69 = {
			["tag"] = "position-center-center anchor-center-center",
			["Image"] = nil,
			["Size"] = nil,
			["imageStyle"] = nil,
			["scale"] = nil,
			["testId"] = nil,
			["Image"] = v31
		}
		if v35 then
			v43 = UDim2.fromOffset(v35.X, v35.Y)
		end
		v69.Size = v43
		v69.imageStyle = v40.content.style
		v69.scale = v34
		v69.testId = ("%*--image"):format(v27.testId)
		v59 = v67(v68, v69)
	end
	v58.Icon = v59
	return v48(v49, v57, v58)
end))