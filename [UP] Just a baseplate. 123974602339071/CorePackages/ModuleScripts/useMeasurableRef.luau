-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.useMeasurableRef
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v1.Components.Types)
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.Signal)
local function v_u_9() -- name: createSignal
	-- upvalues: (copy) v_u_4
	local v_u_5, v6 = v_u_4.createSignal()
	return {
		["signal"] = {
			["Connect"] = function(_, p7) -- name: Connect
				-- upvalues: (copy) v_u_5
				local v_u_8 = v_u_5:subscribe(p7)
				return {
					["Disconnect"] = function() -- name: Disconnect
						-- upvalues: (copy) v_u_8
						v_u_8:unsubscribe()
					end
				}
			end
		},
		["fire"] = v6
	}
end
local v_u_10 = {}
v_u_10.__index = v_u_10
function v_u_10.new(p11, p12) -- name: new
	-- upvalues: (copy) v_u_10, (copy) v_u_9
	local v13 = v_u_10
	local v14 = setmetatable({
		["AbsolutePosition"] = p11,
		["AbsoluteSize"] = p12,
		["_signals"] = {}
	}, v13)
	v14._signals.AbsolutePosition = v_u_9()
	v14._signals.AbsoluteSize = v_u_9()
	return v14
end
function v_u_10.GetPropertyChangedSignal(p15, p16) -- name: GetPropertyChangedSignal
	if p15._signals[p16] then
		return p15._signals[p16].signal
	end
	error((("%* is not a valid property name."):format(p16)))
end
function v_u_10.SetPosition(p17, p18) -- name: SetPosition
	if p17.AbsolutePosition ~= p18 then
		p17.AbsolutePosition = p18
		p17._signals.AbsolutePosition.fire(p18)
	end
end
function v_u_10.SetSize(p19, p20) -- name: SetSize
	if p19.AbsoluteSize ~= p20 then
		p19.AbsoluteSize = p20
		p19._signals.AbsoluteSize.fire(p20)
	end
end
function useMeasurableRef(p_u_21, p_u_22) -- name: useMeasurableRef
	-- upvalues: (copy) v_u_3, (copy) v_u_10
	local v_u_23 = v_u_3.useRef(nil)
	if v_u_23.current == nil then
		v_u_23.current = v_u_10.new(p_u_21, p_u_22 or Vector2.one)
	end
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_23, (copy) p_u_21
		v_u_23.current:SetPosition(p_u_21)
	end, { p_u_21 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_23, (copy) p_u_22
		v_u_23.current:SetSize(p_u_22 or Vector2.one)
	end, { p_u_22 })
	return v_u_23
end
return useMeasurableRef