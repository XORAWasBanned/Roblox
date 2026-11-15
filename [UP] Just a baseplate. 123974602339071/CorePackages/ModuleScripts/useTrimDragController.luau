-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Hooks.useTrimDragController
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.MomentsCommon)
local v4 = require(v2.React)
local v_u_5 = require(v2.ReactOtter)
local v_u_6 = v_u_5.useAnimatedBinding
local v_u_7 = v4.useCallback
local v_u_8 = v4.useEffect
local v_u_9 = v4.useRef
local v_u_10 = require(v1.Utils.validateRefs)
local v_u_11 = require(v1.Enums.DragHandle)
return function(p_u_12, p_u_13, p_u_14, p_u_15, p_u_16, p17, p_u_18) -- name: useTrimDragController
	-- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_7, (copy) v_u_10, (copy) v_u_11, (copy) v_u_3, (copy) v_u_5, (copy) v_u_8
	local v19 = v_u_9(nil)
	local v_u_20 = v_u_9(nil)
	local v_u_21 = v_u_9(nil)
	local v_u_22 = v_u_9(nil)
	local v_u_23 = v_u_9(nil)
	local v_u_24 = v_u_9(nil)
	local v_u_25, v_u_26 = v_u_6(p17 and (p17.startTime / p_u_18 or 0) or 0)
	local v_u_27, v_u_28 = v_u_6(p17 and (p17.endTime / p_u_18 or 1) or 1)
	local v_u_29 = v_u_9(nil)
	local v_u_30 = v_u_9(nil)
	local v_u_31 = v_u_9(nil)
	local v_u_32 = v_u_9(nil)
	local v_u_34 = v_u_7(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_20, (copy) v_u_32, (ref) v_u_11, (copy) v_u_29, (copy) v_u_25, (copy) p_u_14
		if v_u_10({ v_u_20 }) and not v_u_32.current then
			local v33 = v_u_20.current ~= nil
			assert(v33, "Left handle ref is nil")
			v_u_32.current = v_u_11.LeftHandle
			v_u_29.current = v_u_25:getValue()
			p_u_14(v_u_11.LeftHandle)
		end
	end, { p_u_14 })
	local v_u_41 = v_u_7(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_29, (copy) v_u_20, (copy) v_u_27, (ref) v_u_3, (copy) p_u_18, (copy) v_u_26, (ref) v_u_5
		if v_u_10({ v_u_29, v_u_20 }) then
			local v35 = v_u_29.current ~= nil
			assert(v35, "Left handle initial position ref is nil")
			local v36 = v_u_20.current ~= nil
			assert(v36, "Left handle ref is nil")
			local v37 = v_u_20.current
			local v38 = v_u_29.current + v37.DragUDim2.X.Scale
			local v39 = v_u_27:getValue() - v_u_3.Constants.MinimumVideoLength / p_u_18
			local v40 = math.clamp(v38, 0, v39)
			v_u_26(v_u_5.instant(v40))
		end
	end, { p_u_18 })
	local v_u_42 = v_u_7(function()
		-- upvalues: (copy) v_u_32, (ref) v_u_11, (copy) p_u_15, (copy) v_u_25, (copy) p_u_18, (copy) v_u_29, (copy) p_u_13
		if v_u_32.current == v_u_11.LeftHandle then
			p_u_15(v_u_25:getValue() * p_u_18, nil)
			v_u_32.current = nil
			v_u_29.current = nil
			p_u_13()
		end
	end, { p_u_13, p_u_15, p_u_18 })
	local v_u_44 = v_u_7(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_21, (copy) v_u_32, (ref) v_u_11, (copy) v_u_30, (copy) v_u_27, (copy) p_u_14
		if v_u_10({ v_u_21 }) and not v_u_32.current then
			local v43 = v_u_21.current ~= nil
			assert(v43, "Right handle ref is nil")
			v_u_32.current = v_u_11.RightHandle
			v_u_30.current = v_u_27:getValue()
			p_u_14(v_u_11.RightHandle)
		end
	end, { p_u_14 })
	local v_u_50 = v_u_7(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_30, (copy) v_u_21, (copy) v_u_25, (ref) v_u_3, (copy) p_u_18, (copy) v_u_28, (ref) v_u_5
		if v_u_10({ v_u_30, v_u_21 }) then
			local v45 = v_u_21.current ~= nil
			assert(v45, "Right handle ref is nil")
			local v46 = v_u_21.current
			local v47 = v_u_30.current + v46.DragUDim2.X.Scale
			local v48 = v_u_25:getValue() + v_u_3.Constants.MinimumVideoLength / p_u_18
			local v49 = math.clamp(v47, v48, 1)
			v_u_28(v_u_5.instant(v49))
		end
	end, { p_u_18 })
	local v_u_51 = v_u_7(function()
		-- upvalues: (copy) v_u_32, (ref) v_u_11, (copy) p_u_15, (copy) v_u_27, (copy) p_u_18, (copy) v_u_30, (copy) p_u_13
		if v_u_32.current == v_u_11.RightHandle then
			p_u_15(nil, v_u_27:getValue() * p_u_18)
			v_u_32.current = nil
			v_u_30.current = nil
			p_u_13()
		end
	end, { p_u_13, p_u_15, p_u_18 })
	local v_u_54 = v_u_7(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_24, (copy) v_u_23, (copy) v_u_32, (ref) v_u_11, (copy) v_u_31, (copy) p_u_14
		if v_u_10({ v_u_24, v_u_23 }) and not v_u_32.current then
			local v52 = v_u_24.current ~= nil
			assert(v52, "Scrubber ref is nil")
			local v53 = v_u_23.current ~= nil
			assert(v53, "Scrubber display ref is nil")
			v_u_32.current = v_u_11.Scrubber
			v_u_31.current = v_u_23.current.Position.X.Scale
			p_u_14(v_u_11.Scrubber)
		end
	end, { p_u_14 })
	local v_u_59 = v_u_7(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_31, (copy) v_u_24, (copy) p_u_16
		if v_u_10({ v_u_31, v_u_24 }) then
			local v55 = v_u_31.current ~= nil
			assert(v55, "Scrubber initial position ref is nil")
			local v56 = v_u_24.current ~= nil
			assert(v56, "Scrubber ref is nil")
			local v57 = v_u_24.current
			local v58 = v_u_31.current + v57.DragUDim2.X.Scale
			p_u_16((math.clamp(v58, 0, 1)))
		end
	end, { p_u_16 })
	local v_u_60 = v_u_7(function()
		-- upvalues: (copy) v_u_32, (ref) v_u_11, (copy) v_u_31, (copy) p_u_13
		if v_u_32.current == v_u_11.Scrubber then
			v_u_32.current = nil
			v_u_31.current = nil
			p_u_13()
		end
	end, { p_u_13 })
	local v_u_62 = v_u_7(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_22, (copy) v_u_32, (ref) v_u_11, (copy) v_u_29, (copy) v_u_25, (copy) v_u_30, (copy) v_u_27, (copy) p_u_14
		if v_u_10({ v_u_22 }) and not v_u_32.current then
			local v61 = v_u_22.current ~= nil
			assert(v61, "Selected outline ref is nil")
			v_u_32.current = v_u_11.Segment
			v_u_29.current = v_u_25:getValue()
			v_u_30.current = v_u_27:getValue()
			p_u_14(v_u_11.Segment)
		end
	end, { p_u_14 })
	local v_u_76 = v_u_7(function()
		-- upvalues: (ref) v_u_10, (copy) v_u_22, (copy) v_u_29, (copy) v_u_20, (copy) v_u_30, (copy) v_u_21, (copy) v_u_26, (ref) v_u_5, (copy) v_u_28, (copy) p_u_15, (copy) p_u_18
		if v_u_10({
			v_u_22,
			v_u_29,
			v_u_20,
			v_u_30,
			v_u_21
		}) then
			local v63 = v_u_22.current ~= nil
			assert(v63, "Selected outline ref is nil")
			local v64 = v_u_29.current ~= nil
			assert(v64, "Left handle initial position ref is nil")
			local v65 = v_u_20.current ~= nil
			assert(v65, "Left handle ref is nil")
			local v66 = v_u_30.current ~= nil
			assert(v66, "Right handle initial position ref is nil")
			local v67 = v_u_21.current ~= nil
			assert(v67, "Right handle ref is nil")
			local v68 = v_u_22.current.DragUDim2.X.Scale
			local v69 = v_u_29.current
			local v70 = v_u_30.current
			if v69 > 0 or v70 < 1 then
				local v71 = -v69
				local v72 = 1 - v70
				local v73 = math.clamp(v68, v71, v72)
				local v74 = v69 + v73
				local v75 = v70 + v73
				v_u_26(v_u_5.instant(v74))
				v_u_28(v_u_5.instant(v75))
				p_u_15(v74 * p_u_18, v75 * p_u_18)
			end
		else
			return
		end
	end, { p_u_15, p_u_18 })
	local v_u_77 = v_u_7(function()
		-- upvalues: (copy) v_u_32, (ref) v_u_11, (copy) v_u_29, (copy) v_u_30, (copy) p_u_13
		if v_u_32.current == v_u_11.Segment then
			v_u_32.current = nil
			v_u_29.current = nil
			v_u_30.current = nil
			p_u_13()
		end
	end, { p_u_13 })
	v_u_8(function()
		-- upvalues: (copy) p_u_12, (copy) v_u_20, (copy) v_u_34, (copy) v_u_41, (copy) v_u_42, (copy) v_u_21, (copy) v_u_44, (copy) v_u_50, (copy) v_u_51, (copy) v_u_24, (copy) v_u_54, (copy) v_u_59, (copy) v_u_60, (copy) v_u_22, (copy) v_u_62, (copy) v_u_76, (copy) v_u_77
		if p_u_12 then
			local v_u_78 = {}
			if v_u_20.current then
				local v79 = v_u_20.current.DragStart
				local v80 = v_u_34
				table.insert(v_u_78, v79:Connect(v80))
				local v81 = v_u_20.current.DragContinue
				local v82 = v_u_41
				table.insert(v_u_78, v81:Connect(v82))
				local v83 = v_u_20.current.DragEnd
				local v84 = v_u_42
				table.insert(v_u_78, v83:Connect(v84))
			end
			if v_u_21.current then
				local v85 = v_u_21.current.DragStart
				local v86 = v_u_44
				table.insert(v_u_78, v85:Connect(v86))
				local v87 = v_u_21.current.DragContinue
				local v88 = v_u_50
				table.insert(v_u_78, v87:Connect(v88))
				local v89 = v_u_21.current.DragEnd
				local v90 = v_u_51
				table.insert(v_u_78, v89:Connect(v90))
			end
			if v_u_24.current then
				local v91 = v_u_24.current.DragStart
				local v92 = v_u_54
				table.insert(v_u_78, v91:Connect(v92))
				local v93 = v_u_24.current.DragContinue
				local v94 = v_u_59
				table.insert(v_u_78, v93:Connect(v94))
				local v95 = v_u_24.current.DragEnd
				local v96 = v_u_60
				table.insert(v_u_78, v95:Connect(v96))
			end
			if v_u_22.current then
				local v97 = v_u_22.current.DragStart
				local v98 = v_u_62
				table.insert(v_u_78, v97:Connect(v98))
				local v99 = v_u_22.current.DragContinue
				local v100 = v_u_76
				table.insert(v_u_78, v99:Connect(v100))
				local v101 = v_u_22.current.DragEnd
				local v102 = v_u_77
				table.insert(v_u_78, v101:Connect(v102))
			end
			return function()
				-- upvalues: (copy) v_u_78
				for _, v103 in v_u_78 do
					v103:Disconnect()
				end
			end
		end
	end, {
		p_u_12,
		v_u_34,
		v_u_41,
		v_u_42,
		v_u_44,
		v_u_50,
		v_u_51,
		v_u_54,
		v_u_59,
		v_u_60,
		v_u_62,
		v_u_76,
		v_u_77
	})
	return {
		["dragContainerRef"] = v19,
		["leftHandleRef"] = v_u_20,
		["rightHandleRef"] = v_u_21,
		["scrubberDisplayRef"] = v_u_23,
		["scrubberRef"] = v_u_24,
		["segmentRef"] = v_u_22,
		["leftHandlePosition"] = v_u_25,
		["rightHandlePosition"] = v_u_27
	}
end