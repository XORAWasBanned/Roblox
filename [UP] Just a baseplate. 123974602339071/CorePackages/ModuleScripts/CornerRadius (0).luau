-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.CornerRadius.CornerRadius
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactIs)
local v_u_5 = require(v1.Utility.getTestIdTag)
local v_u_6 = require(v1.Utility.mapBindable)
require(v1.Components.Types)
local function v_u_21(p7) -- name: getCornerRadius
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	if v_u_4.isBinding(p7) then
		return {
			["TopLeftRadius"] = p7,
			["TopRightRadius"] = p7,
			["BottomRightRadius"] = p7,
			["BottomLeftRadius"] = p7
		}
	end
	if typeof(p7) == "number" then
		return {
			["TopLeftRadius"] = UDim.new(0, p7),
			["TopRightRadius"] = UDim.new(0, p7),
			["BottomRightRadius"] = UDim.new(0, p7),
			["BottomLeftRadius"] = UDim.new(0, p7)
		}
	end
	if typeof(p7) == "UDim" then
		return {
			["TopLeftRadius"] = p7,
			["TopRightRadius"] = p7,
			["BottomRightRadius"] = p7,
			["BottomLeftRadius"] = p7
		}
	end
	if typeof(p7) ~= "table" then
		return {}
	end
	local v8 = {}
	local v9 = p7.topLeft
	local v10
	if v9 == nil then
		v10 = nil
	else
		v10 = v_u_6(v9, function(p11)
			if typeof(p11) == "number" then
				return UDim.new(0, p11)
			else
				return p11
			end
		end)
	end
	v8.TopLeftRadius = v10
	local v12 = p7.topRight
	local v13
	if v12 == nil then
		v13 = nil
	else
		v13 = v_u_6(v12, function(p14)
			if typeof(p14) == "number" then
				return UDim.new(0, p14)
			else
				return p14
			end
		end)
	end
	v8.TopRightRadius = v13
	local v15 = p7.bottomRight
	local v16
	if v15 == nil then
		v16 = nil
	else
		v16 = v_u_6(v15, function(p17)
			if typeof(p17) == "number" then
				return UDim.new(0, p17)
			else
				return p17
			end
		end)
	end
	v8.BottomRightRadius = v16
	local v18 = p7.bottomLeft
	local v19
	if v18 == nil then
		v19 = nil
	else
		v19 = v_u_6(v18, function(p20)
			if typeof(p20) == "number" then
				return UDim.new(0, p20)
			else
				return p20
			end
		end)
	end
	v8.BottomLeftRadius = v19
	return v8
end
return v_u_3.memo(function(p22) -- name: CornerRadius
	-- upvalues: (copy) v_u_21, (copy) v_u_3, (copy) v_u_5
	local v23 = v_u_21(p22.value)
	return v_u_3.createElement("UICorner", {
		["TopLeftRadius"] = v23.TopLeftRadius,
		["TopRightRadius"] = v23.TopRightRadius,
		["BottomRightRadius"] = v23.BottomRightRadius,
		["BottomLeftRadius"] = v23.BottomLeftRadius,
		[v_u_3.Tag] = v_u_5(p22.testId)
	})
end)