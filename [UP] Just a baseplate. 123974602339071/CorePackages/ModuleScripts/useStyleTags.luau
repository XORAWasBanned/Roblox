-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.useStyleTags
local v1 = script.Parent
local v2 = script:FindFirstAncestor("Foundation")
local v3 = v2.Parent
local v_u_4 = require(v3.React)
local v_u_5 = require(v1.TagsContext)
local v_u_6 = require(v2.Utility.getFormattedTags)
require(v2.Components.Types)
return function(p7) -- name: useStyleTags
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	local v_u_8 = v_u_6(p7)
	local v_u_9 = v_u_4.useContext(v_u_5)
	v_u_4.useLayoutEffect(function()
		-- upvalues: (copy) v_u_8, (copy) v_u_9
		if v_u_8 ~= nil then
			v_u_9(string.split(v_u_8, " "))
		end
	end, { v_u_8, v_u_9 })
	return v_u_8
end