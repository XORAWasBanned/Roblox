-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.useTextSize
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactUtils)
local v5 = v1.Components
require(v5.Types)
local v_u_6 = require(v1.Utility.Flags)
local v_u_7 = require(v1.Utility.getTextBoundsAsync)
local v_u_8 = require(v1.Utility.normalizeFontFace)
local v_u_9 = require(v1.Providers.Preferences.usePreferences)
local v_u_10 = require(v1.Utility.Wrappers.Services).TextService
return function(p_u_11, p_u_12, p_u_13) -- name: useTextSize
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_4, (copy) v_u_7, (copy) v_u_3, (copy) v_u_10
	if v_u_6.FoundationFontFaceMigration then
		local v14 = v_u_9().preferredTextSize
		local v_u_15 = v_u_8(p_u_12.Font)
		local v_u_16 = p_u_12.FontSize
		local v_u_23 = v_u_4.useAsync(function()
			-- upvalues: (copy) p_u_11, (copy) v_u_16, (copy) v_u_15, (ref) v_u_7, (copy) p_u_13
			if p_u_11 ~= nil and v_u_16 ~= nil then
				local v17 = v_u_15
				if typeof(v17) == "Font" then
					local v18 = v_u_7
					local v19 = p_u_11
					local v20 = v_u_15
					local v21 = v_u_16
					local v22
					if p_u_13 then
						v22 = p_u_13.X
					else
						v22 = nil
					end
					return v18(v19, v20, v21, v22)
				end
			end
			return nil
		end, {
			p_u_11,
			p_u_12.Font,
			v_u_16,
			p_u_13,
			v14
		})
		local v_u_24 = v_u_3.useRef(nil)
		v_u_3.useEffect(function()
			-- upvalues: (copy) v_u_23, (copy) v_u_24
			if v_u_23.status == "ok" then
				v_u_24.current = v_u_23.value
			end
		end, { v_u_23 })
		if v_u_23.status == "ok" then
			return v_u_23.value
		else
			return v_u_24.current
		end
	else
		local v25, v_u_26 = v_u_3.useState(nil)
		local v27 = {
			p_u_11,
			p_u_12,
			p_u_13,
			v_u_9().preferredTextSize
		}
		v_u_3.useEffect(function()
			-- upvalues: (copy) p_u_11, (copy) v_u_26, (ref) v_u_10, (copy) p_u_12, (copy) p_u_13
			if p_u_11 == nil then
				v_u_26(nil)
			else
				local v28 = v_u_26
				local v29 = v_u_10
				local v30 = p_u_11
				local v31 = p_u_12.FontSize
				local v32 = p_u_12.Font
				local v33
				if p_u_13 then
					v33 = p_u_13
				else
					v33 = Vector2.new((1 / 0), (1 / 0))
				end
				v28(v29:GetTextSize(v30, v31, v32, v33))
			end
		end, v27)
		return v25
	end
end