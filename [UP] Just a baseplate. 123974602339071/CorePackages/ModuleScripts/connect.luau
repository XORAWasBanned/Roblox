-- Path: CorePackages.Packages._Index.LuaRoactPolicyProvider.LuaRoactPolicyProvider.connect
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Roact)
local v_u_3 = require(v1.Cryo)
local v_u_4 = require(script.Parent.Logger)
local v_u_5 = require(script.Parent.AppPolicyContext)
local function v_u_10(p6, p7) -- name: mergePolicies
	-- upvalues: (copy) v_u_3
	local v8 = {}
	for _, v9 in ipairs(p7) do
		v8 = v_u_3.Dictionary.join(v8, v9(p6))
	end
	return v8
end
return function(p_u_11)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_10, (copy) v_u_3, (copy) v_u_5
	assert(p_u_11, "expected getPolicyImpl")
	return function(p_u_12)
		-- upvalues: (ref) v_u_4, (ref) v_u_2, (ref) v_u_10, (copy) p_u_11, (ref) v_u_3, (ref) v_u_5
		local v13 = type(p_u_12) == "function"
		assert(v13, "connect expects mapper to be a function")
		return function(p_u_14)
			-- upvalues: (ref) v_u_4, (ref) v_u_2, (ref) v_u_10, (ref) p_u_11, (copy) p_u_12, (ref) v_u_3, (ref) v_u_5
			local v15 = ("AppPolicy(%s)"):format((tostring(p_u_14)))
			local v_u_16 = v_u_4:new(v15)
			v_u_16:setContext({
				["prefix"] = string.format("%s: ", v15)
			})
			local v_u_17 = string.format("%s: Not a descendent of PolicyProvider", v15)
			local v_u_18 = v_u_2.PureComponent:extend(v15)
			v_u_16:trace("Connected to component: {}", (tostring(p_u_14)))
			function v_u_18.init(p_u_19, p20) -- name: init
				-- upvalues: (copy) v_u_17, (ref) v_u_10, (ref) p_u_11, (copy) v_u_16
				p_u_19.policyContext = p20.policy
				local v21 = p_u_19.policyContext
				local v22 = v_u_17
				assert(v21, v22)
				function p_u_19.setWithEmptyPolicy()
					-- upvalues: (copy) p_u_19, (ref) v_u_10
					p_u_19.state = {
						["policy"] = v_u_10({}, p_u_19.policyContext.presentationPolicy)
					}
				end
				if p_u_19.policyContext.staticExternalPolicy then
					p_u_19.state = {
						["policy"] = v_u_10(p_u_19.policyContext.staticExternalPolicy, p_u_19.policyContext.presentationPolicy)
					}
				else
					local v23 = p_u_11.read()
					if v23 then
						p_u_19.state = {
							["policy"] = v_u_10(v23, p_u_19.policyContext.presentationPolicy)
						}
					else
						p_u_19.setWithEmptyPolicy()
						v_u_16:trace("No app policy data available")
					end
					function p_u_19.onPolicyChanged(p24)
						-- upvalues: (copy) p_u_19, (ref) v_u_10
						p_u_19:setState({
							["policy"] = v_u_10(p24, p_u_19.policyContext.presentationPolicy)
						})
					end
				end
			end
			function v_u_18.didMount(p_u_25) -- name: didMount
				-- upvalues: (ref) p_u_11, (copy) v_u_16
				if not p_u_25.policyContext.staticExternalPolicy then
					p_u_25.connection = p_u_11.onPolicyChanged(function(p26)
						-- upvalues: (ref) v_u_16, (copy) p_u_25
						v_u_16:trace("Received policy update from MemStorageService")
						p_u_25.onPolicyChanged(p26)
					end)
				end
			end
			function v_u_18.render(p27) -- name: render
				-- upvalues: (ref) p_u_12, (ref) v_u_3, (ref) v_u_2, (copy) p_u_14
				local v28 = p_u_12(p27.state.policy, p27.props.innerProps)
				local v29 = v_u_3.Dictionary.join(p27.props.innerProps, v28)
				return v_u_2.createElement(p_u_14, v29)
			end
			function v_u_18.willUnmount(p30) -- name: willUnmount
				if p30.connection then
					p30.connection:Disconnect()
				end
				p30.onPolicyChange = nil
			end
			return function(p_u_31)
				-- upvalues: (ref) v_u_2, (ref) v_u_5, (copy) v_u_18
				local v34 = {
					["render"] = function(p32) -- name: render
						-- upvalues: (ref) v_u_2, (ref) v_u_18, (copy) p_u_31
						local v33 = {
							["innerProps"] = p_u_31,
							["policy"] = p32
						}
						return v_u_2.createElement(v_u_18, v33)
					end
				}
				return v_u_2.createElement(v_u_5.Consumer, v34)
			end
		end
	end
end