-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.InExperienceShop.ShopWindowLayout
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = require(v1.Service)
local v_u_5 = require(v1.ChromeShared.Service.ViewportUtil)
local v_u_6 = require(v1.ChromeShared.Unibar.Constants)
local v_u_7 = require(v2.Workspace.Packages.InExperienceShop).FFlagCenterInExperienceShopWindow
local v_u_8 = false
local function v_u_18() -- name: getCenteredShopWindowPosition
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	local v9 = v_u_5.screenSize:get()
	local v10 = v_u_3.TopbarInset.Max.Y
	local v11 = v9.Y - v10
	local v12 = v9.X < 844 and true or v11 < 754
	local v13
	if v12 then
		v13 = v9.X
	else
		local v14 = v9.X
		v13 = math.min(844, v14)
	end
	local v15
	if v12 then
		v15 = v11
	else
		v15 = math.min(754, v11)
	end
	local v16 = (v9.X - v13) / 2
	local v17 = v10 + (v11 - v15) / 2
	return UDim2.fromOffset(v16, v17)
end
return {
	["MAX_WINDOW_WIDTH"] = 844,
	["MAX_WINDOW_HEIGHT"] = 754,
	["getCenteredShopWindowPosition"] = nil,
	["getStartingWindowPosition"] = nil,
	["toggleInExperienceShopWindow"] = nil,
	["getCenteredShopWindowPosition"] = v_u_18,
	["getStartingWindowPosition"] = function() -- name: getStartingWindowPosition
		-- upvalues: (copy) v_u_7, (copy) v_u_18
		if v_u_7 then
			return v_u_18()
		else
			return nil
		end
	end,
	["toggleInExperienceShopWindow"] = function() -- name: toggleInExperienceShopWindow
		-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (ref) v_u_8, (copy) v_u_18
		if not v_u_4:isWindowOpen(v_u_6.IN_EXPERIENCE_SHOP_ID) and (v_u_7 and not v_u_8) then
			v_u_4:updateWindowPosition(v_u_6.IN_EXPERIENCE_SHOP_ID, v_u_18())
			v_u_8 = true
		end
		v_u_4:toggleWindow(v_u_6.IN_EXPERIENCE_SHOP_ID)
	end
}