-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.Actions.SheetActions
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactRoblox)
local v5 = script:FindFirstAncestor("Sheet")
local v_u_6 = require(v5.SheetContext)
local v_u_7 = require(v5.SheetType)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v_u_9 = require(v1.Enums.StateLayerAffordance)
local v_u_10 = require(v1.Components.View)
return v_u_3.memo(v_u_3.forwardRef(function(p11, p12) -- name: SheetActions
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_6, (copy) v_u_7, (copy) v_u_10, (copy) v_u_9, (copy) v_u_4
	local v_u_13 = v_u_8()
	local v14 = v_u_3.useContext(v_u_6)
	local v15 = v14.sheetHeightAvailable
	local v16 = v14.actionsHeight
	local v_u_17 = v14.setActionsHeight
	local v18 = v14.hasActionsDivider
	local v19 = v14.safeAreaPadding
	local v_u_20 = v14.bottomPadding
	local v21 = v14.sheetType
	local v22 = v14.testId
	if v15 then
		if v16 then
			if v_u_17 then
				if v18 then
					if v19 then
						if v_u_20 then
							v19 = v22
						else
							v19 = v_u_20
						end
					end
				else
					v19 = v18
				end
			else
				v19 = v_u_17
			end
		else
			v19 = v16
		end
	else
		v19 = v15
	end
	assert(v19, "SheetActions must be used within a Sheet")
	local v23 = v14.innerSurface
	local v24 = v21 == v_u_7.Bottom
	local v25 = v_u_3.createElement
	local v26 = v_u_10
	local v29 = {
		["tag"] = nil,
		["padding"] = nil,
		["stroke"] = nil,
		["onAbsoluteSizeChanged"] = nil,
		["ZIndex"] = 1,
		["testId"] = nil,
		["Position"] = nil,
		["LayoutOrder"] = 3,
		["ref"] = nil,
		["onActivated"] = nil,
		["selection"] = nil,
		["stateLayer"] = nil,
		["tag"] = {
			["row gap-small size-full-0 auto-y"] = true,
			["bg-surface-100"] = v24
		},
		["padding"] = {
			["top"] = UDim.new(0, v_u_13.Margin.Small),
			["left"] = UDim.new(0, v_u_13.Margin.Small),
			["right"] = UDim.new(0, v_u_13.Margin.Small),
			["bottom"] = UDim.new(0, v_u_20 + v_u_13.Margin.Small)
		},
		["stroke"] = {
			["Color"] = v_u_13.Color.Stroke.Default.Color3,
			["Transparency"] = v_u_13.Color.Stroke.Default.Transparency,
			["Thickness"] = v18:map(function(p27)
				-- upvalues: (copy) v_u_13
				return not p27 and 0 or v_u_13.Stroke.Standard
			end)
		},
		["onAbsoluteSizeChanged"] = v24 and function(p28)
			-- upvalues: (copy) v_u_17, (copy) v_u_20
			v_u_17(p28.AbsoluteSize.Y - v_u_20)
		end or nil,
		["testId"] = ("%*--actions"):format(v22)
	}
	local v30
	if v24 then
		v30 = v_u_3.joinBindings({
			["sheetHeightAvailable"] = v15,
			["actionsHeight"] = v16
		}):map(function(p31)
			local v32 = UDim2.new
			local v33 = p31.sheetHeightAvailable
			local v34 = p31.actionsHeight
			return v32(0, 0, 1, -math.min(v33, v34))
		end)
	else
		v30 = nil
	end
	v29.Position = v30
	v29.ref = p12
	function v29.onActivated() -- name: onActivated end
	v29.selection = {
		["Selectable"] = false
	}
	v29.stateLayer = {
		["affordance"] = v_u_9.None
	}
	local v35 = v25(v26, v29, p11.children)
	if not v24 then
		return v35
	end
	if v23 then
		v23 = v_u_4.createPortal(v35, v23)
	end
	return v23
end))