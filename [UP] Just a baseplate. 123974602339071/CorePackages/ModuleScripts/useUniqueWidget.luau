-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.StudioWidgets.useUniqueWidget
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Plugin.StudioUri)
local v_u_5 = require(v1.Providers.Plugin.usePlugin)
local v_u_6 = require(script.Parent.useWidgetRef)
local v_u_7 = require(script.Parent.useWidgetsContext)
return function(p8) -- name: useUniqueWidget
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6
	local v_u_9 = v_u_5()
	if v_u_9 == nil then
		error("useUniqueWidget must be used within a Plugin context")
	end
	local v10 = v_u_7()
	local v_u_11 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_4, (copy) v_u_9
		return v_u_4.wrap(v_u_9:GetUri())
	end, { v_u_9 })
	local v_u_12 = v_u_3.useRef(nil)
	if v_u_12.current == nil then
		if p8 and p8.id then
			v_u_12.current = p8.id
		else
			v_u_12.current = v10.nextId()
		end
	end
	local v13 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_4, (copy) v_u_11, (copy) v_u_12
		return v_u_4.join(v_u_11, {
			["Category"] = "Actions",
			["ItemId"] = nil,
			["ItemId"] = v_u_12.current
		})
	end, { v_u_11, v_u_12.current })
	local v14 = v_u_6
	if p8 then
		p8 = p8.forwardRef
	end
	return {
		["ref"] = v14(v13, p8),
		["uri"] = v13
	}
end