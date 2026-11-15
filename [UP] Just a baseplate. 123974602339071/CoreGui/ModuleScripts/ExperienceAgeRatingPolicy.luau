-- Path: CoreGui.RobloxGui.Modules.TopBar.ExperienceAgeRatingPolicy
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.InExperienceTopBar).Flags.FFlagExperienceAgeRatingBadge
local v_u_3 = require(v1.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating
return {
	["isEligible"] = nil,
	["keepOutAreaId"] = "experience-age-rating",
	["isEligible"] = function(p4, p5, p6, p7) -- name: isEligible
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		local v8 = v_u_2 and v_u_3
		if v8 then
			if p4 == true then
				if p5 then
					if p6 then
						p6 = not p7
					end
				else
					p6 = p5
				end
			else
				p6 = false
			end
		else
			p6 = v8
		end
		return p6
	end
}