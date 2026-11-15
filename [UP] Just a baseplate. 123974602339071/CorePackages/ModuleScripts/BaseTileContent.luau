-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Tile.BaseTileContent
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Padding)
local v_u_5 = require(v1.Utility.getTestIdTag)
local v_u_6 = require(v1.Providers.Style.useTokens)
local v_u_7 = UDim2.fromScale(1, 0)
return v_u_3.memo(function(p8) -- name: BaseTileContent
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_7, (copy) v_u_5, (copy) v_u_4
	local v9 = v_u_6()
	local v10 = p8.contentAction ~= nil
	local v11 = v9.Gap.Small
	local v12 = UDim.new
	local v13 = 0
	local v14
	if p8.isContained then
		v14 = v9.Padding.Medium
	else
		v14 = v9.Padding.Small
	end
	local v15 = v12(v13, v14)
	local v16
	if p8.isContained then
		v16 = v15
	else
		v16 = nil
	end
	local v17 = v9.Size.Size_1200
	local v18 = v_u_3.createElement
	local v19 = "Frame"
	local v20 = {
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = p8.LayoutOrder,
		["Size"] = v_u_7,
		[v_u_3.Change.AbsoluteSize] = p8.onAbsoluteSizeChanged,
		[v_u_3.Tag] = v_u_5((("%*--content"):format(p8.testId)))
	}
	local v21 = {
		["Padding"] = v_u_3.createElement(v_u_4, {
			["value"] = {
				["top"] = v15,
				["bottom"] = v16,
				["left"] = v16,
				["right"] = v16
			}
		}),
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v22 = v_u_3.createElement
	local v23 = "Frame"
	local v24 = {
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = 1,
		["Size"] = nil,
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["Size"] = v_u_7
	}
	local v25 = {
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["Padding"] = UDim.new(0, v11),
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top
		})
	}
	local v26 = v_u_3.createElement
	local v27 = "Frame"
	local v28 = {
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = 1,
		["Size"] = nil,
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}
	local v29
	if v10 then
		v29 = UDim2.new(1, -(v17 + v11), 0, 0)
	else
		v29 = v_u_7
	end
	v28.Size = v29
	local v30 = {
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v31 = p8.title
	v30.Title = v_u_3.createElement("Frame", {
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = 1,
		["Size"] = nil,
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["Size"] = v_u_7
	}, v31)
	local v32
	if p8.metadata == nil then
		v32 = nil
	else
		local v33 = p8.metadata
		v32 = v_u_3.createElement("Frame", {
			["AutomaticSize"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["Size"] = v_u_7
		}, v33)
	end
	v30.Metadata = v32
	v25.Text = v26(v27, v28, v30)
	local v34
	if v10 then
		v34 = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.fromOffset(v17, v9.Size.Size_800),
			[v_u_3.Tag] = v_u_5((("%*--content-action"):format(p8.testId)))
		}, {
			["Content"] = p8.contentAction
		})
	else
		v34 = nil
	end
	v25.ContentAction = v34
	v21.Header = v22(v23, v24, v25)
	local v35
	if p8.footer == nil then
		v35 = nil
	else
		v35 = v_u_3.createElement("Frame", {
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["LayoutOrder"] = 2,
			["Size"] = v_u_7,
			[v_u_3.Tag] = v_u_5((("%*--footer"):format(p8.testId)))
		}, {
			["Padding"] = v_u_3.createElement(v_u_4, {
				["value"] = {
					["top"] = UDim.new(0, v11)
				}
			}),
			["Content"] = p8.footer
		})
	end
	v21.Footer = v35
	return v18(v19, v20, v21)
end)