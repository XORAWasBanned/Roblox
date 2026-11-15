-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.BadgeOver12
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.SignalsReact)
local v_u_4 = require(v1.Workspace.Packages.Style).AppFonts
local v_u_5 = require(v1.Packages.UIBlox).Core.Style.useStyle
local v6 = require(v1.Workspace.Packages.DataHydration)
local v_u_7 = v6.Game.getAgeRecommendationStore
local v_u_8 = v6.DataHydrationTypes.DataStatus
local v_u_9 = require(v1.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating
local v_u_10 = require(v1.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
return function(p11)
	-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_10, (copy) v_u_2, (copy) v_u_7, (copy) v_u_8, (copy) v_u_3, (copy) v_u_4
	local v12 = v_u_5()
	local v13
	if v_u_9 then
		if v_u_10 then
			v13 = UDim2.fromOffset(-6, -2)
		else
			v13 = UDim2.fromOffset(0, 2)
		end
	else
		v13 = p11.position
	end
	local v14
	if v_u_9 then
		local v15 = game.GameId
		local v_u_16 = tostring(v15)
		local v21 = v_u_2.useCallback(function(p17)
			-- upvalues: (ref) v_u_7, (copy) v_u_16, (ref) v_u_8
			local v18 = v_u_7(p17).getAndFetchAgeRecommendation(v_u_16)
			local v19 = v18.status(p17)
			if v19 == v_u_8.Failed then
				return "12+"
			end
			if v19 == v_u_8.NotReady then
				return nil
			end
			local v20 = v18.data(p17)
			if v20 then
				v20 = v20.minimumAgeDisplay
			end
			return v20 or "12+"
		end, { v_u_16 })
		v14 = v_u_3.useSignalState(v21)
		if v14 == nil then
			return nil
		end
	else
		v14 = nil
	end
	local v22 = v_u_2.createElement
	local v23 = "TextLabel"
	local v24 = {
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Text"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0,
		["AutomaticSize"] = nil,
		["LineHeight"] = 1.25,
		["ZIndex"] = 2
	}
	local v25
	if v_u_9 then
		v25 = Vector2.new(0.5, 0)
	else
		v25 = Vector2.new(0, 1)
	end
	v24.AnchorPoint = v25
	v24.Position = v13
	v24.Text = v14 or "12+"
	local v26
	if v_u_9 then
		v26 = v_u_4.default:getBold()
	else
		v26 = v_u_4.default:getMedium()
	end
	v24.Font = v26
	v24.TextSize = v_u_9 and 12 or 9
	v24.TextColor3 = v12.Theme.TextEmphasis.Color
	v24.BackgroundColor3 = v12.Theme.BackgroundUIContrast.Color
	v24.AutomaticSize = Enum.AutomaticSize.XY
	local v27 = {}
	local v28 = v_u_2.createElement
	local v29 = "UIPadding"
	local v30 = {}
	local v31
	if v_u_9 then
		v31 = UDim.new(0, 2)
	else
		v31 = nil
	end
	v30.PaddingTop = v31
	local v32
	if v_u_9 then
		v32 = UDim.new(0, 2)
	else
		v32 = nil
	end
	v30.PaddingBottom = v32
	local v33
	if v_u_9 then
		v33 = UDim.new(0, 6)
	else
		v33 = UDim.new(0, 2)
	end
	v30.PaddingLeft = v33
	local v34
	if v_u_9 then
		v34 = UDim.new(0, 6)
	else
		v34 = UDim.new(0, 2)
	end
	v30.PaddingRight = v34
	v27.Padding = v28(v29, v30)
	v27.Shape = v_u_2.createElement("UICorner", {
		["CornerRadius"] = UDim.new(0, 8)
	})
	return v22(v23, v24, v27)
end