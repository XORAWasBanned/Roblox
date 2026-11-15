-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Interactable.Interactable
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
require(v1.Components.Types)
local v_u_5 = require(v1.Utility.blendColors)
local v_u_6 = require(script.Parent.getOriginalBackgroundStyle)
local v_u_7 = require(script.Parent.getStateLayerStyle)
local v_u_8 = require(v1.Utility.joinBindables)
local v_u_9 = require(v1.Utility.mapBindable)
local v_u_10 = require(v1.Providers.Cursor.useCursor)
local v_u_11 = require(v1.Utility.Control.useGuiControlState)
local v_u_12 = require(v1.Providers.Style.useTokens)
local v_u_13 = require(v1.Utility.withDefaults)
local v_u_14 = require(v1.Enums.StateLayerAffordance)
require(v1.Enums.StateLayerMode)
local v_u_15 = require(v1.Enums.ControlState)
local v_u_16 = {
	["component"] = "ImageButton",
	["isDisabled"] = false
}
local v_u_17 = Color3.fromRGB(163, 162, 165)
return v_u_4.memo(v_u_4.forwardRef(function(p18, p19) -- name: Interactable
	-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_4, (copy) v_u_12, (copy) v_u_10, (copy) v_u_15, (copy) v_u_17, (copy) v_u_6, (copy) v_u_14, (copy) v_u_7, (copy) v_u_5, (copy) v_u_8, (copy) v_u_11, (copy) v_u_9, (copy) v_u_3
	local v_u_20 = v_u_13(p18, v_u_16)
	local v_u_21 = v_u_4.useRef(nil)
	local v_u_22 = v_u_12()
	local v23 = v_u_10(v_u_20.cursor)
	local v_u_24, v_u_25 = v_u_4.useBinding(v_u_15.Initialize)
	local v_u_26 = v_u_4.useRef(nil)
	local v30 = v_u_4.useCallback(function(p27)
		-- upvalues: (copy) v_u_24, (ref) v_u_15, (copy) v_u_21, (ref) v_u_17, (copy) v_u_26, (copy) v_u_25, (copy) v_u_20
		if v_u_24:getValue() == v_u_15.Default and v_u_21.current ~= nil then
			local v28 = v_u_21.current:GetStyled("BackgroundColor3")
			local v29 = v_u_21.current:GetStyled("BackgroundTransparency")
			if v28 ~= v_u_17 or v29 ~= 0 then
				v_u_26.current = {
					["Color3"] = v28,
					["Transparency"] = v29
				}
			end
		end
		v_u_25(p27)
		if v_u_20.onStateChanged ~= nil then
			v_u_20.onStateChanged(p27)
		end
	end, { v_u_20.onStateChanged })
	local v_u_31 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_20
		return v_u_6(v_u_20.BackgroundColor3, v_u_20.BackgroundTransparency)
	end, { v_u_20.BackgroundColor3, v_u_20.BackgroundTransparency })
	local v_u_39 = v_u_4.useCallback(function(p32, p33, p34, p35)
		-- upvalues: (ref) v_u_15, (ref) v_u_14, (copy) v_u_26, (ref) v_u_7, (copy) v_u_22, (ref) v_u_5
		if p32 == v_u_15.Initialize or (p32 == v_u_15.Default or (p32 == v_u_15.Disabled or p35 == v_u_14.None)) then
			return p33
		end
		local v36 = {
			["Color3"] = p33.Color3,
			["Transparency"] = p33.Transparency
		}
		if p33.Color3 == nil then
			local v37
			if v_u_26.current then
				v37 = v_u_26.current.Color3
			else
				v37 = nil
			end
			v36.Color3 = v37
		end
		if p33.Transparency == nil then
			local v38
			if v_u_26.current then
				v38 = v_u_26.current.Transparency
			else
				v38 = nil
			end
			v36.Transparency = v38
		end
		return v_u_5(v36, (v_u_7(v_u_22, p34, p32)))
	end, { v_u_22, v_u_20.BackgroundColor3, v_u_20.BackgroundTransparency })
	local v40 = v_u_4.useMemo
	local function v46()
		-- upvalues: (ref) v_u_8, (copy) v_u_24, (copy) v_u_31, (copy) v_u_20, (copy) v_u_39
		local v41 = v_u_8
		local v42 = {
			["controlState"] = v_u_24,
			["backgroundStyle"] = v_u_31
		}
		local v43
		if v_u_20.stateLayer then
			v43 = v_u_20.stateLayer.mode
		else
			v43 = nil
		end
		v42.mode = v43
		local v44
		if v_u_20.stateLayer then
			v44 = v_u_20.stateLayer.affordance
		else
			v44 = nil
		end
		v42.affordance = v44
		return v41(v42, function(p45)
			-- upvalues: (ref) v_u_39
			return v_u_39(p45.controlState, p45.backgroundStyle, p45.mode, p45.affordance)
		end)
	end
	local v47 = {}
	local v48
	if v_u_20.stateLayer then
		v48 = v_u_20.stateLayer.mode
	else
		v48 = nil
	end
	local v49
	if v_u_20.stateLayer then
		v49 = v_u_20.stateLayer.affordance
	else
		v49 = nil
	end
	__set_list(v47, 1, {v_u_31, v_u_24, v_u_39, v48, v49})
	local v50 = v40(v46, v47)
	local v51 = v_u_11(v_u_21, v30)
	v_u_4.useImperativeHandle(p19, function()
		-- upvalues: (copy) v_u_21
		return v_u_21.current
	end, {})
	local v54 = {
		["BackgroundColor3"] = v_u_9(v50, function(p52)
			return p52.Color3
		end),
		["BackgroundTransparency"] = v_u_9(v50, function(p53)
			return p53.Transparency
		end),
		["Active"] = not v_u_20.isDisabled,
		["Interactable"] = not v_u_20.isDisabled
	}
	local v55 = v_u_4.Event.Activated
	local v56
	if v_u_20.isDisabled then
		v56 = nil
	else
		v56 = v_u_20.onActivated
	end
	v54[v55] = v56
	local v57 = v_u_4.Event.SecondaryActivated
	local v58
	if v_u_20.isDisabled then
		v58 = nil
	else
		v58 = v_u_20.onSecondaryActivated
	end
	v54[v57] = v58
	v54.ref = v51
	v54.SelectionImageObject = v_u_20.SelectionImageObject or v23
	local v59 = v_u_3.union(v_u_20, v54)
	v59.component = nil
	v59.isDisabled = nil
	v59.onActivated = nil
	v59.onSecondaryActivated = nil
	v59.onStateChanged = nil
	v59.stateLayer = nil
	v59.cursor = nil
	return v_u_4.createElement(v_u_20.component, v59)
end))