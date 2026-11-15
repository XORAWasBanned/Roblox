-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.TrimTooltip
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v3 = require(v2.Foundation)
local v4 = require(v2.MomentsCommon)
local v_u_5 = require(v2.React)
local v_u_6 = v3.Text
local v_u_7 = v3.View
local v_u_8 = v3.Hooks.useTokens
local v_u_9 = v4.Utils.getFormatTime
local v_u_10 = require(v1.Enums.DragHandle)
return function(p_u_11)
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6, (copy) v_u_9
	local v_u_12 = v_u_8()
	if p_u_11.activeHandle ~= v_u_10.LeftHandle and p_u_11.activeHandle ~= v_u_10.RightHandle or not p_u_11.timeLength then
		return nil
	end
	local v13
	if p_u_11.activeHandle == v_u_10.LeftHandle then
		v13 = p_u_11.leftHandlePosition
	elseif p_u_11.activeHandle == v_u_10.RightHandle then
		v13 = p_u_11.rightHandlePosition
	else
		v13 = nil
	end
	local v14 = v_u_5.createElement
	local v15 = v_u_7
	local v17 = {
		["tag"] = "align-x-center align-y-bottom anchor-bottom-center col gap-xsmall",
		["Position"] = nil,
		["Position"] = v13:map(function(p16)
			-- upvalues: (copy) v_u_12
			return UDim2.new(p16, 0, 0, -v_u_12.Padding.Small)
		end)
	}
	local v19 = {
		["TextContainer"] = v_u_5.createElement(v_u_7, {
			["tag"] = "anchor-center-center bg-system-contrast size-1600-800 radius-small",
			["LayoutOrder"] = 1
		}, {
			["TimeText"] = v_u_5.createElement(v_u_6, {
				["tag"] = "anchor-center-center auto-xy content-inverse-default position-center-center text-caption-medium",
				["Text"] = nil,
				["Text"] = v13:map(function(p18)
					-- upvalues: (ref) v_u_9, (copy) p_u_11
					return v_u_9(p18 * p_u_11.timeLength)
				end)
			})
		}),
		["VerticalBar"] = v_u_5.createElement(v_u_7, {
			["tag"] = "anchor-center-center bg-system-contrast size-50-300",
			["LayoutOrder"] = 2
		})
	}
	return v14(v15, v17, v19)
end