-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Avatar.getAvatarSize
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.AvatarSize)
require(v1.Providers.Style.Tokens)
return function(p3, p4, p5) -- name: getAvatarSize
	-- upvalues: (copy) v_u_2
	if p5 then
		return ({
			[v_u_2.XSmall] = p3.Size.Size_300,
			[v_u_2.Small] = p3.Size.Size_400,
			[v_u_2.Medium] = p3.Size.Size_500,
			[v_u_2.Large] = p3.Size.Size_600,
			[v_u_2.XLarge] = p3.Size.Size_600
		})[p4]
	else
		return ({
			[v_u_2.XSmall] = p3.Size.Size_600,
			[v_u_2.Small] = p3.Size.Size_800,
			[v_u_2.Medium] = p3.Size.Size_1000,
			[v_u_2.Large] = p3.Size.Size_1200,
			[v_u_2.XLarge] = p3.Size.Size_1400,
			[v_u_2.Pictogram] = p3.Size.Size_2400
		})[p4]
	end
end