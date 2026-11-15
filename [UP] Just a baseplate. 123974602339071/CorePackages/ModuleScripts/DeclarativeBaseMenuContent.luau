-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.DeclarativeBaseMenuContent
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
require(v1.Components.Types)
local v_u_5 = require(script.Parent.BaseMenuGroup)
local v_u_6 = require(script.Parent.BaseMenuItem)
local function v_u_24(p_u_7) -- name: DeclarativeBaseMenuContent
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6, (copy) v_u_24
	local v8 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_3, (copy) p_u_7
		return (not v_u_3.get(p_u_7.items, { 1, "items" }) or v_u_3.get(p_u_7.items, { 1, "id" })) and {
			{
				["items"] = p_u_7.items
			}
		} or p_u_7.items
	end, { p_u_7.items })
	local v_u_9 = false
	local v_u_10 = {}
	for v11, v12 in v8 do
		local v13 = false
		for _, v14 in v12.items do
			v13 = not v13 and (v14.leading ~= nil or v14.icon ~= nil) and true or v13
			if v_u_9 or v14.isChecked ~= true then
				continue
			end
			v_u_9 = true
		end
		v_u_10[v11] = v13
	end
	return v_u_4.createElement(v_u_4.Fragment, nil, v_u_3.map(v8, function(p15, p16)
		-- upvalues: (copy) v_u_10, (ref) v_u_4, (ref) v_u_5, (ref) v_u_9, (ref) v_u_3, (ref) v_u_6, (ref) v_u_24
		local v_u_17 = v_u_10[p16]
		return v_u_4.createElement(v_u_5, {
			["key"] = p16,
			["LayoutOrder"] = p16,
			["title"] = p15.title,
			["menuHasLeading"] = v_u_17,
			["menuHasCheck"] = v_u_9
		}, v_u_3.map(p15.items, function(p18, p19)
			-- upvalues: (ref) v_u_4, (ref) v_u_6, (copy) v_u_17, (ref) v_u_9, (ref) v_u_24
			local v20 = v_u_4.createElement
			local v21 = v_u_6
			local v22 = {
				["LayoutOrder"] = p19,
				["key"] = p18.id,
				["icon"] = p18.icon,
				["leading"] = p18.leading,
				["trailing"] = p18.trailing,
				["isChecked"] = p18.isChecked,
				["isDisabled"] = p18.isDisabled,
				["text"] = p18.text,
				["onActivated"] = p18.onActivated,
				["id"] = p18.id,
				["testId"] = p18.items and "--foundation-menu-submenu-item" or "--foundation-menu-item",
				["ref"] = p18.ref,
				["menuHasLeading"] = v_u_17,
				["menuHasCheck"] = v_u_9
			}
			local v23
			if p18.items then
				v23 = v_u_4.createElement(v_u_24, {
					["items"] = p18.items
				})
			else
				v23 = nil
			end
			return v20(v21, v22, v23)
		end))
	end))
end
return v_u_4.memo(v_u_24)