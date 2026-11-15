-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.ContentPlugin.ContentPlugin
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactRoblox)
local v_u_5 = require(v1.Enums.ElevationLayer)
local v_u_6 = require(v1.Providers.StudioPanels.PluginPopoverParentContext)
local v_u_7 = require(v1.Enums.PopoverAlign)
local v_u_8 = require(script.Parent.Parent.PopoverArrow)
require(script.Parent.Parent.Content)
local v_u_9 = require(script.Parent.Parent.PopoverContext)
local v_u_10 = require(script.Parent.Parent.PopoverShadow)
local v_u_11 = require(v1.Enums.PopoverSide)
local v_u_12 = require(script.Parent.getPanelPosition)
local v_u_13 = require(v1.Providers.Overlay.useOverlay)
local v_u_14 = require(v1.Providers.StudioPanels.usePanel)
local v_u_15 = require(v1.Providers.StudioPanels.usePanelsContext)
local v_u_16 = require(v1.Providers.Style.StyleSheetContext).useStyleSheet
local v17 = require(v1.Constants)
local v_u_18 = require(v1.Utility.Flags)
local v_u_19 = require(v1.Utility.Logger)
local v20 = require(v1.Enums.Radius)
require(v1.Utility.Plugin.StudioUri)
local v_u_21 = require(v1.Components.View)
local v_u_22 = require(v1.Providers.Elevation.elevation)
local v_u_23 = require(script.Parent.Parent.positioning)
local v_u_24 = require(script.Parent.useArrowPosition)
local v_u_25 = require(v1.Providers.Elevation.useElevation)
require(v1.Components.Popover.useFloating)
local v_u_26 = require(script.Parent.usePanelSizing)
local v_u_27 = require(script.Parent.usePluginAnchor)
local v_u_28 = require(v1.Providers.Style.useTokens)
local v_u_29 = require(v1.Utility.withDefaults)
local v_u_30 = require(v1.Utility.isPointInGuiObjectBounds)
local v_u_31 = require(v1.Providers.Elevation.ElevationProvider).ElevationOwnerScope
require(v1.Providers.StudioPanels.Types)
local v_u_32
if v_u_18.FoundationPopoverPluginOverlayMeasurement and v_u_18.FoundationPluginShadowSize then
	v_u_32 = v17.PLUGIN_SHADOW_SIZE
else
	v_u_32 = v17.SHADOW_SIZE
end
local v_u_33 = {
	["side"] = nil,
	["align"] = nil,
	["hasArrow"] = true,
	["radius"] = nil,
	["side"] = v_u_11.Bottom,
	["align"] = v_u_7.Center,
	["radius"] = v20.Medium
}
local v_u_34 = {
	[v20.Small] = "radius-small",
	[v20.Medium] = "radius-medium",
	[v20.Circle] = "radius-circle"
}
return v_u_3.forwardRef(function(p35, p36) -- name: PopoverContentPlugin
	-- upvalues: (copy) v_u_29, (copy) v_u_33, (copy) v_u_15, (copy) v_u_18, (copy) v_u_3, (copy) v_u_6, (copy) v_u_9, (copy) v_u_16, (copy) v_u_28, (copy) v_u_25, (copy) v_u_5, (copy) v_u_22, (copy) v_u_13, (copy) v_u_11, (copy) v_u_7, (copy) v_u_27, (copy) v_u_12, (copy) v_u_32, (copy) v_u_19, (copy) v_u_14, (copy) v_u_26, (copy) v_u_30, (copy) v_u_23, (copy) v_u_24, (copy) v_u_4, (copy) v_u_21, (copy) v_u_10, (copy) v_u_34, (copy) v_u_8, (copy) v_u_31
	local v_u_37 = v_u_29(p35, v_u_33)
	local v_u_38 = v_u_15()
	local v39
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v39 = v_u_3.useContext(v_u_6)
	else
		v39 = nil
	end
	local v40
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v40 = v39.id
	else
		v40 = v_u_3.useContext(v_u_6)
	end
	local v_u_41 = v_u_3.useContext(v_u_9)
	local v42 = v_u_16()
	local v43 = v_u_28()
	local v44 = v_u_25(v_u_5.Popover, {
		["stackAboveOwner"] = true
	})
	local v45 = v_u_22.getRelativeIndex(v44)
	local v_u_46, v47 = v_u_3.useState(nil)
	v_u_3.useImperativeHandle(p36, function()
		-- upvalues: (copy) v_u_46
		return v_u_46
	end, { v_u_46 })
	local v_u_48
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v_u_48 = v_u_13()
	else
		v_u_48 = nil
	end
	local v_u_49
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v_u_49 = v_u_3.useMemo(function()
			local v50 = Instance.new("Frame")
			v50.Name = "PopoverPluginContainer"
			v50.BackgroundTransparency = 1
			v50.BorderSizePixel = 0
			v50.ClipsDescendants = false
			v50.Position = UDim2.fromOffset(-10000, -10000)
			return v50
		end, {})
	else
		v_u_49 = nil
	end
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v_u_3.useEffect(function()
			-- upvalues: (copy) v_u_49
			return function()
				-- upvalues: (ref) v_u_49
				v_u_49:Destroy()
			end
		end, { v_u_49 })
	end
	local v51, v_u_52, v53, v_u_54, v_u_55, v_u_56
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		local v57
		v51, v57 = v_u_3.useBinding(UDim2.new())
		v_u_52 = v57
		local v58
		v53, v58 = v_u_3.useBinding(UDim2.new())
		v_u_54 = v58
		v_u_55, v_u_56 = v_u_3.useState(nil)
	else
		v_u_55 = nil
		v_u_56 = nil
		v53 = nil
		v51 = nil
		v_u_52 = nil
		v_u_54 = nil
	end
	local v59 = v43.Size.Size_200
	local v_u_60 = v59 * 1.4142135623730951 / 2
	local v61 = v_u_37.backgroundStyle or v43.Color.Surface.Surface_100
	local v_u_62, v63, v_u_64, v_u_65
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		if v_u_37.side then
			v_u_62 = v_u_37.side
		else
			v_u_62 = v_u_11.Bottom
		end
		if v_u_37.align then
			v63 = v_u_37.align
		else
			v63 = v_u_7.Center
		end
		v_u_64 = type(v_u_62) ~= "table" and 0 or v_u_62.offset
		if type(v63) == "table" then
			v_u_65 = v63.offset
		else
			v_u_65 = 0
		end
	else
		v_u_64 = nil
		v_u_65 = nil
		v_u_62 = nil
		v63 = nil
	end
	local v_u_66
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		if type(v_u_62) == "table" then
			v_u_66 = v_u_62.position
		else
			v_u_66 = v_u_62
		end
		if type(v63) == "table" then
			v63 = v63.position
		end
	else
		local v67 = v_u_37.side
		if type(v67) == "table" then
			v_u_66 = v_u_37.side.position
		else
			v_u_66 = v_u_37.side or v_u_11.Bottom
		end
		local v68 = v_u_37.align
		if type(v68) == "table" then
			v63 = v_u_37.align.position
		else
			v63 = v_u_37.align or v_u_7.Center
		end
	end
	local v69 = v63 == v_u_7.Center and 0.5 or (v63 == v_u_7.End and 1 or 0)
	local v70 = v_u_41.anchorUri
	local v71 = v_u_27(v_u_41.anchor, v70)
	local v_u_72
	if v71.isVirtual then
		v_u_72 = false
	else
		v_u_72 = v_u_37.hasArrow
	end
	local v_u_73, v_u_74, v_u_75
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v_u_73 = v_u_41.isOpen and v71.isReady
		if v_u_73 then
			v_u_73 = v39.ready
		end
		if v_u_73 then
			v_u_74 = v_u_48 ~= nil
		end
		if v_u_74 then
			v_u_75 = v_u_55 == nil
		end
		v_u_3.useEffect(function()
			-- upvalues: (ref) v_u_73, (ref) v_u_56
			if not v_u_73 then
				v_u_56(nil)
			end
		end, { v_u_73 })
	else
		v_u_75 = nil
		v_u_73 = nil
		v_u_74 = nil
	end
	local v76
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		local v77 = v_u_3.useCallback
		local function v80(p78)
			-- upvalues: (ref) v_u_18, (ref) v_u_75, (ref) v_u_56
			if v_u_18.FoundationPopoverRecomputeContentSize or v_u_75 then
				local v79 = p78.AbsoluteSize
				if v79.X > 0 and v79.Y > 0 then
					v_u_56(v79)
				end
			end
		end
		local v81 = {}
		local v82
		if v_u_18.FoundationPopoverRecomputeContentSize then
			v82 = nil
		else
			v82 = v_u_75
		end
		__set_list(v81, 1, {v82})
		v76 = v77(v80, v81)
	else
		v76 = nil
	end
	local v83 = v_u_3.useMemo
	local function v86()
		-- upvalues: (ref) v_u_12, (ref) v_u_18, (ref) v_u_62, (copy) v_u_37, (ref) v_u_11, (ref) v_u_7, (ref) v_u_32, (copy) v_u_72, (copy) v_u_60
		local v84 = v_u_12
		local v85
		if v_u_18.FoundationPopoverPluginOverlayMeasurement then
			v85 = v_u_62
		else
			v85 = v_u_37.side or v_u_11.Bottom
		end
		return v84(v85, v_u_37.align or v_u_7.Start, nil, v_u_32, not v_u_72 and 0 or v_u_60)
	end
	local v87 = {}
	if not v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v_u_62 = v_u_37.side
	end
	__set_list(v87, 1, {v_u_62, v_u_37.align, v_u_72, v_u_60})
	local v88 = v83(v86, v87)
	local v96 = v_u_3.useCallback(function(p89, p90, p91, p92, p93, p94)
		-- upvalues: (copy) v_u_38, (ref) v_u_18
		local v95 = v_u_38.registerPopoverAsync
		if not v_u_18.FoundationPopoverPluginFocusable then
			p94 = nil
		end
		return v95(p89, p90, p91, p92, p93, p94)
	end, { v_u_38.registerPopoverAsync })
	local v_u_97 = v_u_3.useRef(false)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_37, (copy) v_u_97, (ref) v_u_19
		if not (v_u_37.onPressedOutside or v_u_97.current) then
			v_u_97.current = true
			v_u_19:warning("PopoverContent rendered in a plugin context without onPressedOutside. In Studio, the QWidget popup will close on focus loss, but the parent\'s isOpen state will not update. Provide onPressedOutside to stay in sync.")
		end
	end, { v_u_37.onPressedOutside })
	local v99 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_37, (ref) v_u_18, (copy) v_u_41
		if v_u_37.onPressedOutside then
			if v_u_18.FoundationPopoverClickOutsideInGuiShadow then
				local v98 = v_u_41.anchor
				if typeof(v98) == "Instance" and v_u_41.anchor.GuiState ~= Enum.GuiState.Idle then
					return
				end
			end
			v_u_37.onPressedOutside()
		end
	end, { v_u_37.onPressedOutside, v_u_41.anchor })
	local v100 = v45 == nil and 0 or v45
	local v101 = v_u_14
	local v102 = {}
	local v103 = not v_u_18.FoundationPopoverPluginOverlayMeasurement and v_u_41.isOpen
	if v103 then
		v103 = v71.isReady
	end
	v102.isOpen = v103
	v102.onClose = v99
	v102.anchorUri = v71.uri
	v102.registerPanelAsync = v96
	v102.position = v88
	v102.depth = v100
	v102.parentPopoverId = v40
	local v104
	if v_u_18.FoundationPopoverPluginFocusable then
		v104 = v_u_37.isFocusable
	else
		v104 = nil
	end
	v102.isFocusable = v104
	local v_u_105 = v101(v102)
	if not v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v51, v53 = v_u_26(v_u_37.side, v_u_37.align, v_u_46, not v_u_72 and 0 or v_u_60, v_u_105)
	end
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_18, (copy) v_u_105, (copy) v_u_37, (copy) v_u_46, (ref) v_u_30
		if v_u_18.FoundationPopoverClickOutsideInGuiShadow then
			if v_u_105 and (v_u_105.container and v_u_37.onPressedOutside) then
				local v_u_107 = v_u_105.container.InputBegan:Connect(function(p106)
					-- upvalues: (ref) v_u_46, (ref) v_u_30, (ref) v_u_37
					if p106.UserInputType == Enum.UserInputType.MouseButton1 then
						if v_u_46 then
							if not v_u_30(v_u_46, (Vector2.new(p106.Position.X, p106.Position.Y))) then
								v_u_37.onPressedOutside()
							end
						end
					else
						return
					end
				end)
				return function()
					-- upvalues: (copy) v_u_107
					v_u_107:Disconnect()
				end
			end
		end
	end, { v_u_105, v_u_46, v_u_37.onPressedOutside })
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v_u_3.useLayoutEffect(function()
			-- upvalues: (ref) v_u_75, (copy) v_u_46, (ref) v_u_56
			if v_u_75 and v_u_46 ~= nil then
				local v108 = v_u_46.AbsoluteSize
				if v108.X > 0 and v108.Y > 0 then
					v_u_56(v108)
				end
			end
		end, { v_u_75, v_u_46 })
	end
	local v_u_109
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v_u_109 = v_u_3.useMemo(function()
			-- upvalues: (ref) v_u_55, (ref) v_u_23, (ref) v_u_66, (ref) v_u_64, (ref) v_u_65, (copy) v_u_72, (copy) v_u_60, (ref) v_u_32
			if v_u_55 then
				return v_u_23.calculatePopoverBounds(v_u_66, v_u_64, v_u_65, not v_u_72 and 0 or v_u_60, v_u_55) + Vector2.new(v_u_32 * 2, v_u_32 * 2)
			else
				return nil
			end
		end, {
			v_u_55,
			v_u_66,
			v_u_64,
			v_u_65,
			v_u_72,
			v_u_60
		})
	else
		v_u_109 = nil
	end
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v_u_3.useLayoutEffect(function()
			-- upvalues: (ref) v_u_55, (copy) v_u_109, (ref) v_u_54, (ref) v_u_52, (copy) v_u_105
			if v_u_55 == nil or v_u_109 == nil then
				v_u_54(UDim2.new())
				v_u_52(UDim2.new())
			else
				v_u_54(UDim2.fromOffset(v_u_55.X, v_u_55.Y))
				v_u_52(UDim2.fromOffset(v_u_109.X, v_u_109.Y))
				if v_u_105 then
					v_u_105.setSizeAsync(v_u_109)
				end
			end
		end, { v_u_55, v_u_109, v_u_105 })
		v_u_3.useLayoutEffect(function()
			-- upvalues: (ref) v_u_74, (copy) v_u_49, (copy) v_u_105, (copy) v_u_109, (copy) v_u_48
			if v_u_74 then
				if v_u_105 and v_u_109 then
					v_u_49.AutomaticSize = Enum.AutomaticSize.None
					v_u_49.Size = UDim2.fromOffset(v_u_109.X, v_u_109.Y)
					v_u_49.Position = UDim2.new()
					v_u_49.Parent = v_u_105.container
				else
					v_u_49.AutomaticSize = Enum.AutomaticSize.XY
					v_u_49.Size = UDim2.new()
					v_u_49.Position = UDim2.fromOffset(-10000, -10000)
					v_u_49.Parent = v_u_48
				end
			else
				v_u_49.Parent = nil
				return
			end
		end, {
			v_u_74,
			v_u_48,
			v_u_105,
			v_u_109,
			v_u_49
		})
	end
	local v110
	if v71.isVirtual then
		v110 = nil
	else
		local v111 = v_u_41.anchor
		if typeof(v111) == "Instance" then
			v110 = v_u_41.anchor
		else
			v110 = nil
		end
	end
	local v112 = v_u_24(v53, v_u_66, v_u_37.radius, v69, v_u_60, v110)
	local v_u_113
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		if v_u_105 == nil then
			v_u_113 = false
		else
			v_u_113 = v_u_109 ~= nil
		end
	else
		v_u_113 = true
	end
	if not v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v_u_74 = v_u_105 ~= nil
	end
	if not v_u_18.FoundationPopoverPluginOverlayMeasurement then
		if v_u_105 then
			v_u_49 = v_u_105.container
		else
			v_u_49 = nil
		end
	end
	local v114
	if v_u_18.FoundationPopoverPluginOverlayMeasurement then
		v114 = v_u_3.useMemo(function()
			-- upvalues: (copy) v_u_105, (copy) v_u_113
			local v115 = {}
			local v116
			if v_u_105 then
				v116 = v_u_105.popoverId
			else
				v116 = nil
			end
			v115.id = v116
			v115.ready = v_u_113
			return v115
		end, { v_u_105, v_u_113 })
	else
		v114 = nil
	end
	local v117
	if v_u_74 and v_u_49 then
		local v118 = v_u_4.createPortal
		local v119 = v_u_3.createElement
		local v120 = v_u_3.Fragment
		local v121 = nil
		local v122 = {
			["StyleLink"] = v_u_3.createElement("StyleLink", {
				["StyleSheet"] = v42
			})
		}
		local v123 = v_u_3.createElement
		local v124 = v_u_21
		local v125 = {}
		local v126
		if v_u_18.FoundationPopoverPluginOverlayMeasurement and v_u_109 == nil then
			v126 = Enum.AutomaticSize.XY
		else
			v126 = nil
		end
		v125.AutomaticSize = v126
		if v_u_18.FoundationPopoverPluginOverlayMeasurement and v_u_109 == nil then
			v51 = nil
		end
		v125.Size = v51
		v125.testId = ("%*--container"):format(v_u_41.testId)
		local v127 = {
			["Shadow"] = v_u_3.createElement(v_u_10, {
				["contentSize"] = nil,
				["position"] = nil,
				["radiusTag"] = nil,
				["ZIndex"] = 1,
				["testId"] = nil,
				["contentSize"] = v53,
				["position"] = UDim2.fromOffset(v_u_32 / 2, v_u_32 / 2 + (v_u_18.FoundationPopoverPluginOverlayMeasurement and v_u_18.FoundationPluginShadowSize and 0 or 2)),
				["radiusTag"] = v_u_34[v_u_37.radius],
				["testId"] = ("%*--shadow"):format(v_u_41.testId)
			})
		}
		local v128
		if v_u_72 then
			v128 = v_u_3.createElement(v_u_8, {
				["size"] = nil,
				["position"] = nil,
				["ZIndex"] = 2,
				["backgroundStyle"] = nil,
				["testId"] = nil,
				["size"] = v59,
				["position"] = v112,
				["backgroundStyle"] = v61,
				["testId"] = ("%*--arrow"):format(v_u_41.testId)
			})
		else
			v128 = nil
		end
		v127.Arrow = v128
		local v129 = v_u_3.createElement
		local v130 = v_u_21
		local v131 = {
			["tag"] = nil,
			["Position"] = nil,
			["ref"] = nil,
			["onAbsoluteSizeChanged"] = nil,
			["backgroundStyle"] = nil,
			["ZIndex"] = 3,
			["testId"] = nil,
			["tag"] = ("auto-xy %*"):format(v_u_34[v_u_37.radius]),
			["Position"] = UDim2.fromOffset(v_u_32, v_u_32),
			["ref"] = v47
		}
		if not v_u_18.FoundationPopoverPluginOverlayMeasurement then
			v76 = nil
		end
		v131.onAbsoluteSizeChanged = v76
		v131.backgroundStyle = v61
		v131.testId = ("%*--content"):format(v_u_41.testId)
		local v132 = v_u_3.createElement
		local v133 = v_u_6.Provider
		local v134 = {}
		if not v_u_18.FoundationPopoverPluginOverlayMeasurement then
			v114 = v_u_105.popoverId
		end
		v134.value = v114
		v127.Content = v129(v130, v131, v132(v133, v134, {
			["Nested"] = v_u_3.createElement(v_u_31, {
				["owner"] = v44
			}, v_u_37.children)
		}))
		v122.Container = v123(v124, v125, v127)
		local v135 = v119(v120, v121, v122)
		if not v_u_18.FoundationPopoverPluginOverlayMeasurement then
			v_u_49 = v_u_105.container
		end
		v117 = v118(v135, v_u_49)
	else
		v117 = nil
	end
	return v_u_3.createElement(v_u_3.Fragment, nil, {
		["Anchor"] = v71.element,
		["Panel"] = v117
	})
end)