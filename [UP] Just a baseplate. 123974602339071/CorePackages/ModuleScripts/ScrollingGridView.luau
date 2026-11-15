-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Components.ScrollingGridView
local v1 = script:FindFirstAncestor("MomentsCommon").Parent
local v_u_2 = require(v1.Dash)
local v_u_3 = require(v1.Foundation)
local v_u_4 = require(v1.React)
local v_u_5 = v_u_3.Button
local v_u_6 = v_u_3.Enums.ScrollBarVisibility
local v_u_7 = v_u_3.ScrollView
local v_u_8 = v_u_3.View
local v_u_9 = v_u_3.Hooks.useTokens
local function v_u_18(p10) -- name: GridItems
	-- upvalues: (copy) v_u_4, (copy) v_u_8
	local v11 = {}
	for v12, v13 in p10.items do
		v11[v12] = v_u_4.createElement(v_u_8, {
			["LayoutOrder"] = v12,
			["Size"] = UDim2.fromOffset(p10.itemSize.X, p10.itemSize.Y)
		}, {
			["Content"] = p10.renderItem(v13, v12)
		})
	end
	local v14 = v_u_4.createElement
	local v15 = v_u_8
	local v16 = {
		["AutomaticSize"] = nil,
		["LayoutOrder"] = nil,
		["tag"] = "auto-y size-full-0",
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = p10.LayoutOrder
	}
	local v17 = {
		["UIGridLayout"] = v_u_4.createElement("UIGridLayout", {
			["CellPadding"] = UDim2.fromOffset(p10.itemPadding.X, p10.itemPadding.Y),
			["CellSize"] = UDim2.fromOffset(p10.itemSize.X, p10.itemSize.Y),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Children"] = v_u_4.createElement(v_u_4.Fragment, nil, v11)
	}
	return v14(v15, v16, v17)
end
return function(p_u_19)
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_2, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_18, (copy) v_u_5, (copy) v_u_3
	local v_u_20, v_u_21 = v_u_4.useState(Vector2.new(0, 0))
	local v_u_22, v_u_23 = v_u_4.useState(0)
	local v24 = v_u_9()
	local v26 = v_u_4.useCallback(function(p25)
		-- upvalues: (copy) v_u_21
		v_u_21(p25.AbsoluteSize)
	end, {})
	local v_u_30 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_20, (copy) p_u_19
		local v27 = v_u_20.X / p_u_19.itemConfig.minItemWidth
		local v28 = math.floor(v27)
		local v29 = p_u_19.itemConfig.maxItemsPerRow
		return math.clamp(v28, 1, v29)
	end, { v_u_20, p_u_19.itemConfig })
	local v_u_35 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_20, (copy) p_u_19, (copy) v_u_30
		local v31 = v_u_20.X - p_u_19.itemConfig.padding * (v_u_30 - 1)
		local v32 = v31 / v_u_30
		local v33 = math.min(v32, v31)
		local v34 = v33 * p_u_19.aspectRatio
		return Vector2.new(math.floor(v33), (math.floor(v34)))
	end, {
		v_u_20,
		v_u_30,
		p_u_19.aspectRatio,
		p_u_19.itemConfig
	})
	local v_u_39 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_20, (copy) v_u_35, (copy) v_u_30, (copy) p_u_19
		if v_u_20.Y <= 0 then
			return 0
		end
		local v36 = v_u_20.Y / v_u_35.Y
		local v37 = math.floor(v36) * v_u_30
		local v38 = p_u_19.itemConfig.minItemsPerPage
		return math.max(v37, v38)
	end, {
		v_u_20,
		v_u_35,
		v_u_30,
		p_u_19.itemConfig
	})
	local v40
	if v_u_20.X > 0 then
		v40 = v_u_20.Y > 0
	else
		v40 = false
	end
	local v_u_41 = p_u_19.shouldShowShowMoreButton or v_u_22 < #p_u_19.items
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_22, (copy) v_u_39, (copy) v_u_23
		if v_u_22 < v_u_39 then
			v_u_23(v_u_39)
		end
	end, { v_u_20, v_u_39, v_u_22 })
	local v42 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_22, (copy) v_u_39, (copy) p_u_19, (copy) v_u_23
		if v_u_22 + v_u_39 > #p_u_19.items and p_u_19.shouldShowShowMoreButton then
			p_u_19.onShowMoreCallback()
		end
		v_u_23(v_u_22 + v_u_39)
	end, {
		v_u_22,
		v_u_39,
		p_u_19.items,
		p_u_19.onShowMoreCallback
	})
	local v46 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_41, (copy) p_u_19, (copy) v_u_22, (ref) v_u_2
		if not v_u_41 then
			return p_u_19.items
		end
		local v43 = #p_u_19.items
		local v44 = v_u_22
		local v45 = math.min(v43, v44)
		return v_u_2.slice(p_u_19.items, 1, v45)
	end, { p_u_19.items, v_u_41, v_u_22 })
	if p_u_19.items == nil or #p_u_19.items == 0 then
		return v_u_4.createElement(v_u_8, {
			["onAbsoluteSizeChanged"] = nil,
			["tag"] = "shrink size-full",
			["onAbsoluteSizeChanged"] = v26
		}, {
			["EmptyState"] = p_u_19.renderEmptyState()
		})
	end
	local v47 = v_u_4.createElement
	local v48 = v_u_8
	local v49 = {
		["onAbsoluteSizeChanged"] = nil,
		["tag"] = "shrink size-full",
		["onAbsoluteSizeChanged"] = v26
	}
	local v50 = {}
	local v51 = v_u_4.createElement
	local v52 = v_u_8
	local v53 = {
		["tag"] = "size-full"
	}
	local v54 = {}
	local v55 = v_u_4.createElement
	local v56 = v_u_7
	local v57 = {
		["BorderSizePixel"] = 0,
		["layout"] = nil,
		["LayoutOrder"] = nil,
		["scroll"] = nil,
		["tag"] = "size-full",
		["layout"] = {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, v24.Padding.Large)
		},
		["LayoutOrder"] = not p_u_19.layoutOrder and 1 or p_u_19.layoutOrder,
		["scroll"] = {
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
			["CanvasSize"] = UDim2.fromScale(1, 0),
			["ScrollingDirection"] = Enum.ScrollingDirection.Y,
			["scrollBarVisibility"] = v_u_6.None
		}
	}
	local v58 = {}
	local v59
	if p_u_19.padding then
		v59 = v_u_4.createElement("UIPadding", {
			["PaddingBottom"] = p_u_19.padding.bottom,
			["PaddingTop"] = p_u_19.padding.top,
			["PaddingLeft"] = p_u_19.padding.left,
			["PaddingRight"] = p_u_19.padding.right
		})
	else
		v59 = nil
	end
	v58.UIPadding = v59
	local v60
	if #p_u_19.items > 0 and v40 then
		v60 = v_u_4.createElement(v_u_18, {
			["itemPadding"] = nil,
			["items"] = nil,
			["itemsPerRow"] = nil,
			["itemSize"] = nil,
			["LayoutOrder"] = 1,
			["renderItem"] = nil,
			["itemPadding"] = Vector2.new(p_u_19.itemConfig.padding, p_u_19.itemConfig.padding),
			["items"] = v46,
			["itemsPerRow"] = v_u_30,
			["itemSize"] = v_u_35,
			["renderItem"] = p_u_19.renderItem
		})
	else
		v60 = nil
	end
	v58.GridView = v60
	local v61
	if v_u_41 then
		v61 = v_u_4.createElement(v_u_5, {
			["LayoutOrder"] = 2,
			["onActivated"] = nil,
			["size"] = nil,
			["text"] = nil,
			["onActivated"] = v42,
			["size"] = v_u_3.Enums.InputSize.Small,
			["text"] = p_u_19.showMoreButtonText
		})
	else
		v61 = nil
	end
	v58.ShowMore = v61
	v54.ScrollView = v55(v56, v57, v58)
	v50.GridViewContainer = v51(v52, v53, v54)
	return v47(v48, v49, v50)
end