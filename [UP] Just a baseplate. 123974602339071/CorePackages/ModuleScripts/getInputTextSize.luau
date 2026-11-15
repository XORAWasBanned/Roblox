-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getInputTextSize
local v1 = script:FindFirstAncestor("Foundation")
local v2 = require(v1.Enums.InputSize)
local v3 = require(v1.Enums.InputLabelSize)
local v_u_4 = {
	[v2.Large] = v3.Large,
	[v2.Medium] = v3.Medium,
	[v2.Small] = v3.Small,
	[v2.XSmall] = v3.XSmall
}
return function(p5) -- name: getInputTextSize
	-- upvalues: (copy) v_u_4
	return v_u_4[p5]
end