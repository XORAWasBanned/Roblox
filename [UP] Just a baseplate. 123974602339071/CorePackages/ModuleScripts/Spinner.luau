-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Button.Spinner
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.isPluginSecurity)
local v5 = require(v2.Motion)
local v_u_6 = v5.useMotion
local v_u_7 = v5.usePresence
local v_u_8 = require(script.Parent.useSpinnerMotionStates)
local v_u_9 = require(v1.Utility.Flags)
local v_u_10 = require(v1.Components.Image)
require(v1.Components.Types)
local v_u_11 = require(v1.Components.View)
local v_u_12 = require(v1.Utility.useRotation)
local v_u_13 = require(v1.Utility.withDefaults)
local function v_u_20(p14) -- name: IconSpinner
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_10
	local v15 = v_u_12(2)
	local v16 = v_u_3.createElement
	local v17 = v_u_10
	local v18 = {
		["Image"] = "icons/status/loading_large",
		["imageStyle"] = nil,
		["Rotation"] = nil,
		["tag"] = "position-center-center anchor-center-center size-full-full",
		["testId"] = nil,
		["imageStyle"] = p14.style,
		["Rotation"] = v15,
		["testId"] = p14.testId
	}
	local v19 = {
		["UIScale"] = v_u_3.createElement("UIScale", {
			["Scale"] = p14.scale
		})
	}
	return v16(v17, v18, v19)
end
local v_u_21 = {
	Path2DControlPoint.new(UDim2.fromScale(1, 0.5), UDim2.fromScale(0, 0.25), UDim2.fromScale(0, -0.25)),
	Path2DControlPoint.new(UDim2.fromScale(0.5, 0), UDim2.fromScale(0.25, 0), UDim2.fromScale(-0.25, 0)),
	Path2DControlPoint.new(UDim2.fromScale(0, 0.5), UDim2.fromScale(0, -0.33), UDim2.fromScale(0, 0.33)),
	Path2DControlPoint.new(UDim2.fromScale(0.5, 1), UDim2.fromScale(-0.25, 0), UDim2.fromScale(0.25, 0))
}
local function v_u_36(p22) -- name: Path2DSpinner
	-- upvalues: (copy) v_u_3, (copy) v_u_12, (copy) v_u_21, (copy) v_u_11, (copy) v_u_4
	local v_u_23 = v_u_3.useRef(nil)
	local v24 = v_u_12(2)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_23, (ref) v_u_21
		local v25 = v_u_23.current
		if v25 ~= nil then
			v25:SetControlPoints(v_u_21)
		end
	end, {})
	local v26 = v_u_3.createElement
	local v27 = v_u_11
	local v28 = {
		["tag"] = "position-center-center anchor-center-center size-full",
		["Rotation"] = nil,
		["testId"] = nil,
		["Rotation"] = v24,
		["testId"] = p22.testId
	}
	local v29 = {}
	local v30 = v_u_3.createElement
	local v31 = "Path2D"
	local v33 = {
		["ref"] = nil,
		["Closed"] = false,
		["Color3"] = nil,
		["Transparency"] = nil,
		["Thickness"] = nil,
		["ref"] = v_u_23,
		["Color3"] = p22.style:map(function(p32)
			return p32.Color3
		end)
	}
	local v34
	if v_u_4() then
		v34 = p22.style:map(function(p35)
			return p35.Transparency
		end)
	else
		v34 = nil
	end
	v33.Transparency = v34
	v33.Thickness = p22.Thickness
	v29.Circle = v30(v31, v33)
	v29.UIScale = v_u_3.createElement("UIScale", {
		["Scale"] = p22.scale
	})
	return v26(v27, v28, v29)
end
local v_u_37 = {
	["style"] = {}
}
return v_u_3.memo(v_u_3.forwardRef(function(p38, p39) -- name: Spinner
	-- upvalues: (copy) v_u_13, (copy) v_u_37, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (copy) v_u_11, (copy) v_u_9, (copy) v_u_36, (copy) v_u_20
	local v40 = v_u_13(p38, v_u_37)
	local v_u_41 = v_u_8()
	local v42, v_u_43 = v_u_6(v_u_41.Default)
	local v_u_44 = v_u_7()
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_44, (copy) v_u_43, (copy) v_u_41
		if v_u_44.isPresent then
			v_u_43(v_u_41.Loading)
		else
			v_u_43(v_u_41.Default, {
				["onAnimationComplete"] = v_u_44.onExitComplete
			})
		end
	end, { v_u_44.isPresent })
	local v45 = v_u_3.createElement
	local v46 = v_u_11
	local v47 = {
		["tag"] = "position-center-center anchor-center-center",
		["Size"] = nil,
		["ref"] = nil,
		["Size"] = v40.Size,
		["ref"] = p39
	}
	local v48 = {}
	local v49 = v_u_3.createElement
	local v50
	if v_u_9.FoundationUsePath2DSpinner then
		v50 = v_u_36
	else
		v50 = v_u_20
	end
	local v52 = {
		["scale"] = v42.scale,
		["style"] = v_u_3.joinBindings({
			["style"] = v40.style,
			["transparency"] = v42.transparency
		}):map(function(p51)
			return {
				["Color3"] = p51.style.Color3,
				["Transparency"] = p51.style.Transparency + p51.transparency / 2
			}
		end)
	}
	local v53 = v40.Size.X.Offset / 8
	local v54 = math.floor(v53)
	v52.Thickness = math.max(v54, 1)
	v52.testId = v40.testId
	v48.Spinner = v49(v50, v52)
	return v45(v46, v47, v48)
end))