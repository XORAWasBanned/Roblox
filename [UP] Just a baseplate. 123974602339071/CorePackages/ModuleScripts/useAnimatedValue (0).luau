-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.1.0.Motion.Utility.useAnimatedValue
local v1 = script.Parent
local v2 = v1.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.React)
local v_u_5 = require(v3.ReactOtter)
local v_u_6 = require(v1.TimingConfigs).presets[require(v2.Enums.TransitionPreset).Default]
require(v2.Types)
return function(p7) -- name: useAnimatedValue
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	local v_u_8 = v_u_4.useRef(nil)
	local v10 = v_u_4.useCallback(function(...)
		-- upvalues: (copy) v_u_8
		if v_u_8.current ~= nil then
			local v9 = v_u_8.current
			if type(v9) == "function" then
				v_u_8.current(...)
				return
			end
			if v_u_8.current._isMockFunction then
				v_u_8.current(...)
			end
		end
	end, { v_u_8 })
	if typeof(p7) == "table" and (p7.Color3 and p7.Transparency) then
		local v11 = v_u_5.useAnimatedBinding
		local v12 = {}
		local v13 = p7.Color3.R
		v12.r = type(v13) ~= "number" and 0 or v13
		local v14 = p7.Color3.G
		v12.g = type(v14) ~= "number" and 0 or v14
		local v15 = p7.Color3.B
		v12.b = type(v15) ~= "number" and 0 or v15
		local v16 = p7.Transparency
		v12.Transparency = type(v16) ~= "number" and 0 or v16
		local v17, v_u_18 = v11(v12, v10)
		return v17:map(function(p19)
			return {
				["Color3"] = Color3.new(p19.r, p19.g, p19.b),
				["Transparency"] = p19.Transparency
			}
		end), function(p20, p21)
			-- upvalues: (copy) v_u_8, (ref) v_u_6, (copy) v_u_18, (ref) v_u_5
			if typeof(p20) == "table" and (p20.Color3 and p20.Transparency ~= nil) then
				local v22 = v_u_8
				local v23
				if p21 then
					v23 = p21.onComplete or nil
				else
					v23 = nil
				end
				v22.current = v23
				local v24 = p21 and {
					["duration"] = p21.duration or v_u_6.duration,
					["easingStyle"] = p21.easingStyle
				} or nil
				local v25 = v_u_18
				local v26 = {}
				local v27 = v_u_5.ease
				local v28 = p20.Color3.R
				v26.r = v27(type(v28) ~= "number" and 0 or v28, v24)
				local v29 = v_u_5.ease
				local v30 = p20.Color3.G
				v26.g = v29(type(v30) ~= "number" and 0 or v30, v24)
				local v31 = v_u_5.ease
				local v32 = p20.Color3.B
				v26.b = v31(type(v32) ~= "number" and 0 or v32, v24)
				local v33 = v_u_5.ease
				local v34 = p20.Transparency
				v26.Transparency = v33(type(v34) ~= "number" and 0 or v34, v24)
				v25(v26)
			else
				warn("Expected target to be a table with Color3 and Transparency fields")
			end
		end
	elseif typeof(p7) == "UDim" then
		local v35 = v_u_5.useAnimatedBinding
		local v36 = {}
		local v37 = p7.Scale
		v36.scale = type(v37) ~= "number" and 0 or v37
		local v38 = p7.Offset
		v36.offset = type(v38) ~= "number" and 0 or v38
		local v39, v_u_40 = v35(v36, v10)
		return v39:map(function(p41)
			return UDim.new(p41.scale, p41.offset)
		end), function(p42, p43)
			-- upvalues: (copy) v_u_8, (ref) v_u_6, (copy) v_u_40, (ref) v_u_5
			if p42 then
				if typeof(p42) == "UDim" then
					local v44 = v_u_8
					local v45
					if p43 then
						v45 = p43.onComplete or nil
					else
						v45 = nil
					end
					v44.current = v45
					local v46 = p43 and {
						["duration"] = p43.duration or v_u_6.duration,
						["easingStyle"] = p43.easingStyle
					} or nil
					local v47 = v_u_40
					local v48 = {}
					local v49 = v_u_5.ease
					local v50 = p42.Scale
					v48.scale = v49(type(v50) ~= "number" and 0 or v50, v46)
					local v51 = v_u_5.ease
					local v52 = p42.Offset
					v48.offset = v51(type(v52) ~= "number" and 0 or v52, v46)
					v47(v48)
				else
					warn("Expected UDim target but got", (typeof(p42)))
				end
			else
				return
			end
		end
	elseif typeof(p7) == "UDim2" then
		local v53 = v_u_5.useAnimatedBinding
		local v54 = {}
		local v55 = p7.X.Scale
		v54.xScale = type(v55) ~= "number" and 0 or v55
		local v56 = p7.X.Offset
		v54.xOffset = type(v56) ~= "number" and 0 or v56
		local v57 = p7.Y.Scale
		v54.yScale = type(v57) ~= "number" and 0 or v57
		local v58 = p7.Y.Offset
		v54.yOffset = type(v58) ~= "number" and 0 or v58
		local v59, v_u_60 = v53(v54, v10)
		return v59:map(function(p61)
			return UDim2.new(p61.xScale, p61.xOffset, p61.yScale, p61.yOffset)
		end), function(p62, p63)
			-- upvalues: (copy) v_u_8, (ref) v_u_6, (copy) v_u_60, (ref) v_u_5
			if p62 then
				if typeof(p62) == "UDim2" then
					local v64 = v_u_8
					local v65
					if p63 then
						v65 = p63.onComplete or nil
					else
						v65 = nil
					end
					v64.current = v65
					local v66 = p63 and {
						["duration"] = p63.duration or v_u_6.duration,
						["easingStyle"] = p63.easingStyle
					} or nil
					local v67 = v_u_60
					local v68 = {}
					local v69 = v_u_5.ease
					local v70 = p62.X.Scale
					v68.xScale = v69(type(v70) ~= "number" and 0 or v70, v66)
					local v71 = v_u_5.ease
					local v72 = p62.X.Offset
					v68.xOffset = v71(type(v72) ~= "number" and 0 or v72, v66)
					local v73 = v_u_5.ease
					local v74 = p62.Y.Scale
					v68.yScale = v73(type(v74) ~= "number" and 0 or v74, v66)
					local v75 = v_u_5.ease
					local v76 = p62.Y.Offset
					v68.yOffset = v75(type(v76) ~= "number" and 0 or v76, v66)
					v67(v68)
				else
					warn("Expected UDim2 target but got", (typeof(p62)))
				end
			else
				return
			end
		end
	elseif typeof(p7) == "Vector2" then
		local v77 = v_u_5.useAnimatedBinding
		local v78 = {}
		local v79 = p7.X
		v78.x = type(v79) ~= "number" and 0 or v79
		local v80 = p7.Y
		v78.y = type(v80) ~= "number" and 0 or v80
		local v81, v_u_82 = v77(v78, v10)
		return v81:map(function(p83)
			return Vector2.new(p83.x, p83.y)
		end), function(p84, p85)
			-- upvalues: (copy) v_u_8, (ref) v_u_6, (copy) v_u_82, (ref) v_u_5
			if p84 then
				if typeof(p84) == "Vector2" then
					local v86 = v_u_8
					local v87
					if p85 then
						v87 = p85.onComplete or nil
					else
						v87 = nil
					end
					v86.current = v87
					local v88 = p85 and {
						["duration"] = p85.duration or v_u_6.duration,
						["easingStyle"] = p85.easingStyle
					} or nil
					local v89 = v_u_82
					local v90 = {}
					local v91 = v_u_5.ease
					local v92 = p84.X
					v90.x = v91(type(v92) ~= "number" and 0 or v92, v88)
					local v93 = v_u_5.ease
					local v94 = p84.Y
					v90.y = v93(type(v94) ~= "number" and 0 or v94, v88)
					v89(v90)
				else
					warn("Expected Vector2 target but got", (typeof(p84)))
				end
			else
				return
			end
		end
	elseif typeof(p7) == "Color3" then
		local v95 = v_u_5.useAnimatedBinding
		local v96 = {}
		local v97 = p7.R
		v96.r = type(v97) ~= "number" and 0 or v97
		local v98 = p7.G
		v96.g = type(v98) ~= "number" and 0 or v98
		local v99 = p7.B
		v96.b = type(v99) ~= "number" and 0 or v99
		local v100, v_u_101 = v95(v96, v10)
		return v100:map(function(p102)
			return Color3.new(p102.r, p102.g, p102.b)
		end), function(p103, p104)
			-- upvalues: (copy) v_u_8, (ref) v_u_6, (copy) v_u_101, (ref) v_u_5
			if p103 then
				if typeof(p103) == "Color3" then
					local v105 = v_u_8
					local v106
					if p104 then
						v106 = p104.onComplete or nil
					else
						v106 = nil
					end
					v105.current = v106
					local v107 = p104 and {
						["duration"] = p104.duration or v_u_6.duration,
						["easingStyle"] = p104.easingStyle
					} or nil
					local v108 = v_u_101
					local v109 = {}
					local v110 = v_u_5.ease
					local v111 = p103.R
					v109.r = v110(type(v111) ~= "number" and 0 or v111, v107)
					local v112 = v_u_5.ease
					local v113 = p103.G
					v109.g = v112(type(v113) ~= "number" and 0 or v113, v107)
					local v114 = v_u_5.ease
					local v115 = p103.B
					v109.b = v114(type(v115) ~= "number" and 0 or v115, v107)
					v108(v109)
				else
					warn("Expected Color3 target but got", (typeof(p103)))
				end
			else
				return
			end
		end
	elseif typeof(p7) == "number" then
		local v116, v_u_117 = v_u_5.useAnimatedBinding(type(p7) ~= "number" and 0 or p7, v10)
		return v116:map(function(p118)
			return p118
		end), function(p119, p120)
			-- upvalues: (copy) v_u_8, (ref) v_u_6, (copy) v_u_117, (ref) v_u_5
			if typeof(p119) == "number" then
				local v121 = v_u_8
				local v122
				if p120 then
					v122 = p120.onComplete or nil
				else
					v122 = nil
				end
				v121.current = v122
				local v123 = p120 and {
					["duration"] = p120.duration or v_u_6.duration,
					["easingStyle"] = p120.easingStyle
				} or nil
				v_u_117(v_u_5.ease(p119, v123))
			end
		end
	else
		warn("Unsupported type for animated value:", (typeof(p7)))
		return v_u_4.createBinding(p7), function() end
	end
end