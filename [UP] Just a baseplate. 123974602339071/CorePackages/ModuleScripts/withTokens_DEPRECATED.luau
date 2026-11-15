-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.withTokens_DEPRECATED
local v1 = script.Parent
local v2 = script:FindFirstAncestor("Foundation").Parent
local v_u_3 = require(v2.React)
require(v1.Tokens)
local v_u_4 = require(v1.TokensContext)
return function(p5) -- name: withTokens_DEPRECATED
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return v_u_3.createElement(v_u_4.Consumer, {
		["render"] = p5
	})
end