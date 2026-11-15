-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.FillCircle
local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Roact)
local v4 = require(v2.Packages.UIBlox)
local v5 = require(v2.Packages.t)
local v_u_6 = v4.Core.ImageSet.ImageSetLabel
local v7 = v4.App.ImageSet.Images
local v_u_8 = Color3.fromRGB(98, 98, 99)
local v_u_9 = Color3.fromRGB(255, 255, 255)
local v_u_10 = Color3.fromRGB(196, 0, 1)
local v_u_11 = v7["component_assets/circle_29"]
local v12 = v_u_3.PureComponent:extend("FillCircle")
v12.validateProps = v5.strictInterface({
	["Position"] = v5.UDim2,
	["AnchorPoint"] = v5.Vector2,
	["fillFraction"] = v5.number,
	["largerCircleFraction"] = v5.number,
	["popCircleFraction"] = v5.number,
	["shakeCircleFraction"] = v5.number,
	["BackgroundColor"] = v5.Color3
})
local function v_u_21(p13, p14, p15, p16) -- name: largerCircleAnimation
	if p15 then
		p13 = 0.26666666666666666 - p13
	end
	local v17
	if p13 >= 0 then
		v17 = p13 <= 0.16666666666666666
	else
		v17 = false
	end
	if v17 then
		local v18 = 16 + 6 * ((p13 - 0) / 0.16666666666666666)
		p14.size(UDim2.new(0, v18, 0, v18))
		return
	else
		local v19
		if p13 >= 0.16666666666666666 then
			v19 = p13 <= 0.26666666666666666
		else
			v19 = false
		end
		if v19 then
			local v20 = 22 - 2 * ((p13 - 0.16666666666666666) / 0.1)
			p14.size(UDim2.new(0, v20, 0, v20))
			return
		elseif p13 < 0 then
			p14.size(UDim2.new(0, 16, 0, 16))
			p16()
		else
			p14.size(UDim2.new(0, 20, 0, 20))
			p16()
		end
	end
end
local function v_u_29(p22, p23, _, p24) -- name: popCircleAnimation
	local v25
	if p22 >= 0 then
		v25 = p22 <= 0.1
	else
		v25 = false
	end
	if v25 then
		local v26 = 20 + 4 * ((p22 - 0) / 0.1)
		p23.size(UDim2.new(0, v26, 0, v26))
		return
	else
		local v27
		if p22 >= 0.1 then
			v27 = p22 <= 0.2
		else
			v27 = false
		end
		if v27 then
			local v28 = 24 - 4 * ((p22 - 0.1) / 0.1)
			p23.size(UDim2.new(0, v28, 0, v28))
		else
			p23.size(UDim2.new(0, 20, 0, 20))
			p24()
		end
	end
end
local function v_u_45(p30, p31, _, p32) -- name: shakeCircleAnimation
	local v33
	if p30 >= 0 then
		v33 = p30 <= 0.1
	else
		v33 = false
	end
	if v33 then
		local v34 = (p30 - 0) / 0.1
		p31.positionOffset(UDim2.new(0, -4 * v34, 0, 0))
		return
	else
		local v35
		if p30 >= 0.1 then
			v35 = p30 <= 0.2
		else
			v35 = false
		end
		if v35 then
			local v36 = (p30 - 0.1) / 0.1
			p31.positionOffset(UDim2.new(0, -4 + 12 * v36, 0, 0))
			return
		else
			local v37
			if p30 >= 0.2 then
				v37 = p30 <= 0.26666666666666666
			else
				v37 = false
			end
			if v37 then
				local v38 = (p30 - 0.2) / 0.06666666666666667
				p31.positionOffset(UDim2.new(0, 8 - 16 * v38, 0, 0))
				return
			else
				local v39
				if p30 >= 0.26666666666666666 then
					v39 = p30 <= 0.3333333333333333
				else
					v39 = false
				end
				if v39 then
					local v40 = (p30 - 0.26666666666666666) / 0.06666666666666667
					p31.positionOffset(UDim2.new(0, -8 + 16 * v40, 0, 0))
					return
				else
					local v41
					if p30 >= 0.3333333333333333 then
						v41 = p30 <= 0.4
					else
						v41 = false
					end
					if v41 then
						local v42 = (p30 - 0.3333333333333333) / 0.06666666666666667
						p31.positionOffset(UDim2.new(0, 8 - 16 * v42, 0, 0))
						return
					else
						local v43
						if p30 >= 0.4 then
							v43 = p30 <= 0.4666666666666667
						else
							v43 = false
						end
						if v43 then
							local v44 = (p30 - 0.4) / 0.06666666666666667
							p31.positionOffset(UDim2.new(0, -8 + 8 * v44, 0, 0))
						else
							p31.positionOffset(UDim2.new(0, 0, 0, 0))
							p32()
						end
					end
				end
			end
		end
	end
end
function v12.init(p46) -- name: init
	-- upvalues: (copy) v_u_3
	local v47, v48 = v_u_3.createBinding(UDim2.new(0, 16, 0, 16))
	p46.sizeBinding = v47
	p46.sizeBindingUpdate = v48
	p46.largerSizeBinding = p46.sizeBinding:map(function(p49)
		return p49 + UDim2.new(0, 2, 0, 2)
	end)
	local v50, v51 = v_u_3.createBinding(UDim2.new(0, 0, 0, 0))
	p46.positionOffsetBinding = v50
	p46.positionOffsetBindingUpdate = v51
	p46.updateBindings = {
		["size"] = p46.sizeBindingUpdate,
		["positionOffset"] = p46.positionOffsetBindingUpdate
	}
	p46.animationStartTime = nil
	p46.animationFunction = nil
	p46.reverseAnimation = false
	p46.renderSteppedConnection = nil
end
function v12.render(p52) -- name: render
	-- upvalues: (copy) v_u_10, (copy) v_u_9, (copy) v_u_3, (copy) v_u_8, (copy) v_u_6, (copy) v_u_11
	local v53 = p52.props
	local v54 = v53.fillFraction >= 1 and v_u_10 or v_u_9
	local v55 = v_u_3.createElement
	local v56 = {
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = p52.sizeBinding,
		["Position"] = v53.Position,
		["AnchorPoint"] = v53.AnchorPoint
	}
	local v57 = {}
	local v58 = v_u_3.createElement
	local v59 = {
		["Position"] = nil,
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = nil,
		["Position"] = p52.positionOffsetBinding,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["BackgroundColor3"] = v_u_8
	}
	local v60 = {
		["OuterRing"] = v_u_3.createElement(v_u_6, {
			["Image"] = "rbxasset://textures/ui/InGameMenu/CircleCutout.png",
			["Size"] = nil,
			["ImageColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 10,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["ImageColor3"] = v53.BackgroundColor
		}),
		["InnerRing"] = v_u_3.createElement(v_u_6, {
			["Image"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["ImageColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 10,
			["Image"] = v_u_11,
			["Size"] = UDim2.new(1, -4, 1, -4),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["ImageColor3"] = v53.BackgroundColor
		})
	}
	local v61 = v_u_3.createElement
	local v62 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Rotation"] = nil,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0, 0, 0, 0),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Rotation"] = v53.fillFraction * 360
	}
	local v63 = v53.fillFraction
	v62.ZIndex = v63 > 0.75 and 8 or (v63 > 0.5 and 6 or (v63 > 0.25 and 4 or (v63 > 0 and 2 or 0)))
	v60.FillRingRotationFrame = v61("Frame", v62, {
		["FillRing"] = v_u_3.createElement(v_u_6, {
			["Image"] = "rbxasset://textures/ui/InGameMenu/QuarterCircle.png",
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["ImageColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = p52.largerSizeBinding,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["ImageColor3"] = v54
		})
	})
	v60.EdgeBlockers = v_u_3.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["ZIndex"] = 10,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}, {
		["Top"] = v_u_3.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = Vector2.new(0.5, 1),
			["Position"] = UDim2.new(0.5, 0, 0, 0),
			["Size"] = UDim2.new(1, 4, 0, 2),
			["BackgroundColor3"] = v53.BackgroundColor
		}),
		["Right"] = v_u_3.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(1, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 2, 1, 4),
			["BackgroundColor3"] = v53.BackgroundColor
		}),
		["Bottom"] = v_u_3.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Position"] = UDim2.new(0.5, 0, 1, 0),
			["Size"] = UDim2.new(1, 4, 0, 2),
			["BackgroundColor3"] = v53.BackgroundColor
		}),
		["Left"] = v_u_3.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Position"] = UDim2.new(0, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 2, 1, 4),
			["BackgroundColor3"] = v53.BackgroundColor
		})
	})
	v60.TopLeftFill = v_u_3.createElement("Frame", {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0.5, 0, 0.5, 0),
		["BackgroundColor3"] = v53.fillFraction >= 1 and v54 and v54 or v_u_8,
		["ZIndex"] = v53.fillFraction >= 1 and 9 or 7
	})
	v60.BottomLeftFill = v_u_3.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0.5, 0, 0.5, 0),
		["Position"] = UDim2.new(0, 0, 0.5, 0),
		["BackgroundColor3"] = v53.fillFraction >= 0.75 and v54 and v54 or v_u_8,
		["ZIndex"] = v53.fillFraction >= 0.75 and 9 or 5
	})
	v60.BottomRightFill = v_u_3.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0.5, 0, 0.5, 0),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["BackgroundColor3"] = v53.fillFraction >= 0.5 and v54 and v54 or v_u_8,
		["ZIndex"] = v53.fillFraction >= 0.5 and 9 or 3
	})
	v60.TopRightFill = v_u_3.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0.5, 0, 0.5, 0),
		["Position"] = UDim2.new(0.5, 0, 0, 0),
		["BackgroundColor3"] = v53.fillFraction >= 0.25 and v54 and v54 or v_u_8,
		["ZIndex"] = v53.fillFraction >= 0.25 and 9 or 1
	})
	v57.PositionOffsetFrame = v58("Frame", v59, v60)
	return v55("Frame", v56, v57)
end
function v12.didUpdate(p64, p65, _) -- name: didUpdate
	-- upvalues: (copy) v_u_21, (copy) v_u_29, (copy) v_u_45
	local v66 = p65.fillFraction >= p65.largerCircleFraction
	local v67 = p64.props.fillFraction >= p64.props.largerCircleFraction
	if v66 ~= v67 then
		p64:playAnimation(v_u_21, not v67)
	end
	local v68 = p65.fillFraction >= p65.popCircleFraction
	if p64.props.fillFraction >= p64.props.popCircleFraction and not v68 then
		p64:playAnimation(v_u_29, false)
	end
	local v69 = p65.fillFraction >= p65.shakeCircleFraction
	if p64.props.fillFraction >= p64.props.shakeCircleFraction and not v69 then
		p64:playAnimation(v_u_45, false)
	end
end
function v12.playAnimation(p_u_70, p71, p72) -- name: playAnimation
	-- upvalues: (copy) v_u_1
	if p_u_70.animationFunction then
		p_u_70.animationFunction(100, p_u_70.updateBindings, p_u_70.reverseAnimation, function() end)
	end
	p_u_70.animationStartTime = tick()
	p_u_70.animationFunction = p71
	p_u_70.reverseAnimation = p72
	if not p_u_70.renderSteppedConnection then
		p_u_70.renderSteppedConnection = v_u_1.RenderStepped:Connect(function()
			-- upvalues: (copy) p_u_70
			p_u_70.animationFunction(tick() - p_u_70.animationStartTime, p_u_70.updateBindings, p_u_70.reverseAnimation, function()
				-- upvalues: (ref) p_u_70
				p_u_70:stopAnimation()
			end)
		end)
	end
end
function v12.stopAnimation(p73) -- name: stopAnimation
	if p73.renderSteppedConnection then
		p73.renderSteppedConnection:Disconnect()
		p73.renderSteppedConnection = nil
	end
end
function v12.willUnmount(p74) -- name: willUnmount
	p74:stopAnimation()
end
return v12