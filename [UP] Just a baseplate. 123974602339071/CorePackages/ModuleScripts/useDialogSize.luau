-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.useDialogSize
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
return function(p_u_3) -- name: useDialogSize
	-- upvalues: (copy) v_u_2
	local v4, v_u_5 = v_u_2.useBinding(Vector2.new(0, 0))
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_3, (copy) v_u_5
		local v_u_6 = p_u_3.current
		if v_u_6 then
			local function v8() -- name: updateDialogSize
				-- upvalues: (copy) v_u_6, (ref) v_u_5
				local v7 = v_u_6.AbsoluteSize
				if v7.X ~= 0 and v7.Y ~= 0 then
					v_u_5(v7)
				end
			end
			local v9 = v_u_6.AbsoluteSize
			if v9.X ~= 0 and v9.Y ~= 0 then
				v_u_5(v9)
			end
			local v_u_10 = v_u_6:GetPropertyChangedSignal("AbsoluteSize"):Connect(v8)
			return function()
				-- upvalues: (copy) v_u_10
				v_u_10:Disconnect()
			end
		end
	end, {})
	return v4
end