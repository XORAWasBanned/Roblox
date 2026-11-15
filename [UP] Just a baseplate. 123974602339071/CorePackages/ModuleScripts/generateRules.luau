-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.generateRules
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
require(v1.Providers.Style.Tokens)
require(script.Parent.Rules.Types)
local v_u_4 = require(script.Parent.formatTokens)
return function(p5, p6, p7) -- name: generateRules
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v8, v9, v10, v11 = p6(p5, v_u_4(p5), p7)
	return v_u_3.joinArrays(v8, v9, v10), v8, v9, v10, v11
end