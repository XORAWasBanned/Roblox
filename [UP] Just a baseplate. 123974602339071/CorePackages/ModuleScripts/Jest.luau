-- Path: CorePackages.Packages._Index.CollisionMatchers2D.CollisionMatchers2D.Jest
local v1 = {}
local v_u_2 = require(script.Parent.above)
function v1.toBeAbove(_, ...)
	-- upvalues: (copy) v_u_2
	local v_u_3 = v_u_2(...)
	return {
		["pass"] = v_u_3.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_3
			return v_u_3.message
		end
	}
end
local v_u_4 = require(script.Parent.alignedHorizontally)
function v1.toBeAlignedHorizontally(_, ...)
	-- upvalues: (copy) v_u_4
	local v_u_5 = v_u_4(...)
	return {
		["pass"] = v_u_5.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_5
			return v_u_5.message
		end
	}
end
local v_u_6 = require(script.Parent.alignedVertically)
function v1.toBeAlignedVertically(_, ...)
	-- upvalues: (copy) v_u_6
	local v_u_7 = v_u_6(...)
	return {
		["pass"] = v_u_7.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_7
			return v_u_7.message
		end
	}
end
local v_u_8 = require(script.Parent.below)
function v1.toBeBelow(_, ...)
	-- upvalues: (copy) v_u_8
	local v_u_9 = v_u_8(...)
	return {
		["pass"] = v_u_9.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_9
			return v_u_9.message
		end
	}
end
local v_u_10 = require(script.Parent.inside)
function v1.toBeInside(_, ...)
	-- upvalues: (copy) v_u_10
	local v_u_11 = v_u_10(...)
	return {
		["pass"] = v_u_11.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_11
			return v_u_11.message
		end
	}
end
local v_u_12 = require(script.Parent.insideAbove)
function v1.toBeInsideAbove(_, ...)
	-- upvalues: (copy) v_u_12
	local v_u_13 = v_u_12(...)
	return {
		["pass"] = v_u_13.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_13
			return v_u_13.message
		end
	}
end
local v_u_14 = require(script.Parent.insideBelow)
function v1.toBeInsideBelow(_, ...)
	-- upvalues: (copy) v_u_14
	local v_u_15 = v_u_14(...)
	return {
		["pass"] = v_u_15.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_15
			return v_u_15.message
		end
	}
end
local v_u_16 = require(script.Parent.insideLeftOf)
function v1.toBeInsideLeftOf(_, ...)
	-- upvalues: (copy) v_u_16
	local v_u_17 = v_u_16(...)
	return {
		["pass"] = v_u_17.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_17
			return v_u_17.message
		end
	}
end
local v_u_18 = require(script.Parent.insideRightOf)
function v1.toBeInsideRightOf(_, ...)
	-- upvalues: (copy) v_u_18
	local v_u_19 = v_u_18(...)
	return {
		["pass"] = v_u_19.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_19
			return v_u_19.message
		end
	}
end
local v_u_20 = require(script.Parent.leftOf)
function v1.toBeLeftOf(_, ...)
	-- upvalues: (copy) v_u_20
	local v_u_21 = v_u_20(...)
	return {
		["pass"] = v_u_21.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_21
			return v_u_21.message
		end
	}
end
local v_u_22 = require(script.Parent.rightOf)
function v1.toBeRightOf(_, ...)
	-- upvalues: (copy) v_u_22
	local v_u_23 = v_u_22(...)
	return {
		["pass"] = v_u_23.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_23
			return v_u_23.message
		end
	}
end
local v_u_24 = require(script.Parent.intersect)
function v1.toIntersect(_, ...)
	-- upvalues: (copy) v_u_24
	local v_u_25 = v_u_24(...)
	return {
		["pass"] = v_u_25.pass,
		["message"] = function() -- name: message
			-- upvalues: (copy) v_u_25
			return v_u_25.message
		end
	}
end
return v1