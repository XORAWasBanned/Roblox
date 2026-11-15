-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.DetailsDescription
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v1.Workspace.Packages.Style).AppFonts
local v6 = script.Parent.Parent
local v_u_7 = require(v6.Colors)
local v_u_8 = require(v6.UtilityFunctions)
local v9 = v_u_3.PureComponent:extend("DetailsDescription")
function v9.setText(p10) -- name: setText
	-- upvalues: (copy) v_u_8
	local v11 = p10.props.assetInfo or {}
	local v12 = v11.parentBundleId ~= nil
	local v13 = p10.props.bundleInfo or {}
	if v12 then
		local v14 = v_u_8.getBundleId(v11)
		if v13[v14] then
			p10.description = v13[v14].description or ""
			return
		end
	elseif v11 then
		p10.description = v11.description or ""
	end
end
function v9.init(p15) -- name: init
	-- upvalues: (copy) v_u_3
	p15.description = ""
	p15.descriptionRef = v_u_3.createRef()
end
function v9.render(p16) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_7
	p16:setText()
	local v17 = p16:calculateSize()
	return v_u_3.createElement("TextLabel", {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 4,
		["Size"] = UDim2.new(1, -20, 0, v17),
		["Text"] = p16.description or "",
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextYAlignment"] = Enum.TextYAlignment.Top,
		["TextSize"] = 16,
		["TextWrapped"] = true,
		["Font"] = v_u_5.default:getDefault(),
		["TextColor3"] = v_u_7.White,
		[v_u_3.Ref] = p16.descriptionRef
	})
end
function v9.calculateSize(p18) -- name: calculateSize
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	if p18.descriptionRef.current and p18.props.assetInfo then
		return v_u_2:GetTextSize(p18.description, 16, v_u_5.default:getDefault(), Vector2.new(p18.descriptionRef.current.AbsoluteSize.X, 5000)).Y
	end
end
return v4.UNSTABLE_connect2(function(p19, _)
	local v20 = p19.detailsInformation.assetId
	return {
		["view"] = p19.view,
		["assetInfo"] = p19.assets[v20],
		["detailsInformation"] = p19.detailsInformation,
		["bundleInfo"] = p19.bundles
	}
end)(v9)