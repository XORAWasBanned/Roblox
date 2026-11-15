-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Overlay.useKeyboardAwareSize
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v1.Utility.Wrappers)
local v_u_4 = v3.Services.GuiService
local v_u_5 = v3.Services.UserInputService
local v_u_6 = require(v2.React)
return function(p_u_7) -- name: useKeyboardAwareSize
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
	local v_u_8, v_u_9 = v_u_6.useBinding(UDim2.fromScale(1, 1))
	v_u_6.useLayoutEffect(function()
		-- upvalues: (copy) p_u_7, (ref) v_u_5, (copy) v_u_9, (ref) v_u_4, (copy) v_u_8
		if p_u_7 then
			local function v15() -- name: updateSafeAreaSize
				-- upvalues: (ref) v_u_5, (ref) v_u_9, (ref) v_u_4, (ref) p_u_7, (ref) v_u_8
				if v_u_5.OnScreenKeyboardVisible then
					local v10 = v_u_4:GetGuiInset()
					local v11 = v_u_5.OnScreenKeyboardPosition.Y - v10.Y
					local v12 = p_u_7.AbsoluteSize
					local v13 = p_u_7.AbsolutePosition.Y + v12.Y - v11
					local v14 = UDim2.new(1, 0, 1, -v13)
					if v_u_8:getValue() ~= v14 then
						v_u_9(v14)
					end
				else
					v_u_9(UDim2.fromScale(1, 1))
				end
			end
			v15()
			local v_u_16 = v_u_5:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(v15)
			local v_u_17 = v_u_5:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(v15)
			local v_u_18 = p_u_7:GetPropertyChangedSignal("AbsoluteSize"):Connect(v15)
			return function()
				-- upvalues: (copy) v_u_16, (copy) v_u_17, (copy) v_u_18
				v_u_16:Disconnect()
				v_u_17:Disconnect()
				v_u_18:Disconnect()
			end
		end
	end, { p_u_7 })
	return v_u_8
end