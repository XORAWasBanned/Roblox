-- Path: CorePackages.Packages._Index.BuilderIcons.BuilderIcons.builderIconPlatformUtils.getBuilderIconForKeycode
local v_u_1 = require(script.Parent.KeycodeMappings)
local v_u_2 = require(script.Parent.Platform)
local v_u_3 = require(script.Parent.getInputPlatform)
return function(p4) -- name: getBuilderIconForKeycode
	-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
	local v5 = v_u_3()
	local v6 = p4.Name
	local v7 = v_u_1[v5][v6]
	if v7 then
		return v7
	end
	local v8 = v_u_1[v_u_2.Default][v6]
	local v9 = ("%* has no associated BuilderIcon"):format(v6)
	assert(v8, v9)
	return v_u_1[v_u_2.Default][v6]
end