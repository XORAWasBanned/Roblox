-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.createMomentScene
require(script.Parent.Types)
local v_u_1 = require(script.Parent.builders)
return function(p2, p3) -- name: createMomentScene
	-- upvalues: (copy) v_u_1
	local v4 = (p3 or v_u_1)[p2.type]
	if v4 == nil then
		error((("createMomentScene: unknown scene type \'%*\'"):format(p2.type)))
	end
	return v4(p2.args)
end