-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ScriptProfiler.ProfilerUtil
require(script.Parent.ProfilerDataFormatV2)
local v_u_26 = {
	["getDurations"] = function(p1, p2) -- name: getDurations
		if p2 <= 0 then
			local v3 = 0
			for _, v4 in p1.Categories do
				v3 = v3 + p1.Nodes[v4.NodeId].TotalDuration
			end
			return v3, 0
		end
		local v5 = p1.Nodes[p2]
		local v6 = v5 ~= nil
		assert(v6)
		return v5.TotalDuration, v5.Duration
	end,
	["getName"] = function(_, p7) -- name: getName
		if p7 then
			p7 = p7.Name
		end
		return p7
	end,
	["getSourceName"] = function(_, p8) -- name: getSourceName
		if p8 then
			p8 = p8.Source
		end
		return p8
	end,
	["getLine"] = function(_, p9) -- name: getLine
		if p9 then
			p9 = p9.Line
		end
		return p9
	end,
	["getNativeFlag"] = function(_, p10) -- name: getNativeFlag
		return p10 and p10.IsNative or false
	end,
	["getPluginFlag"] = function(_, p11) -- name: getPluginFlag
		return p11 and p11.IsPlugin or false
	end,
	["standardizeChildren"] = function(_, p12) -- name: standardizeChildren
		if p12 then
			p12 = p12.Children
		end
		return p12
	end,
	["formatSessionLength"] = function(p13) -- name: formatSessionLength
		if not p13 then
			return nil
		end
		local v14 = p13 / 3600000
		local v15 = p13 / 60000 % 60
		local v16 = p13 / 1000 % 60
		local v17 = p13 % 1000
		return string.format("%02i:%02i:%02i.%04i", v14, v15, v16, v17)
	end,
	["formatTimer"] = function(p18) -- name: formatTimer
		if p18 == nil then
			return ""
		elseif p18 == 0 then
			return ""
		elseif p18 >= 60 then
			return string.format("%dm", p18 / 60)
		else
			return string.format("%ds", p18)
		end
	end,
	["formatFrequency"] = function(p19) -- name: formatFrequency
		if p19 < 1000 then
			return tostring(p19) .. " Hz"
		end
		local v20 = p19 / 1000
		return tostring(v20) .. " KHz"
	end,
	["getSourceLocationString"] = function(p21, p22, p23) -- name: getSourceLocationString
		-- upvalues: (copy) v_u_26
		local v24 = v_u_26.getSourceName(p21, p22)
		if v24 then
			if #v24 == 0 then
				v24 = p23
			end
		else
			v24 = p23
		end
		local v25 = v_u_26.getLine(p21, p22)
		if v25 and v25 >= 1 then
			v24 = string.format("%s:%s", v24, (tostring(v25)))
		end
		return v24
	end
}
return v_u_26