-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Progress.useProgressBinding
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.React)
local v_u_3 = require(v2.ReactIs)
require(v1.Components.Types)
return function(p4) -- name: useProgressBinding
	-- upvalues: (copy) v_u_3
	if v_u_3.isBinding(p4) then
		return p4:map(function(p5)
			local v6 = p5 / 100
			return math.clamp(v6, 0, 1)
		end), p4 == nil
	end
	local v7
	if p4 == nil then
		v7 = nil
	else
		local v8 = p4 / 100
		v7 = math.clamp(v8, 0, 1)
	end
	return v7, p4 == nil
end