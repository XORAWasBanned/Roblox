-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.Content.PopoverContent
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v1.Constants)
local v_u_4 = require(v2.Dash)
local v_u_5 = require(v1.Utility.Flags)
local v_u_6 = require(v1.Components.Image)
local v_u_7 = require(script.Parent.Parent.PopoverContext)
local v_u_8 = require(v1.Components.View)
local v_u_9 = require(v1.Utility.isPointInGuiObjectBounds)
local v_u_10 = require(script.Parent.Parent.useFloating)
local v_u_11 = require(v1.Providers.Overlay.useOverlay)
local v_u_12 = require(v1.Utility.usePointerPosition)
local v_u_13 = require(v1.Providers.Style.useTokens)
local v_u_14 = require(v1.Utility.withDefaults)
local v15 = require(v1.Enums.PopoverAlign)
local v16 = require(v1.Enums.PopoverSide)
local v17 = require(v1.Enums.Radius)
local v_u_18 = require(v2.React)
local v_u_19 = require(v2.ReactRoblox)
local v_u_20 = require(v1.Enums.StateLayerAffordance)
local v_u_21 = require(v1.Enums.ElevationLayer)
require(v1.Components.Types)
local v_u_22 = require(v1.Providers.Elevation.useElevation)
local v_u_23 = require(v1.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local v_u_24 = {
	["side"] = nil,
	["align"] = nil,
	["hasArrow"] = true,
	["selection"] = nil,
	["selectionGroup"] = nil,
	["radius"] = nil,
	["side"] = v16.Bottom,
	["align"] = v15.Center,
	["selection"] = v3.MODAL.DISABLE_SELECTION,
	["selectionGroup"] = v3.MODAL.TRAP_FOCUS,
	["radius"] = v17.Medium
}
local v_u_25 = {
	[v17.Small] = "radius-small",
	[v17.Medium] = "radius-medium",
	[v17.Circle] = "radius-circle"
}
local v_u_26 = v3.SHADOW_IMAGE
local v_u_27 = v3.SHADOW_SIZE
return v_u_18.forwardRef(function(p28, p29) -- name: PopoverContent
	-- upvalues: (copy) v_u_14, (copy) v_u_24, (copy) v_u_18, (copy) v_u_7, (copy) v_u_11, (copy) v_u_13, (copy) v_u_22, (copy) v_u_21, (copy) v_u_12, (copy) v_u_10, (copy) v_u_9, (copy) v_u_5, (copy) v_u_8, (copy) v_u_20, (copy) v_u_25, (copy) v_u_6, (copy) v_u_26, (copy) v_u_27, (copy) v_u_4, (copy) v_u_23, (copy) v_u_19
	local v_u_30 = v_u_14(p28, v_u_24)
	local v_u_31 = v_u_18.useContext(v_u_7)
	local v32 = v_u_31.anchor
	local v_u_33 = typeof(v32) == "Instance"
	local v34
	if v_u_33 then
		v34 = v_u_30.hasArrow
	else
		v34 = false
	end
	local v35 = v_u_11()
	local v36 = v_u_13()
	local v37 = v_u_22(v_u_21.Popover, {
		["stackAboveOwner"] = true
	})
	local v38 = v36.Size.Size_200
	local v39 = v38 * 1.4142135623730951 / 2
	local v40 = v_u_30.backgroundStyle or v36.Color.Surface.Surface_100
	local v_u_41, v42 = v_u_18.useState(nil)
	local v43, v_u_44 = v_u_18.useState(nil)
	local v_u_45 = v_u_12(v43)
	v_u_18.useImperativeHandle(p29, function()
		-- upvalues: (copy) v_u_41
		return v_u_41
	end, { v_u_41 })
	local v46, v47, v48, v49, v50, v51 = v_u_10(v_u_31.isOpen, v_u_31.anchor, v_u_41, v35, v_u_30.side, v_u_30.align, not v34 and 0 or v39)
	local v_u_52 = v_u_18.useRef(nil)
	local v55 = v_u_18.useCallback(function(p_u_53)
		-- upvalues: (copy) v_u_52, (copy) v_u_44, (copy) v_u_30, (copy) v_u_31, (copy) v_u_33, (copy) v_u_45, (ref) v_u_9
		if v_u_52.current then
			v_u_52.current:Disconnect()
		end
		v_u_44(p_u_53)
		if p_u_53 ~= nil and v_u_30.onPressedOutside then
			v_u_52.current = p_u_53:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: (copy) p_u_53, (ref) v_u_31, (ref) v_u_33, (ref) v_u_45, (ref) v_u_9, (ref) v_u_30
				if p_u_53.GuiState == Enum.GuiState.Press then
					if v_u_31.anchor and v_u_33 then
						local v54 = v_u_31.anchor
						if v_u_9(v54, (v_u_45:getValue())) then
							return
						end
						if v54.GuiState ~= Enum.GuiState.Idle then
							return
						end
					end
					v_u_30.onPressedOutside()
				end
			end)
		end
	end, { v_u_30.onPressedOutside, v_u_31.anchor })
	v_u_18.useEffect(function()
		-- upvalues: (copy) v_u_52
		return function()
			-- upvalues: (ref) v_u_52
			if v_u_52.current then
				v_u_52.current:Disconnect()
			end
		end
	end, {})
	local v56
	if v_u_5.FoundationPopoverContentAnchorFix then
		v56 = v_u_18.joinBindings({ v46, v51, v48 }):map(function(p57)
			local v58 = p57[1]
			local v59 = p57[2]
			local v60 = p57[3]
			return UDim2.fromOffset(v58.X - v59.X * v60.X.Offset, v58.Y - v59.Y * v60.Y.Offset)
		end)
	else
		v56 = nil
	end
	local v61
	if v_u_31.isOpen then
		local v62 = v_u_18.createElement
		local v63 = v_u_8
		local v64 = {
			["ZIndex"] = nil,
			["tag"] = "size-full",
			["Visible"] = nil,
			["testId"] = nil,
			["ZIndex"] = v37.zIndex,
			["Visible"] = v47,
			["testId"] = ("%*--container"):format(v_u_31.testId)
		}
		local v65 = {}
		local v66
		if v_u_30.onPressedOutside and v_u_31.isOpen then
			v66 = v_u_18.createElement(v_u_8, {
				["ZIndex"] = 1,
				["stateLayer"] = nil,
				["Size"] = nil,
				["tag"] = "position-center-center anchor-center-center",
				["ref"] = nil,
				["testId"] = nil,
				["stateLayer"] = {
					["affordance"] = v_u_20.None
				},
				["Size"] = UDim2.fromScale(2, 2),
				["ref"] = v55,
				["testId"] = ("%*--backdrop"):format(v_u_31.testId)
			})
		else
			v66 = nil
		end
		v65.Backdrop = v66
		local v67
		if v_u_5.FoundationPopoverOverlayShadow then
			v67 = v_u_18.createElement(v_u_8, {
				["AnchorPoint"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["ZIndex"] = 2,
				["tag"] = nil,
				["testId"] = nil,
				["AnchorPoint"] = v51,
				["Size"] = v48,
				["Position"] = v46:map(function(p68)
					return UDim2.fromOffset(p68.X, p68.Y)
				end),
				["tag"] = ("shadow-overlay-300 %*"):format(v_u_25[v_u_30.radius]),
				["testId"] = ("%*--shadow"):format(v_u_31.testId)
			})
		else
			v67 = v_u_18.createElement(v_u_6, {
				["AnchorPoint"] = nil,
				["Image"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["ZIndex"] = 2,
				["slice"] = nil,
				["imageStyle"] = nil,
				["testId"] = nil,
				["AnchorPoint"] = v51,
				["Image"] = v_u_26,
				["Size"] = v48:map(function(p69)
					-- upvalues: (ref) v_u_27
					return p69 + UDim2.fromOffset(v_u_27, v_u_27)
				end),
				["Position"] = v_u_18.joinBindings({ v46, v51 }):map(function(p70)
					-- upvalues: (ref) v_u_27
					local v71 = p70[2].X == 0 and -1 or 1
					local v72 = p70[2].Y == 0 and -1 or 1
					return UDim2.fromOffset(p70[1].X + v_u_27 / 2 * v71, p70[1].Y + v_u_27 / 2 * v72 + 2)
				end),
				["slice"] = {
					["center"] = Rect.new(v_u_27, v_u_27, v_u_27 + 1, v_u_27 + 1)
				},
				["imageStyle"] = v36.Color.Extended.Black.Black_20,
				["testId"] = ("%*--shadow"):format(v_u_31.testId)
			})
		end
		v65.Shadow = v67
		local v73
		if v34 then
			v73 = v_u_18.createElement(v_u_8, {
				["Size"] = nil,
				["Position"] = nil,
				["Rotation"] = 45,
				["ZIndex"] = 3,
				["backgroundStyle"] = nil,
				["tag"] = "anchor-center-center",
				["testId"] = nil,
				["Size"] = UDim2.fromOffset(v38, v38),
				["Position"] = v49:map(function(p74)
					return UDim2.fromOffset(p74.X, p74.Y)
				end),
				["backgroundStyle"] = v40,
				["testId"] = ("%*--arrow"):format(v_u_31.testId)
			})
		else
			v73 = nil
		end
		v65.Arrow = v73
		local v75 = v_u_18.createElement
		local v76 = v_u_8
		local v77 = {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["selection"] = nil,
			["selectionGroup"] = nil,
			["sizeConstraint"] = nil,
			["stateLayer"] = nil,
			["ZIndex"] = 4,
			["onActivated"] = nil,
			["backgroundStyle"] = nil,
			["tag"] = nil,
			["ref"] = nil,
			["testId"] = nil
		}
		if v_u_5.FoundationPopoverContentAnchorFix then
			v51 = Vector2.zero
		end
		v77.AnchorPoint = v51
		if not v_u_5.FoundationPopoverContentAnchorFix then
			v56 = v46:map(function(p78)
				return UDim2.fromOffset(p78.X, p78.Y)
			end)
		end
		v77.Position = v56
		v77.selection = v_u_30.selection
		v77.selectionGroup = v_u_30.selectionGroup
		v77.sizeConstraint = {
			["MaxSize"] = v50
		}
		v77.stateLayer = {
			["affordance"] = v_u_20.None
		}
		local v79
		if v_u_30.onPressedOutside or v_u_30.DO_NOT_USE_hasContentInputSink then
			v79 = v_u_4.noop
		else
			v79 = nil
		end
		v77.onActivated = v79
		v77.backgroundStyle = v40
		v77.tag = ("auto-xy %*"):format(v_u_25[v_u_30.radius])
		v77.ref = v42
		v77.testId = ("%*--content"):format(v_u_31.testId)
		v65.Content = v75(v76, v77, v_u_18.createElement(v_u_23, {
			["owner"] = v37
		}, v_u_30.children))
		v61 = v62(v63, v64, v65)
	else
		v61 = nil
	end
	if v35 == nil then
		return v61
	else
		return v_u_19.createPortal(v61, v35)
	end
end)