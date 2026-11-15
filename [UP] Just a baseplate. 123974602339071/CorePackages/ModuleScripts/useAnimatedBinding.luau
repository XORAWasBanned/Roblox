-- Path: CorePackages.Packages._Index.ReactOtter.ReactOtter.useAnimatedBinding
local v1 = script.Parent.Parent
local v_u_2 = require(v1.React)
require(v1.Otter)
local v_u_3 = require(script.Parent.useMotor)
return function(p4, p5) -- name: useAnimatedBinding
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6, v7 = v_u_2.useBinding(p4)
	return v6, v_u_3(p4, v7, p5)
end