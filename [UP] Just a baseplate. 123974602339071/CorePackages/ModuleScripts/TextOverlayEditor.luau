-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.TextOverlay.TextOverlayEditor
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = game:GetService("TextService")
local v_u_4 = require(v2.Dash)
local v_u_5 = require(v2.Foundation)
local v6 = require(v2.MomentsCommon)
local v_u_7 = require(v2.React)
local v_u_8 = v_u_7.useBinding
local v_u_9 = v_u_7.useCallback
local v_u_10 = v6.Hooks.useDeviceInsets
local v_u_11 = require(v1.Hooks.useEffectOnce)
local v_u_12 = require(v1.Hooks.useOnScreenKeyboardHeight)
local v_u_13 = v_u_7.useRef
local v_u_14 = v_u_7.useState
local v_u_15 = v_u_5.Hooks.useTokens
local v_u_16 = v_u_5.Knob
local v_u_17 = v_u_5.Slider
local v_u_18 = v_u_5.View
local v_u_19 = v6.TextOverlay
return function(p_u_20) -- name: TextOverlayEditor
	-- upvalues: (copy) v_u_10, (copy) v_u_15, (copy) v_u_13, (copy) v_u_8, (copy) v_u_14, (copy) v_u_12, (copy) v_u_9, (copy) v_u_4, (copy) v_u_11, (copy) v_u_7, (copy) v_u_3, (copy) v_u_18, (copy) v_u_5, (copy) v_u_17, (copy) v_u_16, (copy) v_u_19
	local v21 = v_u_10()
	local v22 = v_u_15()
	local v_u_23 = v_u_13(nil)
	local v24, v_u_25 = v_u_8(UDim2.fromOffset(0, 0))
	local v_u_26, v_u_27 = v_u_14(Vector2.new(0, 0))
	local v_u_28 = v_u_12()
	local v_u_29 = p_u_20.textOverlayEdits
	if v_u_29 then
		v_u_29 = p_u_20.textOverlayEdits[1]
	end
	local v_u_30 = v_u_9(function()
		-- upvalues: (copy) v_u_23
		if v_u_23.current then
			v_u_23.current:CaptureFocus()
		end
	end, {})
	local v36 = v_u_9(function(p31)
		-- upvalues: (copy) p_u_20, (ref) v_u_4, (copy) v_u_29
		local v32 = utf8.len(p31.Text)
		if v32 ~= nil and v32 >= 100 then
			local v33 = utf8.offset(p31.Text, 101)
			local v34 = p31.Text
			local v35 = v33 - 1
			p31.Text = string.sub(v34, 1, v35)
		end
		p_u_20.onTextOverlayUpdated({ v_u_4.joinDeep(v_u_29, {
				["text"] = p31.Text
			}) })
	end, { v_u_29, p_u_20.onTextOverlayUpdated })
	local v40 = v_u_9(function(p37)
		-- upvalues: (copy) p_u_20, (ref) v_u_4, (copy) v_u_29
		if p_u_20.textOverlayEdits then
			local v38 = {
				["textOverlayStyle"] = {
					["fontSize"] = p37
				}
			}
			local v39 = { (v_u_4.joinDeep(v_u_29, v38)) }
			p_u_20.onTextOverlayUpdated(v39)
		end
	end, { p_u_20.onTextOverlayUpdated, v_u_29 })
	local v42 = v_u_9(function(p41)
		-- upvalues: (copy) v_u_27
		v_u_27(p41.AbsoluteSize)
	end, {})
	local v43 = v_u_11
	local function v44()
		-- upvalues: (copy) v_u_30
		v_u_30()
	end
	local v45
	if v_u_23.current == nil then
		v45 = false
	else
		v45 = p_u_20.textOverlayEdits ~= nil
	end
	v43(v44, v45)
	v_u_7.useEffect(function()
		-- upvalues: (copy) v_u_29, (copy) v_u_28, (copy) v_u_25, (ref) v_u_3, (copy) v_u_26
		if v_u_29 then
			if v_u_28 == 0 then
				v_u_25(UDim2.fromOffset(0, 0))
			else
				local v46 = v_u_3:GetTextSize("W", v_u_29.textOverlayStyle.fontSize, v_u_29.textOverlayStyle.font, Vector2.new(v_u_26.X, v_u_26.Y))
				local v47 = v_u_25
				local v48 = UDim2.fromOffset
				local v49 = v46.X * 30
				local v50 = v_u_26.X / 2
				local v51 = math.min(v49, v50)
				local v52 = v46.Y * 5
				local v53 = v_u_26.Y / 2
				v47(v48(v51, (math.min(v52, v53))))
			end
		else
			return
		end
	end, { v_u_26, v_u_29, v_u_28 })
	if not p_u_20.textOverlayEdits then
		return nil
	end
	local v54 = v_u_7.createElement
	local v55 = v_u_18
	local v56 = {
		["onAbsoluteSizeChanged"] = nil,
		["stateLayer"] = nil,
		["tag"] = "bg-over-media-0 size-full",
		["ZIndex"] = nil,
		["onAbsoluteSizeChanged"] = v42,
		["stateLayer"] = {
			["affordance"] = v_u_5.Enums.StateLayerAffordance.None
		},
		["ZIndex"] = p_u_20.zIndex or 1
	}
	local v57 = {}
	local v58
	if v_u_28 == 0 then
		local v59 = v_u_7.createElement
		local v60 = v_u_18
		local v61 = {}
		local v62 = v_u_7.createElement
		local v63 = {
			["PaddingTop"] = UDim.new(0, v22.Padding.XLarge),
			["PaddingBottom"] = UDim.new(0, v22.Padding.XLarge)
		}
		local v64 = UDim.new
		local v65 = v21.left
		local v66 = v22.Padding.XLarge
		v63.PaddingLeft = v64(0, (math.max(v65, v66)))
		local v67 = UDim.new
		local v68 = v21.right
		local v69 = v22.Padding.XLarge
		v63.PaddingRight = v67(0, (math.max(v68, v69)))
		v61.Padding = v62("UIPadding", v63)
		v61.FontSizeSlider = v_u_7.createElement(v_u_17, {
			["knob"] = nil,
			["knobVisibility"] = nil,
			["LayoutOrder"] = 2,
			["onValueChanged"] = nil,
			["size"] = nil,
			["range"] = nil,
			["value"] = nil,
			["variant"] = nil,
			["knob"] = v_u_7.createElement(v_u_16, {
				["size"] = v_u_5.Enums.InputSize.Large
			}),
			["knobVisibility"] = v_u_5.Enums.Visibility.Always,
			["onValueChanged"] = v40,
			["size"] = v_u_5.Enums.InputSize.XSmall,
			["range"] = NumberRange.new(10, 32),
			["value"] = p_u_20.textOverlayEdits[1].textOverlayStyle.fontSize,
			["variant"] = v_u_5.Enums.SliderVariant.Standard
		})
		v58 = v59(v60, {
			["tag"] = "auto-y anchor-bottom-center col gap-large position-bottom-center size-full-0"
		}, v61)
	else
		v58 = nil
	end
	v57.Controls = v58
	v57.TextOverlay = v_u_7.createElement(v_u_19, {
		["editable"] = true,
		["onActivated"] = nil,
		["size"] = nil,
		["textOverlayEdit"] = nil,
		["onTextChanged"] = nil,
		["textBoxRef"] = nil,
		["onActivated"] = v_u_30,
		["size"] = v24,
		["textOverlayEdit"] = v_u_4.joinDeep(v_u_29, {
			["position"] = nil,
			["rotation"] = 0,
			["scale"] = 1,
			["position"] = UDim2.fromScale(0.5, 0.5)
		}),
		["onTextChanged"] = v36,
		["textBoxRef"] = v_u_23
	})
	return v54(v55, v56, v57)
end