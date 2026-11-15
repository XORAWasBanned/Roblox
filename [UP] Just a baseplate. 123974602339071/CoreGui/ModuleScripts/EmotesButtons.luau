-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Components.EmotesButtons
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent
local v5 = v4.Actions
local v6 = v4.Thunks
local v7 = v4.Utility
local v_u_8 = require(v4.Constants)
local v_u_9 = require(v7.GetSegmentFromPosition)
local v_u_10 = require(v5.FocusSegment)
local v_u_11 = require(v5.HideMenu)
local v_u_12 = require(v6.PlayEmote)
local v13 = v_u_2.PureComponent:extend("EmotesButtons")
local function v_u_20(p14, p15) -- name: getSegmentFromInput
	-- upvalues: (copy) v_u_8, (copy) v_u_9
	local v16 = Vector2.new(p15.Position.X, p15.Position.Y) - p14.AbsolutePosition - p14.AbsoluteSize / 2
	local v17 = Vector2.new(v16.X, -v16.Y)
	local v18 = p14.AbsoluteSize.X / 2
	local v19
	if v18 * v_u_8.InnerCircleSizeRatio < v17.Magnitude then
		v19 = v17.Magnitude < v18
	else
		v19 = false
	end
	return not v19 and 0 or v_u_9(v17)
end
function v13.render(p_u_21) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_20
	local v22 = p_u_21.props.emotesPage.currentEmotes
	local v23 = p_u_21.props.emotesPage.emotesInfo
	local v24 = {}
	for v25, v26 in pairs(v22) do
		local v27 = v23[v26]
		if v_u_8.EmotesPerPage < v25 then
			warn("EmotesMenu: Number of emotes in page exceeds max emotes per page")
			break
		end
		local v28 = 360 / v_u_8.EmotesPerPage * (v25 - 1) + v_u_8.SegmentsStartRotation
		local v29 = v_u_8.InnerCircleSizeRatio / 2
		local v30 = (1 - v_u_8.InnerCircleSizeRatio) / 2 - v_u_8.SlotNumberSize - v_u_8.ImageOutsidePadding
		local v31 = v30 / 2 + v_u_8.SlotNumberSize - v_u_8.ImageOutsidePadding / 2
		local v32 = math.rad(v28)
		local v33 = math.cos(v32)
		local v34 = v29 * v33
		local v35 = v31 * v33
		local v36 = 0.5 + v34 + v35
		local v37 = math.rad(v28)
		local v38 = math.sin(v37)
		local v39 = v29 * v38
		local v40 = v31 * v38
		local v41 = 0.5 + v39 + v40
		local v42
		if #v27 == 0 then
			v42 = nil
		else
			v42 = v27[math.random(1, #v27)]
		end
		local v43 = v_u_8.EmotesImage:format(v42)
		v24[v25] = v_u_2.createElement("ImageLabel", {
			["Image"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 2,
			["Image"] = v43,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(v36, 0, v41, 0),
			["Size"] = UDim2.new(v30, 0, v30, 0)
		}, {
			["AsspectRatioConstraint"] = v_u_2.createElement("UIAspectRatioConstraint", {
				["AspectRatio"] = 1
			})
		})
	end
	return v_u_2.createElement("TextButton", {
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["BackgroundTransparency"] = 1,
		["Text"] = "",
		[v_u_2.Event.InputChanged] = function(p44, p45)
			-- upvalues: (ref) v_u_20, (copy) p_u_21
			local v46 = p45.UserInputType
			if v46 == Enum.UserInputType.MouseMovement or v46 == Enum.UserInputType.Touch then
				local v47 = v_u_20(p44, p45)
				if v47 == p_u_21.props.emotesWheel.focusedSegmentIndex then
					return
				end
				if p_u_21.props.emotesPage.currentEmotes[v47] then
					p_u_21.props.focusSegment(v47)
					return
				end
				p_u_21.props.focusSegment(0)
			end
		end,
		[v_u_2.Event.Activated] = function(p48, p49)
			-- upvalues: (ref) v_u_20, (copy) p_u_21
			local v50 = v_u_20(p48, p49)
			if v50 == 0 then
				p_u_21.props.hideMenu()
				return
			else
				local v51 = p_u_21.props.emotesPage.currentEmotes[v50]
				if v51 then
					local v52 = p_u_21.props.emotesPage.emotesInfo[v51]
					if v52 then
						local v53
						if #v52 == 0 then
							v53 = nil
						else
							v53 = v52[math.random(1, #v52)]
						end
						p_u_21.props.playEmote(v51, v50, v53)
					end
				else
					return
				end
			end
		end,
		[v_u_2.Event.MouseLeave] = function()
			-- upvalues: (copy) p_u_21
			p_u_21.props.focusSegment(0)
		end
	}, v24)
end
return v3.connect(function(p54) -- name: mapStateToProps
	return {
		["displayOptions"] = p54.displayOptions,
		["emotesPage"] = p54.emotesPage,
		["emotesWheel"] = p54.emotesWheel
	}
end, function(p_u_55) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_12, (copy) v_u_10, (copy) v_u_11
	return {
		["playEmote"] = function(p56, p57, p58) -- name: playEmote
			-- upvalues: (copy) p_u_55, (ref) v_u_12
			return p_u_55(v_u_12(p56, p57, p58))
		end,
		["focusSegment"] = function(p59) -- name: focusSegment
			-- upvalues: (copy) p_u_55, (ref) v_u_10
			return p_u_55(v_u_10(p59))
		end,
		["hideMenu"] = function() -- name: hideMenu
			-- upvalues: (copy) p_u_55, (ref) v_u_11
			return p_u_55(v_u_11())
		end
	}
end)(v13)