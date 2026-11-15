-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Skeleton.Skeleton
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactUtils).useClock
local v5 = v1.Components
require(v5.Types)
local v_u_6 = require(v5.View)
local v_u_7 = require(v1.Enums.Radius)
local v_u_8 = require(v1.Providers.Preferences.usePreferences)
local v_u_9 = require(v1.Utility.usePulseBinding)
local v_u_10 = require(v1.Providers.Style.useTokens)
local v_u_11 = require(v1.Utility.withCommonProps)
local v_u_12 = require(v1.Utility.withDefaults)
local v_u_13 = require(v1.Utility.lerp)
local v_u_14 = {
	["radius"] = nil,
	["Size"] = nil,
	["testId"] = "--foundation-skeleton",
	["radius"] = v_u_7.None,
	["Size"] = UDim2.fromScale(1, 1)
}
return v_u_3.memo(v_u_3.forwardRef(function(p15, p16) -- name: Skeleton
	-- upvalues: (copy) v_u_12, (copy) v_u_14, (copy) v_u_4, (copy) v_u_9, (copy) v_u_10, (copy) v_u_8, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_11, (copy) v_u_13
	local v17 = v_u_12(p15, v_u_14)
	local v18 = v_u_4()
	local v19 = v_u_9(2)
	local v20 = v_u_10()
	local v21 = v_u_8()
	local v22
	if v17.radius == v_u_7.None then
		v22 = nil
	else
		v22 = UDim.new(0, v20.Radius[v17.radius])
	end
	local v_u_23 = v20.Color.Common.Shimmer
	local v24 = v_u_3.createElement
	local v25 = v_u_6
	local v26 = v_u_11
	local v27 = {
		["cornerRadius"] = v22
	}
	local v28
	if v21.reducedMotion then
		v28 = v19:map(function(p29)
			-- upvalues: (copy) v_u_23, (ref) v_u_13
			local v30 = v_u_23.Transparency
			return {
				["Color3"] = v_u_23.Color3,
				["Transparency"] = v_u_13(v30, v30 - 0.1, p29)
			}
		end)
	else
		v28 = v20.Color.Extended.White.White_100
	end
	v27.backgroundStyle = v28
	v27.Size = v17.Size
	v27.ref = p16
	local v31 = v26(v17, v27)
	local v32 = {}
	local v33
	if v21.reducedMotion then
		v33 = nil
	else
		v33 = v_u_3.createElement("UIGradient", {
			["Color"] = nil,
			["Transparency"] = nil,
			["Offset"] = nil,
			["Rotation"] = 15,
			["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v_u_23.Color3), ColorSequenceKeypoint.new(0.5, v20.Color.Extended.White.White_30.Color3), ColorSequenceKeypoint.new(1, v_u_23.Color3) }),
			["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, v_u_23.Transparency), NumberSequenceKeypoint.new(0.5, v20.Color.Extended.White.White_30.Transparency), NumberSequenceKeypoint.new(1, v_u_23.Transparency) }),
			["Offset"] = v18:map(function(p34)
				return Vector2.new(p34 * 2 % 3 - 1.5, 0)
			end)
		})
	end
	v32.Gradient = v33
	return v24(v25, v31, v32)
end))