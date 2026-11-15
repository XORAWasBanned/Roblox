-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.ContentPlugin.usePluginAnchor
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactRoblox)
local v_u_5 = require(v1.Providers.Overlay.OverlayContext)
require(v1.Utility.Plugin.StudioUri)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Providers.StudioWidgets.useUniqueWidget)
return function(p_u_8, p9) -- name: usePluginAnchor
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6, (copy) v_u_4
	local v_u_10 = v_u_3.useContext(v_u_5)
	local v_u_11
	if p_u_8 == nil then
		v_u_11 = false
	else
		v_u_11 = typeof(p_u_8) ~= "Instance"
	end
	local v12 = v_u_3.useRef(nil)
	if not v_u_11 and typeof(p_u_8) == "Instance" then
		v12.current = p_u_8
	end
	local v13, v_u_14 = v_u_3.useState(nil)
	local v15 = v_u_3.useRef(nil)
	v15.current = v13
	local v17 = v_u_3.useCallback(function(p16)
		-- upvalues: (copy) v_u_14
		v_u_14(p16)
	end, { v_u_14 })
	local v18 = v_u_7
	local v19 = {}
	if v_u_11 then
		v12 = v15
	end
	v19.forwardRef = v12
	local v20 = v18(v19)
	local v21, v_u_22 = v_u_3.useState(Vector2.zero)
	local v23, v_u_24 = v_u_3.useState(Vector2.one)
	local v25, v_u_26 = v_u_3.useState(Vector2.zero)
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) v_u_11, (copy) p_u_8, (copy) v_u_22, (copy) v_u_24
		if v_u_11 and p_u_8 ~= nil then
			local v_u_27 = p_u_8
			local function v28() -- name: updateFromAnchor
				-- upvalues: (ref) v_u_22, (copy) v_u_27, (ref) v_u_24
				v_u_22(v_u_27.AbsolutePosition)
				v_u_24(v_u_27.AbsoluteSize)
			end
			v_u_22(v_u_27.AbsolutePosition)
			v_u_24(v_u_27.AbsoluteSize)
			local v_u_29 = v_u_27:GetPropertyChangedSignal("AbsolutePosition"):Connect(v28)
			local v_u_30 = v_u_27:GetPropertyChangedSignal("AbsoluteSize"):Connect(v28)
			return function()
				-- upvalues: (copy) v_u_29, (copy) v_u_30
				v_u_29:Disconnect()
				v_u_30:Disconnect()
			end
		end
	end, { p_u_8, v_u_11 })
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) v_u_11, (copy) v_u_10
		if v_u_11 then
			v_u_10.requestOverlay()
		end
	end, { v_u_10.requestOverlay, v_u_11 })
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) v_u_11, (copy) v_u_10, (copy) v_u_26
		if v_u_11 then
			local v_u_31 = v_u_10.instance
			if v_u_31 ~= nil and v_u_31:IsA("GuiObject") then
				local function v32() -- name: updateOffset
					-- upvalues: (ref) v_u_26, (copy) v_u_31
					v_u_26(v_u_31.AbsolutePosition)
				end
				v_u_26(v_u_31.AbsolutePosition)
				local v_u_33 = v_u_31:GetPropertyChangedSignal("AbsolutePosition"):Connect(v32)
				return function()
					-- upvalues: (copy) v_u_33
					v_u_33:Disconnect()
				end
			end
			v_u_26(Vector2.zero)
		end
	end, { v_u_10.instance, v_u_11 })
	local v34
	if p_u_8 == nil then
		v34 = false
	else
		v34 = not v_u_11 or v_u_10.instance ~= nil
	end
	local v35
	if v_u_11 and v_u_10.instance then
		local v36 = v_u_3.createElement(v_u_6, {
			["Position"] = nil,
			["Size"] = nil,
			["Visible"] = true,
			["ref"] = nil,
			["Position"] = UDim2.fromOffset(v21.X - v25.X, v21.Y - v25.Y),
			["Size"] = UDim2.fromOffset(v23.X, v23.Y),
			["ref"] = v17
		})
		v35 = v_u_4.createPortal(v36, v_u_10.instance)
	else
		v35 = nil
	end
	local v37 = {}
	local v38
	if p9 == nil then
		v38 = v20.uri
	else
		v38 = p9
	end
	v37.uri = v38
	v37.element = v35
	v37.isVirtual = v_u_11
	v37.isReady = p9 ~= nil and true or v34
	return v37
end