-- Path: CoreGui.RobloxGui.Modules.ErrorReporting.createCoreScriptErrorHandler
local v_u_1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("ScriptContext")
local v_u_4 = require(v_u_2.Packages.React)
local v_u_5 = require(script.Parent.Parent.Flags.FFlagCoreScriptErrorReporterIncludeScriptContext)
local function v_u_8(p6) -- name: isCoreScript
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_5, (copy) v_u_3
	local v7 = not (p6:IsDescendantOf(v_u_1) or p6:IsDescendantOf(v_u_2)) and (v_u_5 and p6:IsA("CoreScript"))
	if v7 then
		v7 = p6:IsDescendantOf(v_u_3)
	end
	return v7
end
return function(p_u_9) -- name: createCoreScriptErrorHandler
	-- upvalues: (copy) v_u_8, (copy) v_u_4
	local v_u_10 = p_u_9.piiFilter
	local v_u_11 = p_u_9.rateLimiter
	local v_u_12 = p_u_9.isReportableScript or v_u_8
	return function(p13, p14, p15, p16)
		-- upvalues: (copy) v_u_12, (ref) v_u_4, (copy) v_u_10, (copy) v_u_11, (copy) p_u_9
		if p15 ~= nil and v_u_12(p15) then
			local v17, v18 = v_u_4.unstable_parseReactError(p13)
			local v19 = v17.message
			local v20 = v17.stack or p14
			local v21 = p16 or v18
			local v22 = v_u_10:cleanPii(v19)
			local v23 = v_u_10:cleanPii(v20)
			local v24
			if v21 == nil then
				v24 = nil
			else
				v24 = v_u_10:cleanPii(v21)
			end
			if v_u_11 ~= nil then
				local v25 = v22 .. v23
				if v_u_11:isRateLimited(v25) then
					return
				end
				v_u_11:increment(v25)
			end
			for _, v26 in p_u_9.reporters do
				v26:reportErrorDeferred(v22, v23, v24)
			end
			if p_u_9.onErrorReported ~= nil then
				p_u_9.onErrorReported()
			end
		end
	end
end