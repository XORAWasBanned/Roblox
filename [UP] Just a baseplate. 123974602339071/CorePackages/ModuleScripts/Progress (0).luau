-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Progress.Progress
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(script.Parent.ProgressBar)
local v_u_6 = require(script.Parent.ProgressCircle)
local v_u_7 = require(v1.Enums.ProgressShape)
require(v1.Enums.ProgressSize)
local v_u_8 = require(v1.Utility.Flags)
local v_u_9 = require(v1.Utility.withDefaults)
require(v1.Providers.Style.Tokens)
local v_u_10 = {
	["testId"] = "--foundation-progress"
}
return v_u_4.memo(v_u_4.forwardRef(function(p11, p12) -- name: Progress
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_8, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5
	local v13 = v_u_9(p11, v_u_10)
	if not v_u_8.FoundationProgressBarBetaUpdate then
		v13.ref = p12
	end
	if v13.shape == v_u_7.Circle then
		local v14 = v_u_4.createElement
		local v15 = v_u_6
		if v_u_8.FoundationProgressBarBetaUpdate then
			v13 = v_u_3.join(v13, {
				["ref"] = p12
			})
		end
		return v14(v15, v13)
	else
		local v16 = v_u_4.createElement
		local v17 = v_u_5
		if v_u_8.FoundationProgressBarBetaUpdate then
			v13 = v_u_3.join(v13, {
				["ref"] = p12
			})
		end
		return v16(v17, v13)
	end
end))