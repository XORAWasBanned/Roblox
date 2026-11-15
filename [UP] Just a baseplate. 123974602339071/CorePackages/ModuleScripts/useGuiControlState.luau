-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.Control.useGuiControlState
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactUtils).useForwardRef
local v_u_5 = require(v1.Enums.ControlState)
require(v1.Enums.ControlStateEvent)
require(v1.Components.Types)
local v_u_6 = {
	[Enum.GuiState.Idle] = v_u_5.Default,
	[Enum.GuiState.Hover] = v_u_5.Hover,
	[Enum.GuiState.Press] = v_u_5.Pressed,
	[Enum.GuiState.NonInteractable] = v_u_5.Disabled
}
return function(p7, p_u_8) -- name: useGuiControlState
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4
	local v_u_9 = v_u_3.useRef(false)
	local v_u_10 = v_u_3.useRef(v_u_5.Initialize)
	local v_u_13 = v_u_3.useCallback(function(p11)
		-- upvalues: (copy) v_u_10, (copy) v_u_9, (ref) v_u_5, (copy) p_u_8
		local v12 = v_u_10.current
		if v_u_9.current then
			if p11 == v_u_5.Default or p11 == v_u_5.Hover then
				p11 = v_u_5.Selected
			elseif p11 == v_u_5.Pressed then
				p11 = v_u_5.SelectedPressed
			end
		end
		if v12 ~= p11 then
			v_u_10.current = p11
			if p_u_8 ~= nil then
				p_u_8(p11)
			end
		end
	end, { p_u_8 })
	return v_u_4(p7, (v_u_3.useCallback(function(p_u_14)
		-- upvalues: (copy) v_u_13, (ref) v_u_6, (copy) v_u_9, (copy) v_u_10
		local v_u_15 = {}
		if p_u_14 then
			v_u_13(v_u_6[p_u_14.GuiState])
			local v16 = p_u_14:GetPropertyChangedSignal("GuiState")
			local function v17()
				-- upvalues: (ref) v_u_6, (copy) p_u_14, (ref) v_u_13
				v_u_13(v_u_6[p_u_14.GuiState])
			end
			table.insert(v_u_15, v16:Connect(v17))
			local v18 = p_u_14.SelectionGained
			local function v19()
				-- upvalues: (ref) v_u_9, (ref) v_u_13, (ref) v_u_10
				v_u_9.current = true
				v_u_13(v_u_10.current)
			end
			table.insert(v_u_15, v18:Connect(v19))
			local v20 = p_u_14.SelectionLost
			local function v21()
				-- upvalues: (ref) v_u_9, (ref) v_u_13, (ref) v_u_10
				v_u_9.current = false
				v_u_13(v_u_10.current)
			end
			table.insert(v_u_15, v20:Connect(v21))
		end
		return function()
			-- upvalues: (copy) v_u_15
			for _, v22 in v_u_15 do
				v22:Disconnect()
			end
		end
	end, { v_u_13 })))
end