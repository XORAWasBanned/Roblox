-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.Sheet
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactUtils)
local v_u_5 = require(script.Parent.BottomSheet)
local v_u_6 = require(script.Parent.CenterSheet)
local v_u_7 = require(script.Parent.SideSheet)
local v_u_8 = require(v1.Providers.Overlay.useScreen)
local v_u_9 = require(v1.Utility.Wrappers).Services.GuiService
require(v1.Enums.DialogSize)
local v_u_10 = require(v1.Utility.withDefaults)
require(script.Parent.Types)
local v_u_11 = {
	["testId"] = "--foundation-sheet"
}
return v_u_3.memo(v_u_3.forwardRef(function(p12, p13) -- name: Sheet
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_3, (copy) v_u_8, (copy) v_u_9, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	local v_u_14 = v_u_10(p12, v_u_11)
	local v_u_15, v_u_16 = v_u_3.useState(v_u_14.isOpen == nil and true or v_u_14.isOpen)
	local v_u_17 = v_u_3.useRef(nil)
	local v_u_18 = v_u_8()
	local v19, v_u_20 = v_u_3.useState(not v_u_18 and true or v_u_18.AbsoluteSize.X > v_u_18.AbsoluteSize.Y)
	local v21, v_u_22 = v_u_3.useState(v_u_9.ViewportDisplaySize)
	v_u_3.useImperativeHandle(v_u_14.sheetRef, function()
		-- upvalues: (copy) v_u_17
		return v_u_17.current
	end, {})
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_14, (copy) v_u_17, (copy) v_u_16
		if v_u_14.isOpen == false and v_u_17.current then
			v_u_17.current.close()
		elseif v_u_14.isOpen then
			v_u_16(true)
		end
	end, { v_u_14.isOpen })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_15, (copy) v_u_14, (copy) v_u_16
		if not v_u_15 and v_u_14.isOpen then
			v_u_16(true)
		end
	end, { v_u_15 })
	v_u_4.useEventConnection(v_u_9:GetPropertyChangedSignal("ViewportDisplaySize"), function()
		-- upvalues: (copy) v_u_22, (ref) v_u_9
		v_u_22(v_u_9.ViewportDisplaySize)
	end, {})
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) v_u_18, (copy) v_u_20
		local v_u_23
		if v_u_18 then
			v_u_20(v_u_18.AbsoluteSize.X > v_u_18.AbsoluteSize.Y)
			v_u_23 = v_u_18:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: (ref) v_u_20, (ref) v_u_18
				v_u_20(v_u_18.AbsoluteSize.X > v_u_18.AbsoluteSize.Y)
			end)
		else
			v_u_23 = nil
		end
		return function()
			-- upvalues: (ref) v_u_23
			if v_u_23 then
				v_u_23:Disconnect()
			end
		end
	end, { v_u_18 })
	if v_u_15 then
		local v24 = table.clone(v_u_14)
		v24.isOpen = nil
		v24.ref = p13
		v24.sheetRef = v_u_17
		v24.displaySize = v21
		function v24.onClose()
			-- upvalues: (copy) v_u_14, (copy) v_u_16
			if v_u_14.onClose then
				v_u_14.onClose()
			end
			v_u_16(false)
		end
		if v21 == Enum.DisplaySize.Small and not v19 then
			return v_u_3.createElement(v_u_5, v24)
		elseif v_u_14.preferCenterSheet then
			return v_u_3.createElement(v_u_6, v24)
		else
			return v_u_3.createElement(v_u_7, v24)
		end
	else
		return nil
	end
end))