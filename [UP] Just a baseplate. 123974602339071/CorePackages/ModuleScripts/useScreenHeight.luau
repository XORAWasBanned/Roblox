-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.useScreenHeight
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Providers.Overlay.useScreen)
return function() -- name: useScreenHeight
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v_u_5 = v_u_4()
	local v6, v_u_7 = v_u_3.useState(v_u_5 and (v_u_5.AbsoluteSize.Y or 0) or 0)
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) v_u_5, (copy) v_u_7
		local v_u_8
		if v_u_5 then
			v_u_7(v_u_5.AbsoluteSize.Y)
			v_u_8 = v_u_5:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: (ref) v_u_7, (ref) v_u_5
				v_u_7(v_u_5.AbsoluteSize.Y)
			end)
		else
			v_u_8 = nil
		end
		return function()
			-- upvalues: (ref) v_u_8
			if v_u_8 then
				v_u_8:Disconnect()
			end
		end
	end, { v_u_5 })
	return v6
end