-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalNotice.useInternalNoticeLayout
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Enums.Breakpoint)
local v5 = require(v1.Utility.Responsive.BreakpointConfig)
require(v1.Components.Types)
local v_u_6 = require(v1.Utility.useAbsoluteSize)
local v_u_7 = v5.widths[v4.XSmall]
return function(p8) -- name: useInternalNoticeLayout
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_7
	local v9, v10 = v_u_6(p8)
	local v11, v_u_12 = v_u_3.useState(0)
	local v14 = v_u_3.useCallback(function(p13)
		-- upvalues: (copy) v_u_12
		v_u_12(p13.AbsoluteSize.X)
	end, {})
	local v15, v_u_16 = v_u_3.useState(0)
	local v18 = v_u_3.useCallback(function(p17)
		-- upvalues: (copy) v_u_16
		v_u_16(p17.AbsoluteSize.X)
	end, {})
	local v19
	if v9.X > 0 then
		v19 = v9.X <= v_u_7
	else
		v19 = false
	end
	local v20 = v9.X * 0.30000000000000004
	local v21
	if v20 > 0 then
		v21 = v20 < v11
	else
		v21 = false
	end
	local v22 = v19 or v21
	if v22 then
		v14 = nil
	end
	return {
		["isStacked"] = v22,
		["onNoticeAbsoluteSizeChanged"] = v10,
		["onStackedColumnAbsoluteSizeChanged"] = v18,
		["measureInlineLink"] = v14,
		["stackedLinkConstraint"] = v22 and v15 > 0 and {
			["MaxSize"] = Vector2.new(v15, (1 / 0))
		} or nil
	}
end