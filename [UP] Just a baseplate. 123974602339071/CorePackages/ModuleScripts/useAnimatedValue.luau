-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.0.7.Motion.Utility.useAnimatedValue
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactOtter)
require(v1.Types)
return function(p5) -- name: useAnimatedValue
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v_u_6 = v_u_3.useRef(nil)
	local v8 = v_u_3.useCallback(function(...)
		-- upvalues: (copy) v_u_6
		if v_u_6.current ~= nil then
			local v7 = v_u_6.current
			if type(v7) == "function" then
				v_u_6.current(...)
				return
			end
			if v_u_6.current._isMockFunction then
				v_u_6.current(...)
			end
		end
	end, { v_u_6 })
	if typeof(p5) == "UDim" then
		local v9 = v_u_4.useAnimatedBinding
		local v10 = {}
		local v11 = p5.Scale
		v10.scale = type(v11) ~= "number" and 0 or v11
		local v12 = p5.Offset
		v10.offset = type(v12) ~= "number" and 0 or v12
		local v13, v_u_14 = v9(v10, v8)
		return v13:map(function(p15)
			return UDim.new(p15.scale, p15.offset)
		end), function(p16, p17)
			-- upvalues: (copy) v_u_6, (copy) v_u_14, (ref) v_u_4
			if p16 then
				if typeof(p16) == "UDim" then
					local v18 = v_u_6
					local v19
					if p17 then
						v19 = p17.onComplete or nil
					else
						v19 = nil
					end
					v18.current = v19
					local v20 = p17 and {
						["duration"] = p17.duration or 0.3,
						["easingStyle"] = p17.easingStyle
					} or nil
					local v21 = v_u_14
					local v22 = {}
					local v23 = v_u_4.ease
					local v24 = p16.Scale
					v22.scale = v23(type(v24) ~= "number" and 0 or v24, v20)
					local v25 = v_u_4.ease
					local v26 = p16.Offset
					v22.offset = v25(type(v26) ~= "number" and 0 or v26, v20)
					v21(v22)
				else
					warn("Expected UDim target but got", (typeof(p16)))
				end
			else
				return
			end
		end
	elseif typeof(p5) == "UDim2" then
		local v27 = v_u_4.useAnimatedBinding
		local v28 = {}
		local v29 = p5.X.Scale
		v28.xScale = type(v29) ~= "number" and 0 or v29
		local v30 = p5.X.Offset
		v28.xOffset = type(v30) ~= "number" and 0 or v30
		local v31 = p5.Y.Scale
		v28.yScale = type(v31) ~= "number" and 0 or v31
		local v32 = p5.Y.Offset
		v28.yOffset = type(v32) ~= "number" and 0 or v32
		local v33, v_u_34 = v27(v28, v8)
		return v33:map(function(p35)
			return UDim2.new(p35.xScale, p35.xOffset, p35.yScale, p35.yOffset)
		end), function(p36, p37)
			-- upvalues: (copy) v_u_6, (copy) v_u_34, (ref) v_u_4
			if p36 then
				if typeof(p36) == "UDim2" then
					local v38 = v_u_6
					local v39
					if p37 then
						v39 = p37.onComplete or nil
					else
						v39 = nil
					end
					v38.current = v39
					local v40 = p37 and {
						["duration"] = p37.duration or 0.3,
						["easingStyle"] = p37.easingStyle
					} or nil
					local v41 = v_u_34
					local v42 = {}
					local v43 = v_u_4.ease
					local v44 = p36.X.Scale
					v42.xScale = v43(type(v44) ~= "number" and 0 or v44, v40)
					local v45 = v_u_4.ease
					local v46 = p36.X.Offset
					v42.xOffset = v45(type(v46) ~= "number" and 0 or v46, v40)
					local v47 = v_u_4.ease
					local v48 = p36.Y.Scale
					v42.yScale = v47(type(v48) ~= "number" and 0 or v48, v40)
					local v49 = v_u_4.ease
					local v50 = p36.Y.Offset
					v42.yOffset = v49(type(v50) ~= "number" and 0 or v50, v40)
					v41(v42)
				else
					warn("Expected UDim2 target but got", (typeof(p36)))
				end
			else
				return
			end
		end
	elseif typeof(p5) == "Vector2" then
		local v51 = v_u_4.useAnimatedBinding
		local v52 = {}
		local v53 = p5.X
		v52.x = type(v53) ~= "number" and 0 or v53
		local v54 = p5.Y
		v52.y = type(v54) ~= "number" and 0 or v54
		local v55, v_u_56 = v51(v52, v8)
		return v55:map(function(p57)
			return Vector2.new(p57.x, p57.y)
		end), function(p58, p59)
			-- upvalues: (copy) v_u_6, (copy) v_u_56, (ref) v_u_4
			if p58 then
				if typeof(p58) == "Vector2" then
					local v60 = v_u_6
					local v61
					if p59 then
						v61 = p59.onComplete or nil
					else
						v61 = nil
					end
					v60.current = v61
					local v62 = p59 and {
						["duration"] = p59.duration or 0.3,
						["easingStyle"] = p59.easingStyle
					} or nil
					local v63 = v_u_56
					local v64 = {}
					local v65 = v_u_4.ease
					local v66 = p58.X
					v64.x = v65(type(v66) ~= "number" and 0 or v66, v62)
					local v67 = v_u_4.ease
					local v68 = p58.Y
					v64.y = v67(type(v68) ~= "number" and 0 or v68, v62)
					v63(v64)
				else
					warn("Expected Vector2 target but got", (typeof(p58)))
				end
			else
				return
			end
		end
	elseif typeof(p5) == "Color3" then
		local v69 = v_u_4.useAnimatedBinding
		local v70 = {}
		local v71 = p5.R
		v70.r = type(v71) ~= "number" and 0 or v71
		local v72 = p5.G
		v70.g = type(v72) ~= "number" and 0 or v72
		local v73 = p5.B
		v70.b = type(v73) ~= "number" and 0 or v73
		local v74, v_u_75 = v69(v70, v8)
		return v74:map(function(p76)
			return Color3.new(p76.r, p76.g, p76.b)
		end), function(p77, p78)
			-- upvalues: (copy) v_u_6, (copy) v_u_75, (ref) v_u_4
			if p77 then
				if typeof(p77) == "Color3" then
					local v79 = v_u_6
					local v80
					if p78 then
						v80 = p78.onComplete or nil
					else
						v80 = nil
					end
					v79.current = v80
					local v81 = p78 and {
						["duration"] = p78.duration or 0.3,
						["easingStyle"] = p78.easingStyle
					} or nil
					local v82 = v_u_75
					local v83 = {}
					local v84 = v_u_4.ease
					local v85 = p77.R
					v83.r = v84(type(v85) ~= "number" and 0 or v85, v81)
					local v86 = v_u_4.ease
					local v87 = p77.G
					v83.g = v86(type(v87) ~= "number" and 0 or v87, v81)
					local v88 = v_u_4.ease
					local v89 = p77.B
					v83.b = v88(type(v89) ~= "number" and 0 or v89, v81)
					v82(v83)
				else
					warn("Expected Color3 target but got", (typeof(p77)))
				end
			else
				return
			end
		end
	elseif typeof(p5) == "number" then
		local v90, v_u_91 = v_u_4.useAnimatedBinding(type(p5) ~= "number" and 0 or p5, v8)
		return v90:map(function(p92)
			return p92
		end), function(p93, p94)
			-- upvalues: (copy) v_u_6, (copy) v_u_91, (ref) v_u_4
			if typeof(p93) == "number" then
				local v95 = v_u_6
				local v96
				if p94 then
					v96 = p94.onComplete or nil
				else
					v96 = nil
				end
				v95.current = v96
				local v97 = p94 and {
					["duration"] = p94.duration or 0.3,
					["easingStyle"] = p94.easingStyle
				} or nil
				v_u_91(v_u_4.ease(p93, v97))
			end
		end
	else
		warn("Unsupported type for animated value:", (typeof(p5)))
		return v_u_3.createBinding(p5), function() end
	end
end