-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.HealthBar
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("StarterGui")
local v4 = v2:WaitForChild("RobloxGui")
game:GetService("Workspace")
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.RoactRodux)
local v7 = require(v1.Packages.t)
local v_u_8 = require(v1.Packages.Signals)
local v_u_9 = require(v1.Workspace.Packages.Display)
local v10 = script.Parent.Parent.Parent
local v_u_11 = require(v10.Constants)
local v_u_12 = require(v1.Workspace.Packages.CoreGuiCommon)
local v_u_13 = require(v4.Modules.TenFootInterface)
local v_u_14 = require(v10.Actions.SetKeepOutArea)
local v_u_15 = require(v10.Actions.RemoveKeepOutArea)
require(v1.Workspace.Packages.SharedFlags)
local v_u_16 = v_u_12.Flags.FFlagTopBarSignalizeHealthBar
local v_u_17 = v_u_12.Flags.FFlagTopBarSignalizeKeepOutAreas
local v_u_18 = v_u_12.Flags.FFlagTopBarSignalizeScreenSize
local v19 = v10.Parent.Chrome
local v_u_20 = require(v1.Workspace.Packages.Chrome).Enabled
if v_u_20() then
	require(v19.Service)
end
local v_u_21 = v_u_20()
local v_u_22 = UDim2.new(0, 80, 0, 6)
if v_u_21 then
	v_u_22 = UDim2.new(0, 125, 0, 20)
end
local v_u_23 = UDim2.new(0, 50, 0, 16)
local v_u_24 = UDim2.new(0, 80, 0, 20)
local v_u_25 = UDim2.new(0, 220, 0, 16)
local v26 = v_u_5.PureComponent:extend("HealthBar")
local v27 = v7.strictInterface
local v28 = {
	["layoutOrder"] = v7.optional(v7.integer)
}
local v29
if v_u_18 then
	v29 = nil
else
	v29 = v7.Vector2
end
v28.screenSize = v29
local v30
if v_u_16 then
	v30 = nil
else
	v30 = v7.boolean
end
v28.healthEnabled = v30
local v31
if v_u_16 then
	v31 = nil
else
	v31 = v7.number
end
v28.health = v31
local v32
if v_u_16 then
	v32 = nil
else
	v32 = v7.number
end
v28.maxHealth = v32
local v33
if v_u_17 then
	v33 = nil
else
	v33 = v7.callback
end
v28.setKeepOutArea = v33
local v34
if v_u_17 then
	v34 = nil
else
	v34 = v7.callback
end
v28.removeKeepOutArea = v34
v26.validateProps = v27(v28)
local v_u_35 = {}
local v36 = v_u_11.HealthRedColor
local v37 = v36.r
local v38 = v36.g
local v39 = v36.b
v_u_35[Vector3.new(v37, v38, v39)] = 0.1
local v40 = v_u_11.HealthYellowColor
local v41 = v40.r
local v42 = v40.g
local v43 = v40.b
v_u_35[Vector3.new(v41, v42, v43)] = 0.5
local v44 = v_u_11.HealthGreenColor
local v45 = v44.r
local v46 = v44.g
local v47 = v44.b
v_u_35[Vector3.new(v45, v46, v47)] = 0.8
local v_u_48 = v_u_11.HealthRedColor
local v_u_49 = v_u_11.HealthGreenColor
local function v_u_58(p50) -- name: getHealthBarColor
	-- upvalues: (copy) v_u_48, (copy) v_u_49, (copy) v_u_35
	if p50 <= 0.1 then
		return v_u_48
	end
	if p50 >= 0.8 then
		return v_u_49
	end
	local v51 = Vector3.new(0, 0, 0)
	local v52 = 0
	for v53, v54 in pairs(v_u_35) do
		local v55 = p50 - v54
		if v55 == 0 then
			return Color3.new(v53.x, v53.y, v53.z)
		end
		local v56 = 1 / (v55 * v55)
		v51 = v51 + v56 * v53
		v52 = v52 + v56
	end
	local v57 = v51 / v52
	return Color3.new(v57.x, v57.y, v57.z)
end
function v26.init(p_u_59) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_16, (copy) v_u_11, (copy) v_u_12, (copy) v_u_8, (copy) v_u_3, (copy) v_u_17, (copy) v_u_18, (copy) v_u_9, (copy) v_u_13, (copy) v_u_25, (copy) v_u_21, (copy) v_u_23, (copy) v_u_24, (ref) v_u_22
	p_u_59.rootRef = v_u_5.createRef()
	if v_u_16 then
		local v60, v61 = v_u_5.createBinding(v_u_11.InitialHealth)
		p_u_59.health = v60
		p_u_59.setHealth = v61
		local v62, v63 = v_u_5.createBinding(v_u_11.InitialHealth)
		p_u_59.maxHealth = v62
		p_u_59.setMaxHealth = v63
		local v64, v65 = v_u_5.createBinding(false)
		p_u_59.isDead = v64
		p_u_59.setIsDead = v65
		p_u_59.healthPercent = v_u_5.joinBindings({ p_u_59.health, p_u_59.maxHealth, p_u_59.isDead }):map(function(p66)
			local v67 = p66[1]
			local v68 = p66[2]
			local v69 = 1
			if p66[3] then
				return 0
			end
			if v68 > 0 then
				local v70 = v67 / v68
				v69 = math.clamp(v70, 0, 1)
			end
			return v69
		end)
		p_u_59.healthVisible = v_u_5.joinBindings({ p_u_59.health, p_u_59.maxHealth }):map(function(p71)
			return p71[1] < p71[2]
		end)
		if v_u_12.Stores.GetLocalHumanoidStore then
			p_u_59.localHumanoidStore = v_u_12.Stores.GetLocalHumanoidStore(false)
			p_u_59.disposeHealthConnection = v_u_8.createEffect(function(p72)
				-- upvalues: (copy) p_u_59, (ref) v_u_11
				local v73 = p_u_59.localHumanoidStore.getHealthValue(p72)
				p_u_59.setHealth(v73.health or v_u_11.InitialHealth)
				p_u_59.setMaxHealth(v73.maxHealth or v_u_11.InitialHealth)
				p_u_59.setIsDead(v73.isDead)
			end)
		end
		p_u_59.coreGuiChangedSignalConn = v_u_3.CoreGuiChangedSignal:Connect(function(p74, p75)
			-- upvalues: (copy) p_u_59
			if p74 == Enum.CoreGuiType.Health or p74 == Enum.CoreGuiType.All then
				p_u_59:setState({
					["mountHealthBar"] = p75
				})
			end
		end)
		p_u_59:setState({
			["mountHealthBar"] = v_u_3:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		})
	end
	if v_u_17 then
		p_u_59.keepOutAreasStore = v_u_12.Stores.GetKeepOutAreasStore(false)
	end
	if v_u_18 then
		local v_u_76 = v_u_9.GetDisplayStore(false).getViewportSize
		local v77, v78 = v_u_5.createBinding(v_u_76(false))
		p_u_59.screenSizeBinding = v77
		p_u_59.setScreenSizeBinding = v78
		p_u_59.disposeScreenSize = v_u_8.createEffect(function(p79)
			-- upvalues: (copy) p_u_59, (copy) v_u_76
			p_u_59.setScreenSizeBinding(v_u_76(p79))
		end)
		p_u_59.healthbarSizeBinding = p_u_59.screenSizeBinding:map(function(p80)
			-- upvalues: (ref) v_u_13, (ref) v_u_25, (ref) v_u_21, (ref) v_u_23, (ref) v_u_24, (ref) v_u_22
			if v_u_13:IsEnabled() then
				return v_u_25
			elseif v_u_21 and p80.X <= 320 then
				return v_u_23
			elseif v_u_21 and p80.X <= 393 then
				return v_u_24
			else
				return v_u_22
			end
		end)
	end
end
function v26.onUnmount(p81) -- name: onUnmount
	-- upvalues: (copy) v_u_16, (copy) v_u_18
	if v_u_16 then
		p81.coreGuiChangedSignalConn:Disconnect()
		p81.disposeHealthConnection()
	end
	if v_u_18 then
		p81.disposeScreenSize()
	end
end
function v26.renderHealth(p_u_82) -- name: renderHealth
	-- upvalues: (copy) v_u_16, (copy) v_u_18, (copy) v_u_21, (copy) v_u_23, (copy) v_u_24, (ref) v_u_22, (copy) v_u_13, (copy) v_u_25, (copy) v_u_17, (copy) v_u_11, (copy) v_u_58, (copy) v_u_5, (copy) v_u_20
	local v_u_83
	if v_u_16 then
		v_u_83 = nil
	else
		v_u_83 = p_u_82.props.healthEnabled
		if v_u_83 then
			v_u_83 = p_u_82.props.health < p_u_82.props.maxHealth
		end
	end
	local v84 = 1
	if not v_u_16 then
		if p_u_82.props.isDead then
			v84 = 0
		elseif p_u_82.props.maxHealth > 0 then
			local v85 = p_u_82.props.health / p_u_82.props.maxHealth
			v84 = math.clamp(v85, 0, 1)
		end
	end
	local v86
	if v_u_18 then
		v86 = nil
	elseif v_u_21 then
		if p_u_82.props.screenSize.X <= 320 then
			v86 = v_u_23
		elseif p_u_82.props.screenSize.X <= 393 then
			v86 = v_u_24
		else
			v86 = v_u_22
		end
		if v_u_13:IsEnabled() then
			v86 = v_u_25
		end
	else
		v86 = v_u_22
		if v_u_13:IsEnabled() then
			v86 = v_u_25
		end
	end
	local v87 = v_u_13:IsEnabled() and 0 or 4
	local v88, v89, v90
	if v_u_21 then
		v88 = Rect.new(8, 8, 9, 9)
		v89 = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png"
		v90 = "rbxasset://textures/ui/TopBar/HealthBarTV.png"
	else
		v88 = Rect.new(3, 3, 4, 4)
		if v_u_13:IsEnabled() then
			v88 = Rect.new(8, 8, 9, 9)
			v89 = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png"
			v90 = "rbxasset://textures/ui/TopBar/HealthBarTV.png"
		else
			v89 = "rbxasset://textures/ui/TopBar/HealthBarBase.png"
			v90 = "rbxasset://textures/ui/TopBar/HealthBar.png"
		end
	end
	local function v92(p91)
		-- upvalues: (ref) v_u_21, (ref) v_u_16, (copy) p_u_82, (ref) v_u_83, (ref) v_u_17, (ref) v_u_11
		if not v_u_21 then
			if (v_u_16 and p_u_82.healthVisible or not v_u_16 and v_u_83) and p91 then
				if v_u_17 then
					p_u_82.keepOutAreasStore.setKeepOutArea(v_u_11.HealthBarKeepOutAreaId, p91.AbsolutePosition, p91.AbsoluteSize)
				else
					p_u_82.props.setKeepOutArea(v_u_11.HealthBarKeepOutAreaId, p91.AbsolutePosition, p91.AbsoluteSize)
				end
			end
			if v_u_17 then
				p_u_82.keepOutAreasStore.removeKeepOutArea(v_u_11.HealthBarKeepOutAreaId)
				return
			end
			p_u_82.props.removeKeepOutArea(v_u_11.HealthBarKeepOutAreaId)
		end
	end
	if p_u_82.rootRef.current then
		v92(p_u_82.rootRef.current)
	end
	local v93
	if v_u_16 then
		v93 = p_u_82.healthPercent:map(v_u_58)
	else
		v93 = v_u_58(v84)
	end
	local v94 = v_u_5.createElement
	local v95 = "Frame"
	local v96 = {}
	local v97
	if v_u_21 then
		v97 = Vector2.new(1, 0)
	else
		v97 = nil
	end
	v96.AnchorPoint = v97
	local v98
	if v_u_21 then
		v98 = UDim2.new(1, 0, 0, 0)
	else
		v98 = nil
	end
	v96.Position = v98
	if v_u_16 then
		v_u_83 = p_u_82.healthVisible
	end
	v96.Visible = v_u_83
	v96.BackgroundTransparency = 1
	local v99
	if v_u_18 then
		v99 = p_u_82.healthbarSizeBinding:map(function(p100)
			return UDim2.new(p100.X, UDim.new(1, 0))
		end)
	else
		v99 = UDim2.new(v86.X, UDim.new(1, 0))
	end
	v96.Size = v99
	v96.LayoutOrder = p_u_82.props.layoutOrder
	v96[v_u_5.Change.AbsoluteSize] = v92
	v96[v_u_5.Change.AbsolutePosition] = v92
	v96[v_u_5.Ref] = p_u_82.rootRef
	local v101 = {}
	local v102
	if v_u_20 then
		v102 = nil
	else
		v102 = v_u_5.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, v87)
		}) or nil
	end
	v101.Padding = v102
	local v103 = v_u_5.createElement
	local v104 = "ImageLabel"
	local v105 = {
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["Image"] = v89,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = v88
	}
	if v_u_18 then
		v86 = p_u_82.healthbarSizeBinding
	end
	v105.Size = v86
	v105.Position = UDim2.fromScale(0, 0.5)
	v105.AnchorPoint = Vector2.new(0, 0.5)
	local v106 = {}
	local v107 = v_u_5.createElement
	local v108 = "ImageLabel"
	local v109 = {
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ImageColor3"] = nil,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["Size"] = nil,
		["Image"] = v90,
		["ImageColor3"] = v93,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = v88
	}
	local v110
	if v_u_16 then
		v110 = p_u_82.healthPercent:map(function(p111)
			return UDim2.fromScale(p111, 1)
		end)
	else
		v110 = UDim2.fromScale(v84, 1)
	end
	v109.Size = v110
	v106.Fill = v107(v108, v109)
	v101.HealthBar = v103(v104, v105, v106)
	return v94(v95, v96, v101)
end
function v26.render(p112) -- name: render
	-- upvalues: (copy) v_u_16
	if v_u_16 then
		if p112.state.mountHealthBar then
			return p112:renderHealth()
		else
			return nil
		end
	else
		return p112:renderHealth()
	end
end
return v6.UNSTABLE_connect2(function(p113) -- name: mapStateToProps
	-- upvalues: (copy) v_u_18, (copy) v_u_16
	local v114 = {}
	local v115
	if v_u_18 then
		v115 = nil
	else
		v115 = p113.displayOptions.screenSize
	end
	v114.screenSize = v115
	local v116
	if v_u_16 then
		v116 = nil
	else
		v116 = p113.health.currentHealth
	end
	v114.health = v116
	local v117
	if v_u_16 then
		v117 = nil
	else
		v117 = p113.health.maxHealth
	end
	v114.maxHealth = v117
	local v118
	if v_u_16 then
		v118 = nil
	else
		v118 = p113.coreGuiEnabled[Enum.CoreGuiType.Health]
	end
	v114.healthEnabled = v118
	return v114
end, not v_u_17 and function(p_u_119) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_17, (copy) v_u_14, (copy) v_u_15
	return v_u_17 and {} or {
		["setKeepOutArea"] = function(p120, p121, p122) -- name: setKeepOutArea
			-- upvalues: (copy) p_u_119, (ref) v_u_14
			return p_u_119(v_u_14(p120, p121, p122))
		end,
		["removeKeepOutArea"] = function(p123) -- name: removeKeepOutArea
			-- upvalues: (copy) p_u_119, (ref) v_u_15
			return p_u_119(v_u_15(p123))
		end
	}
end or nil)(v26)