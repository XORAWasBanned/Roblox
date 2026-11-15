-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Tile.BaseTile
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.BaseTileContent)
local v_u_5 = require(script.Parent.BaseTileMedia)
local v_u_6 = require(v1.Components.CornerRadius)
local v7 = require(v1.Enums.TileAspectRatio)
require(v1.Components.Types)
local v_u_8 = require(v1.Utility.getTestIdTag)
local v_u_9 = require(v1.Utility.joinBindables)
local v_u_10 = require(v1.Utility.mapBindable)
local v_u_11 = require(v1.Providers.Cursor.useCursor)
local v_u_12 = require(v1.Utility.Control.useGuiControlState)
local v_u_13 = require(v1.Providers.Style.useTokens)
local v_u_14 = require(v1.Utility.withDefaults)
local v_u_15 = {
	["mediaAspectRatio"] = nil,
	["isContained"] = false,
	["testId"] = "--foundation-base-tile",
	["mediaAspectRatio"] = v7.Ratio16x9
}
return v_u_3.memo(v_u_3.forwardRef(function(p16, p17) -- name: BaseTile
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_13, (copy) v_u_11, (copy) v_u_10, (copy) v_u_3, (copy) v_u_9, (copy) v_u_12, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
	local v18 = v_u_14(p16, v_u_15)
	local v19 = v_u_13()
	local v20 = v_u_11({
		["radius"] = UDim.new(0, v19.Radius.Medium),
		["offset"] = v19.Size.Size_200,
		["borderWidth"] = v19.Stroke.Thicker
	})
	local v_u_21 = v18.Size or UDim2.fromOffset(250 * v19.Config.UI.Scale, 0)
	local v23 = v_u_10(v_u_21, function(p22)
		if p22.Y.Scale ~= 0 and true or p22.Y.Offset ~= 0 then
			return Enum.AutomaticSize.None
		else
			return Enum.AutomaticSize.Y
		end
	end)
	local v_u_24, v_u_25 = v_u_3.useBinding(0)
	local v_u_26, v_u_27 = v_u_3.useBinding(0)
	local v_u_28 = (typeof(v_u_21) ~= "UDim2" or v_u_21.Y.Scale ~= 0) and true or v_u_21.Y.Offset ~= 0
	local v32 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_28, (ref) v_u_9, (copy) v_u_21, (copy) v_u_24, (copy) v_u_26
		if v_u_28 then
			return v_u_9({
				["size"] = v_u_21,
				["tileHeight"] = v_u_24,
				["contentHeight"] = v_u_26
			}, function(p29)
				local v30 = p29.size
				if v30.Y.Scale == 0 and v30.Y.Offset == 0 then
					return nil
				end
				local v31 = p29.tileHeight - p29.contentHeight
				return math.max(v31, 0)
			end)
		else
			return nil
		end
	end, { v_u_21, v_u_28 })
	local v_u_33 = v18.onAbsoluteSizeChanged
	local v35 = v_u_3.useCallback(function(p34)
		-- upvalues: (copy) v_u_25, (copy) v_u_33
		v_u_25(p34.AbsoluteSize.Y)
		if v_u_33 ~= nil then
			v_u_33(p34)
		end
	end, { v_u_33 })
	local v37 = v_u_3.useCallback(function(p36)
		-- upvalues: (copy) v_u_27
		v_u_27(p36.AbsoluteSize.Y)
	end, {})
	local v38 = v18.onActivated
	local v39 = v18.onSecondaryActivated
	local v40 = v18.onStateChanged
	local v41 = v38 ~= nil and true or v39 ~= nil
	local v42 = v40 ~= nil
	local v43
	if v18.isContained then
		v43 = v18.containedBackgroundStyle or v19.Color.Shift.Shift_200
	else
		v43 = nil
	end
	local v44 = v_u_12
	local v45
	if v42 then
		v45 = p17
	else
		v45 = nil
	end
	local v46 = v44(v45, v40)
	local v47 = v41 or v42
	local v48 = {
		["AnchorPoint"] = v18.AnchorPoint,
		["AutomaticSize"] = v23
	}
	local v49
	if v43 == nil then
		v49 = nil
	else
		v49 = v_u_10(v43, function(p50)
			return p50.Color3
		end)
	end
	v48.BackgroundColor3 = v49
	v48.BackgroundTransparency = v43 == nil and 1 or v_u_10(v43, function(p51)
		return p51.Transparency
	end)
	v48.BorderSizePixel = 0
	v48.LayoutOrder = v18.LayoutOrder
	v48.Position = v18.Position
	v48.Size = v_u_21
	v48.Visible = v18.Visible
	v48.ZIndex = v18.ZIndex
	if not v42 then
		v46 = p17
	end
	v48.ref = v46
	local v52 = v_u_3.Change.AbsoluteSize
	if v_u_28 then
		v_u_33 = v35
	end
	v48[v52] = v_u_33
	v48[v_u_3.Change.AbsolutePosition] = v18.onAbsolutePositionChanged
	v48[v_u_3.Tag] = v_u_8(v18.testId)
	if v47 then
		v48.Active = v41
		v48.AutoButtonColor = false
		v48.Selectable = v41
		v48.SelectionImageObject = v20
		v48.Text = ""
		v48[v_u_3.Event.Activated] = v38
		v48[v_u_3.Event.SecondaryActivated] = v39
	end
	local v53 = v_u_3.createElement
	local v54 = v47 and "TextButton" or "Frame"
	local v55 = {
		["Corner"] = v_u_3.createElement(v_u_6, {
			["value"] = UDim.new(0, v19.Radius.Medium)
		}),
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Media"] = v_u_3.createElement(v_u_5, {
			["content"] = nil,
			["aspectRatio"] = nil,
			["backgroundStyle"] = nil,
			["isContained"] = nil,
			["tileSize"] = nil,
			["maxHeight"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["content"] = v18.mediaContent,
			["aspectRatio"] = v18.mediaAspectRatio,
			["backgroundStyle"] = v18.mediaBackgroundStyle or v19.Color.Shift.Shift_200,
			["isContained"] = v18.isContained,
			["tileSize"] = v_u_21,
			["maxHeight"] = v32,
			["testId"] = ("%*--media"):format(v18.testId)
		})
	}
	local v56 = v_u_3.createElement
	local v57 = v_u_4
	local v58 = {
		["title"] = nil,
		["metadata"] = nil,
		["contentAction"] = nil,
		["footer"] = nil,
		["isContained"] = nil,
		["onAbsoluteSizeChanged"] = nil,
		["LayoutOrder"] = 2,
		["testId"] = nil,
		["title"] = v18.title,
		["metadata"] = v18.metadata,
		["contentAction"] = v18.contentAction,
		["footer"] = v18.footer,
		["isContained"] = v18.isContained
	}
	if not v_u_28 then
		v37 = nil
	end
	v58.onAbsoluteSizeChanged = v37
	v58.testId = v18.testId
	v55.Content = v56(v57, v58)
	return v53(v54, v48, v55)
end))