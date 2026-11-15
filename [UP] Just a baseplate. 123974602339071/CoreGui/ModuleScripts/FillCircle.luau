-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ReportPage.FillCircle
local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.t
local v6 = v3.UIBlox
local v7 = script.Parent.Parent.Parent
local v_u_8 = require(v7.Resources.Assets)
local v_u_9 = v6.Core.ImageSet.ImageSetLabel
local v_u_10 = require(v2.Packages.Foundation).Image
local v_u_11 = require(v2.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_12 = Color3.fromRGB(98, 98, 99)
local v_u_13 = Color3.fromRGB(255, 255, 255)
local v_u_14 = Color3.fromRGB(196, 0, 1)
local v15 = v_u_4.PureComponent:extend("FillCircle")
v15.validateProps = v5.strictInterface({
	["Position"] = v5.UDim2,
	["AnchorPoint"] = v5.Vector2,
	["fillFraction"] = v5.number,
	["largerCircleFraction"] = v5.number,
	["popCircleFraction"] = v5.number,
	["shakeCircleFraction"] = v5.number,
	["BackgroundColor"] = v5.Color3
})
local function v_u_24(p16, p17, p18, p19) -- name: largerCircleAnimation
	if p18 then
		p16 = 0.26666666666666666 - p16
	end
	local v20
	if p16 >= 0 then
		v20 = p16 <= 0.16666666666666666
	else
		v20 = false
	end
	if v20 then
		local v21 = 16 + 6 * ((p16 - 0) / 0.16666666666666666)
		p17.size(UDim2.new(0, v21, 0, v21))
		return
	else
		local v22
		if p16 >= 0.16666666666666666 then
			v22 = p16 <= 0.26666666666666666
		else
			v22 = false
		end
		if v22 then
			local v23 = 22 - 2 * ((p16 - 0.16666666666666666) / 0.1)
			p17.size(UDim2.new(0, v23, 0, v23))
			return
		elseif p16 < 0 then
			p17.size(UDim2.new(0, 16, 0, 16))
			p19()
		else
			p17.size(UDim2.new(0, 20, 0, 20))
			p19()
		end
	end
end
local function v_u_32(p25, p26, _, p27) -- name: popCircleAnimation
	local v28
	if p25 >= 0 then
		v28 = p25 <= 0.1
	else
		v28 = false
	end
	if v28 then
		local v29 = 20 + 4 * ((p25 - 0) / 0.1)
		p26.size(UDim2.new(0, v29, 0, v29))
		return
	else
		local v30
		if p25 >= 0.1 then
			v30 = p25 <= 0.2
		else
			v30 = false
		end
		if v30 then
			local v31 = 24 - 4 * ((p25 - 0.1) / 0.1)
			p26.size(UDim2.new(0, v31, 0, v31))
		else
			p26.size(UDim2.new(0, 20, 0, 20))
			p27()
		end
	end
end
local function v_u_48(p33, p34, _, p35) -- name: shakeCircleAnimation
	local v36
	if p33 >= 0 then
		v36 = p33 <= 0.1
	else
		v36 = false
	end
	if v36 then
		local v37 = (p33 - 0) / 0.1
		p34.positionOffset(UDim2.new(0, -4 * v37, 0, 0))
		return
	else
		local v38
		if p33 >= 0.1 then
			v38 = p33 <= 0.2
		else
			v38 = false
		end
		if v38 then
			local v39 = (p33 - 0.1) / 0.1
			p34.positionOffset(UDim2.new(0, -4 + 12 * v39, 0, 0))
			return
		else
			local v40
			if p33 >= 0.2 then
				v40 = p33 <= 0.26666666666666666
			else
				v40 = false
			end
			if v40 then
				local v41 = (p33 - 0.2) / 0.06666666666666667
				p34.positionOffset(UDim2.new(0, 8 - 16 * v41, 0, 0))
				return
			else
				local v42
				if p33 >= 0.26666666666666666 then
					v42 = p33 <= 0.3333333333333333
				else
					v42 = false
				end
				if v42 then
					local v43 = (p33 - 0.26666666666666666) / 0.06666666666666667
					p34.positionOffset(UDim2.new(0, -8 + 16 * v43, 0, 0))
					return
				else
					local v44
					if p33 >= 0.3333333333333333 then
						v44 = p33 <= 0.4
					else
						v44 = false
					end
					if v44 then
						local v45 = (p33 - 0.3333333333333333) / 0.06666666666666667
						p34.positionOffset(UDim2.new(0, 8 - 16 * v45, 0, 0))
						return
					else
						local v46
						if p33 >= 0.4 then
							v46 = p33 <= 0.4666666666666667
						else
							v46 = false
						end
						if v46 then
							local v47 = (p33 - 0.4) / 0.06666666666666667
							p34.positionOffset(UDim2.new(0, -8 + 8 * v47, 0, 0))
						else
							p34.positionOffset(UDim2.new(0, 0, 0, 0))
							p35()
						end
					end
				end
			end
		end
	end
end
function v15.init(p49) -- name: init
	-- upvalues: (copy) v_u_4
	local v50, v51 = v_u_4.createBinding(UDim2.new(0, 16, 0, 16))
	p49.sizeBinding = v50
	p49.sizeBindingUpdate = v51
	p49.largerSizeBinding = p49.sizeBinding:map(function(p52)
		return p52 + UDim2.new(0, 2, 0, 2)
	end)
	local v53, v54 = v_u_4.createBinding(UDim2.new(0, 0, 0, 0))
	p49.positionOffsetBinding = v53
	p49.positionOffsetBindingUpdate = v54
	p49.updateBindings = {
		["size"] = p49.sizeBindingUpdate,
		["positionOffset"] = p49.positionOffsetBindingUpdate
	}
	p49.animationStartTime = nil
	p49.animationFunction = nil
	p49.reverseAnimation = false
	p49.renderSteppedConnection = nil
end
function v15.render(p55) -- name: render
	-- upvalues: (copy) v_u_14, (copy) v_u_13, (copy) v_u_4, (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_8, (copy) v_u_9
	local v56 = p55.props
	local v57 = v56.fillFraction >= 1 and v_u_14 or v_u_13
	local v58 = v_u_4.createElement
	local v59 = "Frame"
	local v60 = {
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = p55.sizeBinding,
		["Position"] = v56.Position,
		["AnchorPoint"] = v56.AnchorPoint
	}
	local v61 = {}
	local v62 = v_u_4.createElement
	local v63 = "Frame"
	local v64 = {
		["Position"] = nil,
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = nil,
		["Position"] = p55.positionOffsetBinding,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["BackgroundColor3"] = v_u_12
	}
	local v65 = {}
	local v66
	if v_u_11 then
		v66 = v_u_4.createElement(v_u_10, {
			["Image"] = nil,
			["Size"] = nil,
			["imageStyle"] = nil,
			["ZIndex"] = 10,
			["Image"] = v_u_8.Images.CircleCutout,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["imageStyle"] = {
				["Color3"] = nil,
				["Transparency"] = 0,
				["Color3"] = v56.BackgroundColor
			}
		})
	else
		v66 = v_u_4.createElement(v_u_9, {
			["Image"] = nil,
			["Size"] = nil,
			["ImageColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 10,
			["Image"] = v_u_8.Images.CircleCutout,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["ImageColor3"] = v56.BackgroundColor
		})
	end
	v65.OuterRing = v66
	local v67
	if v_u_11 then
		v67 = v_u_4.createElement(v_u_10, {
			["Image"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["imageStyle"] = nil,
			["ZIndex"] = 10,
			["Image"] = v_u_8.Images.Circle,
			["Size"] = UDim2.new(1, -4, 1, -4),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["imageStyle"] = {
				["Color3"] = nil,
				["Transparency"] = 0,
				["Color3"] = v56.BackgroundColor
			}
		})
	else
		v67 = v_u_4.createElement(v_u_9, {
			["Image"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["ImageColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 10,
			["Image"] = v_u_8.Images.Circle,
			["Size"] = UDim2.new(1, -4, 1, -4),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["ImageColor3"] = v56.BackgroundColor
		})
	end
	v65.InnerRing = v67
	local v68 = v_u_4.createElement
	local v69 = "Frame"
	local v70 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Rotation"] = nil,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0, 0, 0, 0),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Rotation"] = v56.fillFraction * 360
	}
	local v71 = v56.fillFraction
	v70.ZIndex = v71 > 0.75 and 8 or (v71 > 0.5 and 6 or (v71 > 0.25 and 4 or (v71 > 0 and 2 or 0)))
	local v72 = {}
	local v73
	if v_u_11 then
		v73 = v_u_4.createElement(v_u_10, {
			["Image"] = v_u_8.Images.QuarterCircle,
			["Size"] = p55.largerSizeBinding,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["imageStyle"] = {
				["Color3"] = nil,
				["Transparency"] = 0,
				["Color3"] = v57
			}
		})
	else
		v73 = v_u_4.createElement(v_u_9, {
			["Image"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["ImageColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = v_u_8.Images.QuarterCircle,
			["Size"] = p55.largerSizeBinding,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["ImageColor3"] = v57
		})
	end
	v72.FillRing = v73
	v65.FillRingRotationFrame = v68(v69, v70, v72)
	v65.EdgeBlockers = v_u_4.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["ZIndex"] = 10,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}, {
		["Top"] = v_u_4.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = Vector2.new(0.5, 1),
			["Position"] = UDim2.new(0.5, 0, 0, 0),
			["Size"] = UDim2.new(1, 4, 0, 2),
			["BackgroundColor3"] = v56.BackgroundColor
		}),
		["Right"] = v_u_4.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(1, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 2, 1, 4),
			["BackgroundColor3"] = v56.BackgroundColor
		}),
		["Bottom"] = v_u_4.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Position"] = UDim2.new(0.5, 0, 1, 0),
			["Size"] = UDim2.new(1, 4, 0, 2),
			["BackgroundColor3"] = v56.BackgroundColor
		}),
		["Left"] = v_u_4.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Position"] = UDim2.new(0, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 2, 1, 4),
			["BackgroundColor3"] = v56.BackgroundColor
		})
	})
	v65.TopLeftFill = v_u_4.createElement("Frame", {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0.5, 0, 0.5, 0),
		["BackgroundColor3"] = v56.fillFraction >= 1 and v57 and v57 or v_u_12,
		["ZIndex"] = v56.fillFraction >= 1 and 9 or 7
	})
	v65.BottomLeftFill = v_u_4.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0.5, 0, 0.5, 0),
		["Position"] = UDim2.new(0, 0, 0.5, 0),
		["BackgroundColor3"] = v56.fillFraction >= 0.75 and v57 and v57 or v_u_12,
		["ZIndex"] = v56.fillFraction >= 0.75 and 9 or 5
	})
	v65.BottomRightFill = v_u_4.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0.5, 0, 0.5, 0),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["BackgroundColor3"] = v56.fillFraction >= 0.5 and v57 and v57 or v_u_12,
		["ZIndex"] = v56.fillFraction >= 0.5 and 9 or 3
	})
	v65.TopRightFill = v_u_4.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0.5, 0, 0.5, 0),
		["Position"] = UDim2.new(0.5, 0, 0, 0),
		["BackgroundColor3"] = v56.fillFraction >= 0.25 and v57 and v57 or v_u_12,
		["ZIndex"] = v56.fillFraction >= 0.25 and 9 or 1
	})
	v61.PositionOffsetFrame = v62(v63, v64, v65)
	return v58(v59, v60, v61)
end
function v15.didUpdate(p74, p75, _) -- name: didUpdate
	-- upvalues: (copy) v_u_24, (copy) v_u_32, (copy) v_u_48
	local v76 = p75.fillFraction >= p75.largerCircleFraction
	local v77 = p74.props.fillFraction >= p74.props.largerCircleFraction
	if v76 ~= v77 then
		p74:playAnimation(v_u_24, not v77)
	end
	local v78 = p75.fillFraction >= p75.popCircleFraction
	if p74.props.fillFraction >= p74.props.popCircleFraction and not v78 then
		p74:playAnimation(v_u_32, false)
	end
	local v79 = p75.fillFraction >= p75.shakeCircleFraction
	if p74.props.fillFraction >= p74.props.shakeCircleFraction and not v79 then
		p74:playAnimation(v_u_48, false)
	end
end
function v15.playAnimation(p_u_80, p81, p82) -- name: playAnimation
	-- upvalues: (copy) v_u_1
	if p_u_80.animationFunction then
		p_u_80.animationFunction(100, p_u_80.updateBindings, p_u_80.reverseAnimation, function() end)
	end
	p_u_80.animationStartTime = tick()
	p_u_80.animationFunction = p81
	p_u_80.reverseAnimation = p82
	if not p_u_80.renderSteppedConnection then
		p_u_80.renderSteppedConnection = v_u_1.RenderStepped:Connect(function()
			-- upvalues: (copy) p_u_80
			p_u_80.animationFunction(tick() - p_u_80.animationStartTime, p_u_80.updateBindings, p_u_80.reverseAnimation, function()
				-- upvalues: (ref) p_u_80
				p_u_80:stopAnimation()
			end)
		end)
	end
end
function v15.stopAnimation(p83) -- name: stopAnimation
	if p83.renderSteppedConnection then
		p83.renderSteppedConnection:Disconnect()
		p83.renderSteppedConnection = nil
	end
end
function v15.willUnmount(p84) -- name: willUnmount
	p84:stopAnimation()
end
return v15