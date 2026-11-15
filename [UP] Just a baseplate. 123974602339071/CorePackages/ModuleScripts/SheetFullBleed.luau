-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.FullBleed.SheetFullBleed
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Constants)
local v_u_5 = require(v1.Components.Image)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Utility.Flags)
local v_u_8 = require(v1.Utility.devAssert)
local v_u_9 = require(v1.Utility.withDefaults)
local v10 = script:FindFirstAncestor("Sheet")
local v_u_11 = require(v10.SheetContext)
local v_u_12 = {
	["height"] = nil,
	["sticky"] = false,
	["height"] = UDim.new(1, 0)
}
return v_u_3.memo(v_u_3.forwardRef(function(p13, p14) -- name: SheetFullBleed
	-- upvalues: (copy) v_u_9, (copy) v_u_12, (copy) v_u_3, (copy) v_u_11, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4
	local v_u_15 = v_u_9(p13, v_u_12)
	local v16 = v_u_3.useContext(v_u_11)
	local v_u_17 = v16.setFullBleedHeight
	local v18 = v16.fullBleedHeight
	local v19 = v16.innerScrollY
	local v_u_20 = v16.hasHeader
	local v21 = v16.hasRadius
	local v22 = v16.testId
	local v23
	if v_u_17 then
		if v_u_20 then
			v23 = v22
		else
			v23 = v_u_20
		end
	else
		v23 = v_u_17
	end
	assert(v23, "SheetFullBleed must be used within a Sheet")
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_8, (copy) v_u_15, (copy) v_u_20
		if v_u_7.FoundationDevOnlyPropAsserts then
			local v24 = v_u_8
			local v25 = v_u_15.sticky
			if v25 then
				v25 = v_u_20:getValue()
			end
			v24(not v25, "Sheet.FullBleed with sticky=true is unsupported when used with Sheet.Header")
		else
			local v26 = v_u_15.sticky
			if v26 then
				v26 = v_u_20:getValue()
			end
			assert(not v26, "Sheet.FullBleed with sticky=true is unsupported when used with Sheet.Header")
		end
	end, { v_u_15.sticky, v_u_20 })
	local v28 = v_u_3.useCallback(function(p27)
		-- upvalues: (copy) v_u_17
		v_u_17(p27.AbsoluteSize.Y)
	end, {})
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_17
		return function()
			-- upvalues: (ref) v_u_17
			v_u_17(0)
		end
	end, {})
	local v29 = UDim2.new(1, 0, v_u_15.height.Scale, v_u_15.height.Offset)
	local v30 = nil
	if v_u_15.sticky then
		v30 = v29
	elseif v19 and v18 then
		v30 = v_u_3.joinBindings({
			["scrollY"] = v19,
			["height"] = v18
		}):map(function(p31)
			if p31.height == 0 then
				return UDim2.fromScale(1, 1)
			end
			local v32 = p31.height - p31.scrollY
			local v33 = math.max(0, v32)
			return UDim2.new(1, 0, 0, v33)
		end)
	end
	local v34 = {}
	local v35 = v_u_3.createElement
	local v36 = v_u_5
	local v37 = {
		["Image"] = nil,
		["imageStyle"] = nil,
		["backgroundStyle"] = nil,
		["aspectRatio"] = nil,
		["tag"] = nil,
		["onAbsoluteSizeChanged"] = nil,
		["Size"] = nil,
		["ZIndex"] = 0,
		["Image"] = v_u_15.media,
		["imageStyle"] = v_u_15.mediaStyle,
		["backgroundStyle"] = v_u_15.backgroundStyle,
		["aspectRatio"] = v_u_15.aspectRatio,
		["tag"] = v21 and "radius-top-large" or nil
	}
	if v_u_15.sticky then
		v28 = nil
	end
	v37.onAbsoluteSizeChanged = v28
	v37.Size = v29
	v34.Image = v35(v36, v37)
	local v38
	if v_u_15.children then
		v38 = v_u_3.createElement(v_u_6, {
			["aspectRatio"] = nil,
			["Size"] = nil,
			["ZIndex"] = 2,
			["aspectRatio"] = v_u_15.aspectRatio,
			["Size"] = v29
		}, v_u_15.children)
	else
		v38 = nil
	end
	v34.Content = v38
	local v39 = v_u_3.createElement
	local v40 = v_u_6
	local v41 = {
		["Size"] = nil,
		["aspectRatio"] = nil,
		["LayoutOrder"] = nil,
		["ClipsDescendants"] = true,
		["ZIndex"] = 2,
		["testId"] = nil,
		["ref"] = nil,
		["Size"] = v30
	}
	local v42
	if v_u_15.sticky then
		v42 = v_u_15.aspectRatio
	else
		v42 = nil
	end
	v41.aspectRatio = v42
	local v43
	if v_u_15.sticky then
		v43 = v_u_4.MIN_LAYOUT_ORDER
	else
		v43 = nil
	end
	v41.LayoutOrder = v43
	v41.testId = ("%*--full-bleed"):format(v22)
	v41.ref = p14
	if not v_u_15.sticky and v_u_15.aspectRatio then
		v34 = v_u_3.createElement(v_u_6, {
			["Size"] = UDim2.new(1, 0, 0, 9999),
			["aspectRatio"] = v_u_15.aspectRatio
		}, v34)
	end
	local v44 = v39(v40, v41, v34)
	if v_u_15.sticky then
		return v44
	else
		return v_u_3.createElement("Folder", nil, v44)
	end
end))