-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.1.0.Motion.Motion
require(script.Parent.Types)
local v1 = require(script.Parent.Enums.TransitionPreset)
local v_u_2 = require(script.Parent.Utility.TimingConfigs).presets
local v_u_3 = v_u_2[v1.Default]
return {
	["createState"] = function(p4, p5) -- name: createState
		-- upvalues: (copy) v_u_3
		local v6 = {
			["transition"] = {
				["default"] = p5 and p5.default or v_u_3
			}
		}
		for v7, v8 in p4 do
			v6[v7] = v8
			if not (p5 and p5[v7]) then
				continue
			end
			(v6.transition or {
				["default"] = v_u_3
			})[v7] = p5[v7]
		end
		return v6
	end,
	["transition"] = function(p9, p10) -- name: transition
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		if type(p9) == "string" then
			p9 = v_u_2[p9] or v_u_3
		end
		local v11 = {
			["duration"] = p9 and p9.duration or v_u_3.duration,
			["easingStyle"] = p9 and p9.easingStyle or v_u_3.easingStyle,
			["delay"] = p9 and p9.delay or v_u_3.delay
		}
		if p10 then
			if p10.duration then
				v11.duration = p10.duration
			end
			if p10.easingStyle then
				v11.easingStyle = p10.easingStyle
			end
			if p10.delay then
				v11.delay = p10.delay
			end
		end
		return v11
	end,
	["animate"] = function(p_u_12, p13) -- name: animate
		-- upvalues: (copy) v_u_3
		if p_u_12 then
			local v14 = p_u_12.transition or {
				["default"] = v_u_3
			}
			for v_u_15, v_u_16 in p13 do
				local v17 = v14[v_u_15]
				if v17 == nil then
					v17 = v14.default
				end
				if v17.delay and v17.delay > 0 then
					local v_u_18 = table.clone(v17)
					task.delay(v17.delay, function()
						-- upvalues: (copy) v_u_16, (copy) p_u_12, (copy) v_u_15, (copy) v_u_18
						v_u_16(p_u_12[v_u_15], v_u_18)
					end)
				else
					v_u_16(p_u_12[v_u_15], v17)
				end
			end
		end
	end
}