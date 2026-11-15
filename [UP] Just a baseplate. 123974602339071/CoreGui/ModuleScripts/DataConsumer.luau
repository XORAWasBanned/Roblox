-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.DataConsumer
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent.Components
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(script.Parent.Parent.Immutable)
local v_u_5 = require(v2.DataContext)
return function(p_u_6, ...)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	if not p_u_6 then
		error("Expected component to be passed to connection, got nil.")
	end
	local v_u_7 = {}
	for v8 = 1, select("#", ...) do
		v_u_7[v8] = select(v8, ...)
	end
	local v9 = string.format("Consumer(%s)_DependsOn_%s", tostring(p_u_6), v_u_7[1])
	local v_u_10 = v_u_3.Component:extend(v9)
	function v_u_10.init(p11) -- name: init
		-- upvalues: (copy) v_u_7
		local v12 = {}
		for _, v13 in pairs(v_u_7) do
			local v14 = p11.props.DevConsoleData[v13]
			if not v14 then
				local v15 = string.format("%s %s", tostring(v13), "could not be found. Make sure DataProvider is above this consumer")
				error(v15)
				return
			end
			v12[v13] = v14
		end
		p11:setState(v12)
	end
	function v_u_10.render(p16) -- name: render
		-- upvalues: (ref) v_u_4, (ref) v_u_3, (copy) p_u_6
		local v17 = v_u_4.JoinDictionaries(p16.props.componentProps, p16.state)
		return v_u_3.createElement(p_u_6, v17)
	end
	return function(p_u_18) -- name: DataConsumerWrapper
		-- upvalues: (ref) v_u_3, (ref) v_u_5, (copy) v_u_10
		local v21 = {
			["render"] = function(p19) -- name: render
				-- upvalues: (ref) v_u_3, (ref) v_u_10, (copy) p_u_18
				local v20 = {
					["componentProps"] = p_u_18,
					["DevConsoleData"] = p19
				}
				return v_u_3.createElement(v_u_10, v20)
			end
		}
		return v_u_3.createElement(v_u_5.Consumer, v21)
	end
end