-- Path: CorePackages.Packages._Index.LuaRoactPolicyProvider.LuaRoactPolicyProvider.Provider
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Roact)
local v_u_3 = require(script.Parent.AppPolicyContext)
return function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v4 = v_u_2.Component:extend("PolicyProvider")
	function v4.init(p5, p6) -- name: init
		local v7 = p6.policy
		local v8 = type(v7) == "table"
		assert(v8, "Provider expects props.policy to be a table")
		p5.policy = {
			["presentationPolicy"] = p6.policy,
			["staticExternalPolicy"] = p6.policyData
		}
	end
	function v4.render(p9) -- name: render
		-- upvalues: (ref) v_u_2, (ref) v_u_3
		return v_u_2.createElement(v_u_3.Provider, {
			["value"] = p9.policy
		}, p9.props[v_u_2.Children])
	end
	return v4
end