-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Components.TextOverlay
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v_u_3 = require(v2.Foundation)
local v_u_4 = require(v2.React)
local v_u_5 = v_u_3.View
local v_u_6 = v_u_4.useCallback
require(v1.Types)
return function(p_u_7) -- name: TextOverlay
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3
	local v_u_8 = v_u_4.useRef(nil)
	local v_u_9 = v_u_4.useRef(nil)
	local v_u_11 = v_u_6(function(_, p10)
		-- upvalues: (copy) p_u_7, (copy) v_u_9
		if p_u_7.containerRef and p_u_7.containerRef.current then
			v_u_9.current = p10
		end
	end, { p_u_7.containerRef })
	local v_u_13 = v_u_6(function(_, p12)
		-- upvalues: (copy) v_u_9, (copy) p_u_7
		if v_u_9.current == p12 and p_u_7.onActivated then
			p_u_7.onActivated()
		end
		if p_u_7.onDragEnd then
			p_u_7.onDragEnd()
		end
	end, { p_u_7.onActivated, p_u_7.onDragEnd })
	local v14 = v_u_4.useMemo(function()
		-- upvalues: (copy) p_u_7, (ref) v_u_4, (copy) v_u_8, (copy) v_u_11, (copy) v_u_13
		if p_u_7.draggable then
			return v_u_4.createElement("UIDragDetector", {
				["BoundingBehavior"] = Enum.UIDragDetectorBoundingBehavior.EntireObject,
				["BoundingUI"] = p_u_7.boundingUI,
				["DragStyle"] = Enum.UIDragDetectorDragStyle.TranslatePlane,
				["ref"] = v_u_8,
				["ReferenceUIInstance"] = p_u_7.boundingUI,
				["ResponseStyle"] = Enum.UIDragDetectorResponseStyle.Scale,
				[v_u_4.Event.DragStart] = v_u_11,
				[v_u_4.Event.DragEnd] = v_u_13
			})
		else
			return nil
		end
	end, {
		p_u_7.boundingUI,
		p_u_7.draggable,
		v_u_11,
		v_u_13
	})
	local v15 = v_u_4.createElement
	local v16 = v_u_5
	local v17 = {
		["ref"] = nil,
		["onActivated"] = nil,
		["Position"] = nil,
		["Rotation"] = nil,
		["scale"] = nil,
		["sizeConstraint"] = nil,
		["stateLayer"] = nil,
		["tag"] = "auto-xy anchor-center-center bg-contrast padding-medium position-center-center radius-medium",
		["ZIndex"] = nil,
		["ref"] = p_u_7.containerRef,
		["onActivated"] = p_u_7.onActivated,
		["Position"] = p_u_7.textOverlayEdit.position,
		["Rotation"] = p_u_7.textOverlayEdit.rotation,
		["scale"] = p_u_7.textOverlayEdit.scale * (p_u_7.additionalScale or 1),
		["sizeConstraint"] = {
			["MaxSize"] = Vector2.new(300, (1 / 0))
		},
		["stateLayer"] = {
			["affordance"] = v_u_3.Enums.StateLayerAffordance.None
		},
		["ZIndex"] = p_u_7.textOverlayEdit.zIndex
	}
	local v18 = {
		["UIDragDetector"] = v14,
		["TextInput"] = v_u_4.createElement("TextBox", {
			["AutomaticSize"] = Enum.AutomaticSize.XY,
			["BackgroundTransparency"] = 1,
			["ClearTextOnFocus"] = false,
			["ClipsDescendants"] = true,
			["Font"] = p_u_7.textOverlayEdit.textOverlayStyle.font,
			["Interactable"] = p_u_7.editable == true,
			["Text"] = p_u_7.textOverlayEdit.text,
			["TextColor3"] = p_u_7.textOverlayEdit.textOverlayStyle.fontColor,
			["TextSize"] = p_u_7.textOverlayEdit.textOverlayStyle.fontSize,
			["TextXAlignment"] = p_u_7.textOverlayEdit.textOverlayStyle.textXAlignment,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["TextWrapped"] = true,
			["Size"] = p_u_7.size,
			["ZIndex"] = p_u_7.textOverlayEdit.zIndex,
			["ref"] = p_u_7.textBoxRef,
			[v_u_4.Change.Text] = p_u_7.onTextChanged
		})
	}
	return v15(v16, v17, v18)
end