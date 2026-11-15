-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.HurtOverlay
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("StarterGui")
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v6 = require(v1.Packages.t)
local v_u_7 = require(v1.Packages.Signals)
local v_u_8 = require(v1.Packages.Otter)
local v9 = v2:WaitForChild("RobloxGui")
local v_u_10 = require(v1.Workspace.Packages.CachedPolicyService)
v9:FindFirstChild("Modules"):FindFirstChild("Common")
local v11 = script.Parent.Parent.Parent
local v_u_12 = require(v11.Constants)
local v_u_13 = require(v1.Workspace.Packages.CoreGuiCommon)
local v_u_14 = v_u_13.Flags.FFlagTopBarSignalizeHealthBar
local v_u_15 = v_u_13.Flags.FFlagUseNewHurtOverlayImage
local v_u_16 = v_u_13.Flags.FFlagUseNewHurtOverlayAnimation
local v_u_17 = {
	["frequency"] = 0.75,
	["dampingRatio"] = 1
}
local v_u_18 = Color3.fromRGB(187, 0, 4)
local v_u_19 = Color3.new(1, 1, 1)
local v20 = v_u_4.PureComponent:extend("HurtOverlay")
v20.validateProps = v6.strictInterface(v_u_14 and {} or {
	["healthEnabled"] = v6.boolean,
	["health"] = v6.number,
	["maxHealth"] = v6.number,
	["isDead"] = v6.boolean
})
function v20.init(p_u_21) -- name: init
	-- upvalues: (copy) v_u_4, (copy) v_u_16, (copy) v_u_14, (copy) v_u_12, (copy) v_u_8, (copy) v_u_17, (copy) v_u_13, (copy) v_u_7, (copy) v_u_3
	local v22, v23 = v_u_4.createBinding(0)
	p_u_21.animationBinding = v22
	p_u_21.animationBindingUpdate = v23
	if not v_u_16 then
		p_u_21.positionBinding = p_u_21.animationBinding:map(function(p24)
			return UDim2.new(-10 * p24, 0, -10 * p24, 0)
		end)
		p_u_21.sizeBinding = p_u_21.animationBinding:map(function(p25)
			return UDim2.new(1 + 19 * p25, 0, 1 + 19 * p25, 0)
		end)
	end
	if v_u_14 then
		local v26, v27 = v_u_4.createBinding(false)
		p_u_21.isAnimating = v26
		p_u_21.setIsAnimating = v27
		local v28, v29 = v_u_4.createBinding(v_u_12.InitialHealth)
		p_u_21.health = v28
		p_u_21.setHealth = v29
		local v30, v31 = v_u_4.createBinding(v_u_12.InitialHealth)
		p_u_21.maxHealth = v30
		p_u_21.setMaxHealth = v31
		local v32, v33 = v_u_4.createBinding(false)
		p_u_21.isDead = v32
		p_u_21.setIsDead = v33
		p_u_21.prevHealth = p_u_21.health:getValue()
		p_u_21.prevIsDead = p_u_21.isDead:getValue()
		p_u_21.showHurtOverlay = v_u_4.joinBindings({
			p_u_21.isAnimating,
			p_u_21.health,
			p_u_21.maxHealth,
			p_u_21.isDead
		}):map(function(p34)
			-- upvalues: (copy) p_u_21, (ref) v_u_12, (ref) v_u_16, (ref) v_u_8, (ref) v_u_17
			local v35 = p34[1]
			local v36 = p34[2]
			local v37 = p34[3]
			local v38 = p34[4]
			local v39 = p_u_21.prevHealth
			local v40 = p_u_21.prevIsDead
			p_u_21.prevHealth = v36
			p_u_21.prevIsDead = v38
			if v36 >= v39 or v38 and v40 or (v39 - v36) / v37 < v_u_12.HealthPercentForOverlay then
				return v35
			end
			if v_u_16 then
				p_u_21.setIsAnimating(true)
				p_u_21.motor:setGoal(v_u_8.ease(0, {
					["duration"] = 0.1
				}))
				p_u_21.motor:start()
			else
				p_u_21.motor:setGoal(v_u_8.instant(0))
				p_u_21.motor:step(0)
				p_u_21.motor:setGoal(v_u_8.spring(1, v_u_17))
				p_u_21.motor:start()
				p_u_21.setIsAnimating(true)
			end
			return true
		end)
		if v_u_13.Stores.GetLocalHumanoidStore then
			p_u_21.localHumanoidStore = v_u_13.Stores.GetLocalHumanoidStore(false)
			p_u_21.disposeHealthConnection = v_u_7.createEffect(function(p41)
				-- upvalues: (copy) p_u_21, (ref) v_u_12
				local v42 = p_u_21.localHumanoidStore.getHealthValue(p41)
				p_u_21.setHealth(v42.health or v_u_12.InitialHealth)
				p_u_21.setMaxHealth(v42.maxHealth or v_u_12.InitialHealth)
				p_u_21.setIsDead(v42.isDead)
			end)
		end
	else
		p_u_21.state = {
			["isAnimating"] = false
		}
	end
	p_u_21.motor = v_u_8.createSingleMotor(v_u_16 and 1 or 0)
	p_u_21.motor:onStep(function(p43)
		-- upvalues: (copy) p_u_21
		p_u_21.animationBindingUpdate(p43)
	end)
	local v44 = p_u_21.motor
	local v45
	if v_u_16 then
		v45 = function(p46)
			-- upvalues: (copy) p_u_21, (ref) v_u_8, (ref) v_u_14
			if p46 == 0 then
				p_u_21.motor:setGoal(v_u_8.ease(1, {
					["duration"] = 0.5
				}))
				p_u_21.motor:start()
			elseif p46 == 1 then
				if v_u_14 then
					p_u_21.setIsAnimating(false)
					return
				end
				p_u_21:setState({
					["isAnimating"] = false
				})
			end
		end
	else
		v45 = function()
			-- upvalues: (ref) v_u_14, (copy) p_u_21
			if v_u_14 then
				p_u_21.setIsAnimating(false)
			else
				p_u_21:setState({
					["isAnimating"] = false
				})
			end
		end
	end
	v44:onComplete(v45)
	if v_u_14 then
		p_u_21.coreGuiChangedSignalConn = v_u_3.CoreGuiChangedSignal:Connect(function(p47, p48)
			-- upvalues: (copy) p_u_21
			if p47 == Enum.CoreGuiType.Health or p47 == Enum.CoreGuiType.All then
				p_u_21:setState({
					["mountHurtOverlay"] = p48
				})
			end
		end)
		p_u_21:setState({
			["mountHurtOverlay"] = v_u_3:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		})
	end
end
function v20.renderOverlay(p49) -- name: renderOverlay
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_18, (copy) v_u_10, (copy) v_u_19, (copy) v_u_4, (copy) v_u_16
	local v50
	if v_u_14 then
		v50 = nil
	else
		v50 = p49.props.healthEnabled
		if v50 then
			v50 = p49.state.isAnimating
		end
	end
	local v51 = v_u_15 and "rbxasset://textures/ui/TopBar/HurtOverlayAsset.png" or "rbxasset://textures/ui/TopBar/WhiteOverlayAsset.png"
	local v52 = v_u_18
	if v_u_10:IsSubjectToChinaPolicies() then
		v52 = v_u_19
	end
	local v53 = v_u_4.createElement
	local v54 = "ImageLabel"
	local v55 = {
		["Visible"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ImageColor3"] = nil,
		["ImageTransparency"] = nil,
		["Size"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil
	}
	if v_u_14 then
		v50 = p49.showHurtOverlay
	end
	v55.Visible = v50
	v55.Image = v51
	v55.ImageColor3 = v52
	local v56
	if v_u_16 then
		v56 = p49.animationBinding
	else
		v56 = nil
	end
	v55.ImageTransparency = v56
	local v57
	if v_u_16 then
		v57 = UDim2.fromScale(1, 1)
	else
		v57 = p49.sizeBinding
	end
	v55.Size = v57
	local v58
	if v_u_16 then
		v58 = Vector2.new(0.5, 0.5)
	else
		v58 = nil
	end
	v55.AnchorPoint = v58
	local v59
	if v_u_16 then
		v59 = UDim2.fromScale(0.5, 0.5)
	else
		v59 = p49.positionBinding
	end
	v55.Position = v59
	return v53(v54, v55)
end
function v20.render(p60) -- name: render
	-- upvalues: (copy) v_u_14
	if v_u_14 then
		if p60.state.mountHurtOverlay then
			return p60:renderOverlay()
		else
			return nil
		end
	else
		return p60:renderOverlay()
	end
end
function v20.didUpdate(p61, p62, _) -- name: didUpdate
	-- upvalues: (copy) v_u_14, (copy) v_u_12, (copy) v_u_8, (copy) v_u_17
	if not v_u_14 then
		if p61.props.health < p62.health and not (p61.props.isDead and p62.isDead) and (p62.health - p61.props.health) / p61.props.maxHealth >= v_u_12.HealthPercentForOverlay then
			p61.motor:setGoal(v_u_8.instant(0))
			p61.motor:step(0)
			p61.motor:setGoal(v_u_8.spring(1, v_u_17))
			p61.motor:start()
			p61:setState({
				["isAnimating"] = true
			})
		end
	end
end
if v_u_14 then
	function v20.onUnmount(p63) -- name: onUnmount
		p63.coreGuiChangedSignalConn:Disconnect()
		p63.disposeHealthConnection()
	end
end
local function v65(p64) -- name: mapStateToProps
	return {
		["health"] = p64.health.currentHealth,
		["maxHealth"] = p64.health.maxHealth,
		["isDead"] = p64.health.isDead,
		["healthEnabled"] = p64.coreGuiEnabled[Enum.CoreGuiType.Health]
	}
end
if v_u_14 then
	return v20
else
	return v5.UNSTABLE_connect2(v65, nil)(v20)
end