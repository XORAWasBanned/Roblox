-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Components.TextOverlayDisplay
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v4 = require(v2.Foundation)
local v_u_5 = require(v2.React)
local v_u_6 = v_u_5.useCallback
local v_u_7 = v_u_5.useMemo
local v_u_8 = v4.View
local v_u_9 = require(v1.Components.TextOverlay)
local v_u_10 = require(v1.Utils.getCropSize)
local v_u_11 = require(v1.Utils.getFitSize)
local v_u_12 = require(v1.Utils.getScale)
require(v1.Types)
return function(p_u_13) -- name: TextOverlayDisplay
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_11, (copy) v_u_10, (copy) v_u_12, (copy) v_u_6, (copy) v_u_3, (copy) v_u_9, (copy) v_u_8
	local v_u_14 = v_u_5.useRef(nil)
	local v_u_15 = v_u_5.useRef(nil)
	local v_u_16
	if p_u_13.textOverlayEdits then
		v_u_16 = p_u_13.textOverlayEdits[1] or nil
	else
		v_u_16 = nil
	end
	local v20, v_u_21 = v_u_7(function()
		-- upvalues: (copy) p_u_13, (ref) v_u_11, (ref) v_u_10, (ref) v_u_12
		if p_u_13.itemResolution then
			local v17 = v_u_11(p_u_13.itemSize, p_u_13.itemResolution)
			local v18 = v_u_10(p_u_13.itemSize, p_u_13.itemResolution)
			local v19 = v_u_12(p_u_13.itemSize, p_u_13.itemResolution, p_u_13.scaleType)
			if p_u_13.scaleType == Enum.ScaleType.Fit then
				return v17, v19
			else
				return v18, v19
			end
		else
			return UDim2.fromScale(1, 1), 1
		end
	end, { p_u_13.scaleType, p_u_13.itemResolution, p_u_13.itemSize })
	local v_u_23 = v_u_6(function()
		-- upvalues: (copy) v_u_15, (copy) p_u_13, (ref) v_u_3, (copy) v_u_16
		if v_u_15.current and p_u_13.onTextOverlayDragEnd then
			local v22 = { (v_u_3.joinDeep(v_u_16, {
					["position"] = v_u_15.current.Position
				})) }
			p_u_13.onTextOverlayDragEnd(v22)
		end
	end, { p_u_13.onTextOverlayDragEnd, v_u_16 })
	local v25 = v_u_6(function(p24)
		-- upvalues: (ref) v_u_5, (ref) v_u_9, (copy) v_u_21, (copy) v_u_14, (copy) v_u_15, (copy) p_u_13, (copy) v_u_23
		return v_u_5.createElement(v_u_9, {
			["additionalScale"] = v_u_21,
			["boundingUI"] = v_u_14.current,
			["containerRef"] = v_u_15,
			["draggable"] = p_u_13.draggable,
			["onActivated"] = p_u_13.onTextOverlayActivated,
			["onDragEnd"] = v_u_23,
			["textOverlayEdit"] = p24
		})
	end, { p_u_13.draggable, p_u_13.onTextOverlayActivated, v_u_21 })
	if p_u_13.textOverlayEdits and #p_u_13.textOverlayEdits ~= 0 then
		return v_u_5.createElement(v_u_8, {
			["ref"] = nil,
			["Size"] = nil,
			["tag"] = "anchor-center-center position-center-center",
			["ZIndex"] = nil,
			["ref"] = v_u_14,
			["Size"] = v20,
			["ZIndex"] = p_u_13.zIndex or 1
		}, {
			["TextOverlay"] = v25(v_u_16)
		})
	else
		return nil
	end
end