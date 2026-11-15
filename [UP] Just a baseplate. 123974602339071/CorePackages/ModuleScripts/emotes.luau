-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders.AvatarMoment.emotes
local v_u_1 = table.freeze({
	["wave"] = table.freeze({
		["r6"] = 128777973,
		["r15"] = 507770239
	}),
	["point"] = table.freeze({
		["r6"] = 128853357,
		["r15"] = 507770453
	}),
	["dance"] = table.freeze({
		["r6"] = 182435998,
		["r15"] = 507771019
	}),
	["dance2"] = table.freeze({
		["r6"] = 182436842,
		["r15"] = 507776043
	}),
	["dance3"] = table.freeze({
		["r6"] = 182436935,
		["r15"] = 507777268
	}),
	["laugh"] = table.freeze({
		["r6"] = 129423131,
		["r15"] = 507770818
	}),
	["cheer"] = table.freeze({
		["r6"] = 129423030,
		["r15"] = 507770677
	})
})
local v_u_2 = {}
for v3 in v_u_1 do
	v_u_2[v3] = true
end
table.freeze(v_u_2)
return {
	["resolve"] = function(p4, p5) -- name: resolve
		-- upvalues: (copy) v_u_1
		local v6 = v_u_1[p4]
		if p5 == Enum.HumanoidRigType.R6 then
			return v6.r6
		else
			return v6.r15
		end
	end,
	["isName"] = function(p7) -- name: isName
		-- upvalues: (copy) v_u_2
		local v8
		if typeof(p7) == "string" then
			v8 = v_u_2[p7] == true
		else
			v8 = false
		end
		return v8
	end
}