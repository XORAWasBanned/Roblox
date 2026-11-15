-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.PageContainer
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.RoactRodux
local v_u_6 = v3.Otter
local v7 = v3.t
local v8 = script.Parent.Parent
local v_u_9 = require(script.Parent.BlurredModalPortal)
local v_u_10 = require(script.Parent.Pages)
local v_u_11 = require(script.Parent.Parent.Resources.Constants)
local v_u_12 = {}
for v13, v14 in pairs(v_u_10.pagesByKey) do
	v_u_12[v13] = require(v14.component)
end
local v_u_15 = require(v8.Localization.withLocalization)
local v16 = v_u_4.PureComponent:extend("PageContainer")
v16.validateProps = v7.strictInterface({
	["currentPage"] = v7.string,
	["visible"] = v7.boolean,
	["controllerBarHeight"] = v7.number,
	["controllerBarCount"] = v7.number
})
function v16.init(p_u_17, p18) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_10, (copy) v_u_4, (copy) v_u_6
	function p_u_17.onContainerRendered(p19, p20)
		-- upvalues: (copy) p_u_17, (ref) v_u_2
		if p19 then
			local v21 = p_u_17.getSelectionParentNameFromKey(p20)
			v_u_2:RemoveSelectionGroup(v21)
			v_u_2:AddSelectionParent(v21, p19)
		end
	end
	function p_u_17.getSelectionParentNameFromKey(p22)
		return p22 .. "_IGMPageSelectionGroup"
	end
	p_u_17.pagePositions = {}
	p_u_17.pageVisibilities = {}
	local v23 = {}
	local v_u_24 = {}
	local v25 = {}
	for v26, _ in pairs(v_u_10.pagesByKey) do
		local v27 = p18.currentPage == v26 and 1 or 0
		local v28, v29 = v_u_4.createBinding(v27)
		v23[v26] = v28
		v_u_24[v26] = v29
		v25[v26] = v27
		p_u_17.pagePositions[v26] = v23[v26]:map(function(p30)
			return UDim2.new(p30 - 1, 0, 0, 0)
		end)
		p_u_17.pageVisibilities[v26] = v23[v26]:map(function(p31)
			return p31 ~= 0 and p31 ~= 1.25
		end)
	end
	p_u_17.pageMotor = v_u_6.createGroupMotor(v25)
	p_u_17.pageMotor:onStep(function(p32)
		-- upvalues: (copy) v_u_24
		for v33, v34 in pairs(p32) do
			v_u_24[v33](v34)
		end
	end)
end
function v16.render(p_u_35) -- name: render
	-- upvalues: (copy) v_u_10, (copy) v_u_15, (copy) v_u_4, (copy) v_u_12, (copy) v_u_9, (copy) v_u_11
	local v36 = {}
	for v_u_37, v_u_38 in pairs(v_u_10.pagesByKey) do
		local v_u_39 = p_u_35.pageVisibilities[v_u_37]
		v36[v_u_37] = v_u_15({
			["title"] = v_u_38.title
		})(function(p40)
			-- upvalues: (copy) v_u_38, (ref) v_u_4, (copy) p_u_35, (copy) v_u_37, (copy) v_u_39, (ref) v_u_12, (ref) v_u_9
			if v_u_38.isModal then
				return v_u_4.createElement(v_u_9, {
					["Enabled"] = p_u_35.props.currentPage == v_u_37
				}, {
					["ModalPageContent"] = v_u_4.createElement(v_u_12[v_u_37], {
						["pageTitle"] = p40.title
					})
				})
			end
			local v41 = v_u_4.createElement
			local v42 = "Frame"
			local v44 = {
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = p_u_35.pagePositions[v_u_37],
				["BackgroundTransparency"] = 1,
				["ZIndex"] = v_u_38.navigationDepth,
				["Visible"] = v_u_39,
				[v_u_4.Ref] = function(p43)
					-- upvalues: (ref) p_u_35, (ref) v_u_37
					p_u_35.onContainerRendered(p43, v_u_37)
				end
			}
			local v45 = {}
			local v46 = v_u_4.createElement
			local v47 = v_u_12[v_u_37]
			local v48 = {}
			local v49 = v_u_38.title
			if v49 then
				v49 = p40.title
			end
			v48.pageTitle = v49
			v45.Page = v46(v47, v48)
			return v41(v42, v44, v45)
		end)
	end
	local v50 = p_u_35.props.controllerBarCount > 0 and -1 * v_u_11.ControllerBarHeight or nil
	return v_u_4.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Visible"] = nil,
		["ClipsDescendants"] = true,
		["Size"] = UDim2.new(0, 400, 1, v50),
		["Position"] = UDim2.new(0, 64, 0, 0),
		["Visible"] = p_u_35.props.visible
	}, v36)
end
function v16.didUpdate(p51, p52, _) -- name: didUpdate
	-- upvalues: (copy) v_u_10, (copy) v_u_6
	local v53 = p52.currentPage
	local v54 = p51.props.currentPage
	if v53 ~= v54 then
		local v55 = v_u_10.pagesByKey[v54].isModal
		if v55 or v_u_10.pagesByKey[v53].isModal then
			return
		end
		if v_u_10.pagesByKey[v53].navigationDepth < v_u_10.pagesByKey[v54].navigationDepth then
			if not v55 then
				p51.pageMotor:setGoal({
					[v53] = v_u_6.spring(1.25, {
						["frequency"] = 2.5
					})
				})
			end
		elseif v_u_10.pagesByKey[v53].navigationDepth == v_u_10.pagesByKey[v54].navigationDepth then
			p51.pageMotor:setGoal({
				[v53] = v_u_6.spring(0, {
					["frequency"] = 2.5
				})
			})
		else
			local v56 = {}
			while v53 ~= nil and v53 ~= v54 do
				v56[v53] = v_u_6.spring(0, {
					["frequency"] = 3.5
				})
				v53 = v_u_10.pagesByKey[v53].parentPage
			end
			p51.pageMotor:setGoal(v56)
		end
		p51.pageMotor:setGoal({
			[v54] = v_u_6.spring(1, {
				["frequency"] = 2.5
			})
		})
	end
end
function v16.willUnmount(p57) -- name: willUnmount
	-- upvalues: (copy) v_u_10, (copy) v_u_2
	for v58, v59 in pairs(v_u_10.pagesByKey) do
		if v59.isModal then
			continue
		end
		v_u_2:RemoveSelectionGroup((p57.getSelectionParentNameFromKey(v58)))
	end
end
return v5.UNSTABLE_connect2(function(p60)
	return {
		["currentPage"] = p60.menuPage,
		["visible"] = p60.isMenuOpen,
		["controllerBarHeight"] = p60.controllerBarHeight,
		["controllerBarCount"] = p60.controllerBarCount
	}
end)(v16)