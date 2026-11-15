-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.useMenuItemHover
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
return function(p_u_4) -- name: useMenuItemHover
	-- upvalues: (copy) v_u_3
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_4
		if p_u_4.itemRef.current ~= nil then
			local v5 = p_u_4.itemRef.current
			if typeof(v5) == "Instance" then
				local v_u_6 = p_u_4.itemRef.current:GetPropertyChangedSignal("GuiState"):Connect(function()
					-- upvalues: (ref) p_u_4
					if p_u_4.isSubmenu then
						if p_u_4.isDisabled then
							return
						end
						if p_u_4.itemRef.current.GuiState == Enum.GuiState.Hover then
							if p_u_4.hoverOpenAtDepth then
								p_u_4.hoverOpenAtDepth(p_u_4.depth, p_u_4.id)
								return
							end
						elseif p_u_4.hoverCloseAtDepth then
							p_u_4.hoverCloseAtDepth(p_u_4.depth)
							return
						end
					elseif p_u_4.itemRef.current.GuiState == Enum.GuiState.Hover and p_u_4.hoverCloseAtDepth then
						p_u_4.hoverCloseAtDepth(p_u_4.depth)
					end
				end)
				return function()
					-- upvalues: (copy) v_u_6
					v_u_6:Disconnect()
				end
			end
		end
	end, {
		p_u_4.isSubmenu,
		p_u_4.isDisabled,
		p_u_4.id,
		p_u_4.depth,
		p_u_4.hoverCloseAtDepth,
		p_u_4.hoverOpenAtDepth,
		p_u_4.itemRef
	})
end