-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.AvatarSwitcher.AvatarSwitcherIcon
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v2.Packages.Foundation)
local v_u_5 = v_u_4.Hooks.useTokens
local v_u_6 = v_u_4.Enums.IconName
local v_u_7 = v_u_4.Enums.IconSize
local v_u_8 = v_u_4.Enums.IconVariant
require(v1.ChromeShared.Service.ChromeUtils)
local v_u_9 = require(v2.Workspace.Packages.Chrome).Hooks.useMappedSignal
local v_u_10 = require(v1.ChromeShared.Unibar.SubMenuContext)
return function(p11) -- name: AvatarSwitcherIcon
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_10, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
	local v12 = v_u_9(p11.isActive)
	local v13 = v_u_3.useContext(v_u_10)
	local v_u_14 = v_u_5()
	local v15
	if v13 then
		v15 = v13:map(function(p16)
			-- upvalues: (copy) v_u_14
			local v17 = {
				["Color3"] = v_u_14.Color.Content.Default.Color3
			}
			local v18 = v_u_14.Color.Content.Default.Transparency
			v17.Transparency = math.lerp(1, v18, p16)
			return v17
		end)
	else
		v15 = v_u_14.Color.Content.Default
	end
	local v19 = v_u_3.createElement
	local v20 = v_u_4.Icon
	local v21 = {
		["name"] = v_u_6.CirclePerson,
		["size"] = v_u_7.Large
	}
	local v22
	if v12 then
		v22 = v_u_8.Filled
	else
		v22 = v_u_8.Regular
	end
	v21.variant = v22
	v21.style = v15
	return v19(v20, v21)
end