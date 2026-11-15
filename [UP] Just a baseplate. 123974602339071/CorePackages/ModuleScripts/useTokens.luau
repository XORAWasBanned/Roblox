-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.useTokens
local v1 = script.Parent
local v2 = script:FindFirstAncestor("Foundation").Parent
require(v1.Tokens)
local v_u_3 = require(v1.TokensContext)
local v_u_4 = require(v2.React)
return function() -- name: useTokens
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	return v_u_4.useContext(v_u_3)
end