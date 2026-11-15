-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.KeyLabel.KeyLabel
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v1.Utility.Wrappers).Services.UserInputService
local v_u_4 = require(v2.React)
local v_u_5 = require(v2.ReactOtter)
local v6 = require(v2.ReactUtils)
local v_u_7 = require(script.Parent.getVisualForKey)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v_u_9 = require(v1.Utility.withCommonProps)
local v_u_10 = require(v1.Utility.withDefaults)
local v_u_11 = require(v1.Components.CircularProgressBar)
local v_u_12 = require(v1.Components.Image)
local v_u_13 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_14 = require(v1.Components.View)
local v_u_15 = v6.EventConnection
local v_u_16 = {
	["holdTime"] = 1,
	["resetTime"] = 0.5
}
local v_u_17 = {
	["testId"] = "--foundation-key-label"
}
local v_u_18 = Rect.new(Vector2.new(10, 9), Vector2.new(25, 25))
return v_u_4.memo(v_u_4.forwardRef(function(p19, p20) -- name: KeyLabel
	-- upvalues: (copy) v_u_10, (copy) v_u_17, (copy) v_u_16, (copy) v_u_8, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7, (copy) v_u_14, (copy) v_u_9, (copy) v_u_12, (copy) v_u_18, (copy) v_u_13, (copy) v_u_11, (copy) v_u_15, (copy) v_u_3
	local v_u_21 = v_u_10(p19, v_u_17)
	local v_u_22
	if v_u_21.holdBehavior then
		v_u_22 = v_u_10(v_u_21.holdBehavior, v_u_16)
	else
		v_u_22 = nil
	end
	local v23 = v_u_8()
	local v_u_24, v_u_25 = v_u_4.useState(nil)
	local v_u_26 = nil
	local v28, v29 = v_u_5.useAnimatedBinding(0, function(p27)
		-- upvalues: (copy) v_u_22, (copy) v_u_24, (ref) v_u_26, (ref) v_u_5, (copy) v_u_25
		if v_u_22 and (p27 == 1 and v_u_24) then
			v_u_26(v_u_5.ease(0, {
				["duration"] = v_u_22.resetTime,
				["easingStyle"] = Enum.EasingStyle.Linear
			}))
			v_u_25(nil)
			v_u_22.onEndHold(true)
		end
	end)
	local v_u_30 = v28
	v_u_26 = v29
	local v31 = v_u_7(v_u_21.keyCode)
	local v32 = v31.keyVisualType == "Image"
	local v33 = v_u_4.createElement
	local v34 = v_u_14
	local v35 = v_u_9(v_u_21, {
		["Size"] = v_u_21.Size,
		["ref"] = p20
	})
	local v36 = {}
	local v37 = v_u_4.createElement
	local v38 = v_u_12
	local v39 = {
		["Image"] = nil,
		["Size"] = nil,
		["ScaleType"] = nil,
		["imageStyle"] = nil,
		["slice"] = nil,
		["tag"] = "position-center-center anchor-center-center",
		["Image"] = not v32 and "icons/controls/keys/key_single" or v31.key,
		["Size"] = v31.size
	}
	local v40
	if v32 then
		v40 = nil
	else
		v40 = Enum.ScaleType.Slice
	end
	v39.ScaleType = v40
	local v41
	if v_u_24 then
		v41 = v23.Color.Content.Emphasis
	else
		v41 = v23.Color.Content.Muted
	end
	v39.imageStyle = v41
	v39.slice = not v32 and {
		["center"] = v_u_18
	} or nil
	local v42 = {}
	local v43
	if v32 then
		v43 = nil
	else
		v43 = v_u_4.createElement("UIPadding", {
			["PaddingBottom"] = UDim.new(0, 3)
		})
	end
	v42.CustomPadding = v43
	local v44
	if v32 then
		v44 = nil
	else
		local v45 = v_u_4.createElement
		local v46 = v_u_13
		local v47 = {
			["Text"] = nil,
			["textStyle"] = nil,
			["tag"] = "size-full-full auto-xy text-body-medium text-align-x-center",
			["Text"] = v31.key
		}
		local v48
		if v_u_24 then
			v48 = v23.Color.Content.Emphasis
		else
			v48 = v23.Color.Content.Muted
		end
		v47.textStyle = v48
		v44 = v45(v46, v47)
	end
	v42.Text = v44
	v36.Image = v37(v38, v39, v42)
	local v49
	if v_u_22 and v_u_22.holdTime > 0 then
		v49 = v_u_4.createElement(v_u_11, {
			["progress"] = nil,
			["tag"] = "size-full-full",
			["testId"] = nil,
			["progress"] = v_u_30,
			["testId"] = ("%*--indicator"):format(v_u_21.testId)
		}, {})
	else
		v49 = nil
	end
	v36.Indicator = v49
	local v50
	if v_u_22 then
		v50 = v_u_4.createElement(v_u_15, {
			["event"] = v_u_3.InputBegan,
			["callback"] = function(p51) -- name: callback
				-- upvalues: (copy) v_u_24, (copy) v_u_21, (copy) v_u_22, (copy) v_u_25, (ref) v_u_26, (ref) v_u_5, (ref) v_u_30
				if not v_u_24 then
					if p51.KeyCode == v_u_21.keyCode then
						if v_u_22.onBeginHold then
							v_u_22.onBeginHold()
						end
						if v_u_22.holdTime == 0 then
							v_u_22.onEndHold(true)
							return
						end
						v_u_25(p51)
						v_u_26(v_u_5.ease(1, {
							["duration"] = (1 - v_u_30:getValue()) * v_u_22.holdTime,
							["easingStyle"] = Enum.EasingStyle.Linear
						}))
					end
				end
			end
		})
	else
		v50 = nil
	end
	v36.InputBeganConnection = v50
	local v52
	if v_u_22 then
		v52 = v_u_4.createElement(v_u_15, {
			["event"] = v_u_3.InputEnded,
			["callback"] = function(p53) -- name: callback
				-- upvalues: (copy) v_u_24, (copy) v_u_22, (copy) v_u_25, (ref) v_u_26, (ref) v_u_5, (ref) v_u_30
				if p53 == v_u_24 then
					if v_u_22.onEndHold then
						v_u_22.onEndHold(false)
					end
					v_u_25(nil)
					v_u_26(v_u_5.ease(0, {
						["duration"] = v_u_30:getValue() * v_u_22.resetTime,
						["easingStyle"] = Enum.EasingStyle.Linear
					}))
				end
			end
		})
	else
		v52 = nil
	end
	v36.InputEndedConnection = v52
	return v33(v34, v35, v36)
end))