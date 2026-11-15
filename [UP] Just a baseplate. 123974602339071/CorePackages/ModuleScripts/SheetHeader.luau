-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.Header.SheetHeader
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Providers.Style.useTokens)
local v5 = script:FindFirstAncestor("Sheet")
local v_u_6 = require(v5.SheetContext)
local v_u_7 = require(v5.SheetType)
local v_u_8 = require(v1.Components.CloseAffordance)
local v_u_9 = require(v1.Enums.CloseAffordanceVariant)
local v_u_10 = require(v1.Components.View)
return v_u_3.memo(v_u_3.forwardRef(function(p11, p12) -- name: SheetHeader
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_6, (copy) v_u_7, (copy) v_u_10, (copy) v_u_8, (copy) v_u_9
	local v_u_13 = v_u_4()
	local v14 = v_u_3.useContext(v_u_6)
	local v15 = v14.innerScrollY
	local v_u_16 = v14.setHasHeader
	local v17 = v14.hasFullBleed
	local v18 = v14.sheetType
	local v19 = v14.closeSheet
	local v20 = v14.testId
	local v21 = v14.closeAffordanceRef
	local v22 = v14.contentStartRef
	local v23
	if v15 then
		if v_u_16 then
			if v19 then
				v23 = v20
			else
				v23 = v19
			end
		else
			v23 = v_u_16
		end
	else
		v23 = v15
	end
	assert(v23, "SheetHeader must be used within a Sheet")
	local v24 = v18 == v_u_7.Bottom
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_16
		v_u_16(true)
		return function()
			-- upvalues: (ref) v_u_16
			v_u_16(false)
		end
	end, {})
	local v25
	if p11.hasCloseAffordance == nil then
		v25 = not v24
	else
		v25 = p11.hasCloseAffordance
	end
	local v26 = v_u_3.createElement
	local v27 = v_u_10
	local v28 = {
		["ZIndex"] = 2,
		["tag"] = "col size-full-0 auto-y",
		["testId"] = nil,
		["ref"] = nil,
		["testId"] = ("%*--header"):format(v20),
		["ref"] = p12
	}
	local v29 = {}
	local v30 = v_u_3.createElement
	local v31 = v_u_10
	local v32 = {
		["LayoutOrder"] = 1,
		["tag"] = "row align-y-center items-center gap-small size-full-1400 auto-y margin-left-small padding-y-small padding-right-medium"
	}
	local v33 = {
		["SubContent"] = v_u_3.createElement(v_u_10, {
			["LayoutOrder"] = 1,
			["tag"] = "row items-center shrink gap-small size-full-0 auto-y"
		}, p11.children)
	}
	local v34
	if v25 then
		local v35 = v_u_3.createElement
		local v36 = v_u_8
		local v37 = {
			["onActivated"] = nil,
			["ref"] = nil,
			["NextSelectionDown"] = nil,
			["variant"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["onActivated"] = v19,
			["ref"] = v21,
			["NextSelectionDown"] = v22
		}
		local v38
		if v17 then
			v38 = v_u_9.OverMedia
		else
			v38 = v_u_9.Utility
		end
		v37.variant = v38
		v37.testId = ("%*--header--close-affordance"):format(v20)
		v34 = v35(v36, v37)
	else
		v34 = nil
	end
	v33.CloseAffordance = v34
	v29.Content = v30(v31, v32, v33)
	v29.BottomBorder = v_u_3.createElement(v_u_10, {
		["LayoutOrder"] = 2,
		["backgroundStyle"] = nil,
		["testId"] = nil,
		["Size"] = nil,
		["backgroundStyle"] = v15:map(function(p39)
			-- upvalues: (copy) v_u_13
			local v40 = {
				["Color3"] = v_u_13.Color.Stroke.Default.Color3
			}
			local v41 = v_u_13.Color.Stroke.Default.Transparency
			local v42 = p39 / v_u_13.Size.Size_1200
			local v43 = math.clamp(v42, 0, 1)
			v40.Transparency = math.lerp(1, v41, v43)
			return v40
		end),
		["testId"] = ("%*--header--bottom-border"):format(v20),
		["Size"] = UDim2.new(1, 0, 0, v_u_13.Stroke.Standard)
	})
	return v26(v27, v28, v29)
end))