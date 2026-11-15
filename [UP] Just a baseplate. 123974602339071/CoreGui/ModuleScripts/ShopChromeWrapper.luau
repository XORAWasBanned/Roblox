-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.InExperienceShop.ShopChromeWrapper
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = require(v2.Packages.React)
local v_u_5 = require(v2.Packages.ReactUtils).useEventConnection
local v_u_6 = require(v1.Service)
local v_u_7 = require(v1.ChromeShared.Service.ViewportUtil)
require(v1.ChromeShared.Service.WindowSizeSignal)
local v_u_8 = require(v1.ChromeShared.Unibar.Constants)
local v_u_9 = require(v2.Workspace.Packages.InExperienceShop).ShopContainer
return function(p_u_10) -- name: ShopChromeWrapper
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9
	local v_u_11 = p_u_10.windowSize
	local v12, v_u_13 = v_u_4.useState(false)
	local v_u_23 = v_u_4.useCallback(function(p14)
		-- upvalues: (ref) v_u_3, (copy) p_u_10, (copy) v_u_11, (copy) v_u_13
		local v15 = v_u_3.TopbarInset.Max.Y
		local v16 = p14.X < p_u_10.maxWindowWidth and true or p14.Y - v15 < p_u_10.maxWindowHeight
		if v16 then
			v_u_11:requestSize(p14.X, p14.Y - v15)
		else
			local v17 = v_u_11
			local v18 = p_u_10.maxWindowWidth
			local v19 = p14.X
			local v20 = math.min(v18, v19)
			local v21 = p_u_10.maxWindowHeight
			local v22 = p14.Y - v15
			v17:requestSize(v20, (math.min(v21, v22)))
		end
		v_u_13(v16)
	end, { v_u_11, p_u_10.maxWindowWidth, p_u_10.maxWindowHeight })
	v_u_5(v_u_3:GetPropertyChangedSignal("TopbarInset"), function()
		-- upvalues: (copy) v_u_23, (ref) v_u_7
		v_u_23(v_u_7.screenSize:get())
	end)
	v_u_4.useEffect(function()
		-- upvalues: (ref) v_u_7, (copy) v_u_23
		local v_u_24 = v_u_7.screenSize:connect(v_u_23)
		v_u_23(v_u_7.screenSize:get())
		return function()
			-- upvalues: (copy) v_u_24
			v_u_24:disconnect()
		end
	end, { v_u_23 })
	local v25 = {
		["fullScreen"] = v12,
		["toggleWindow"] = v_u_4.useCallback(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_8
			v_u_6:toggleWindow(v_u_8.IN_EXPERIENCE_SHOP_ID)
		end, {})
	}
	return v_u_4.createElement(v_u_9, v25)
end