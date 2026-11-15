-- Path: CoreGui.RobloxGui.Modules.Shell.Experiment.makeExperiment
local v_u_1 = game:GetService("IXPService")
return function(p_u_2, p_u_3, p_u_4, p_u_5, p_u_6) -- name: makeExperiment
	-- upvalues: (copy) v_u_1
	for _, v7 in {
		p_u_2,
		p_u_3,
		p_u_4,
		p_u_5,
		p_u_6
	} do
		if v_u_1[v7] then
			continue
		end
		error("makeExperiment factory expects configured members to exist on IXPService. Member " .. v7 .. " not found")
	end
	return function(p8, p_u_9, p_u_10, p11)
		-- upvalues: (ref) v_u_1, (copy) p_u_4, (copy) p_u_6, (copy) p_u_5, (copy) p_u_3, (copy) p_u_2
		local v_u_12 = p11 == nil and true or p11
		local v13 = type(p_u_9) == "table"
		assert(v13, "makeExperiment expects layerNames to be a list of layers")
		local v14 = type(p_u_10) == "function"
		assert(v14, "makeExperiment expects mapLayers to be a function")
		local function v_u_18(p15) -- name: updateStateLayerData
			-- upvalues: (copy) p_u_9, (ref) v_u_1, (ref) p_u_4, (copy) p_u_10
			local v16 = {}
			for _, v17 in ipairs(p_u_9) do
				v16[v17] = v_u_1[p_u_4](v_u_1, v17)
			end
			p_u_10({
				["layerToVariables"] = v16,
				["layerLoadingStatus"] = p15
			})
		end
		local function v_u_20() -- name: logAllLayersExposure
			-- upvalues: (copy) p_u_9, (ref) v_u_1, (ref) p_u_6, (ref) p_u_5
			for _, v19 in ipairs(p_u_9) do
				if v_u_1[p_u_6](v_u_1, v19) ~= Enum.IXPLoadingStatus.Initialized then
					continue
				end
				v_u_1[p_u_5](v_u_1, v19)
			end
		end
		v_u_18((v_u_1[p_u_3](v_u_1)))
		local v_u_22 = v_u_1[p_u_2]:Connect(function()
			-- upvalues: (ref) v_u_1, (ref) p_u_3, (copy) v_u_18, (ref) v_u_12, (copy) v_u_20
			local v21 = v_u_1[p_u_3](v_u_1)
			v_u_18(v21)
			if v_u_12 and v21 == Enum.IXPLoadingStatus.Initialized then
				v_u_20()
			end
		end)
		p8.Destroying:Once(function()
			-- upvalues: (copy) v_u_22
			v_u_22:Disconnect()
		end)
		return v_u_22
	end
end