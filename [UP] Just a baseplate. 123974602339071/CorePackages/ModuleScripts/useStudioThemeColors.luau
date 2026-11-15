-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.Hooks.useStudioThemeColors
local v1 = script:FindFirstAncestor("Hooks").Parent
local v_u_2 = require(v1.Parent.React)
local v_u_3 = require(v1.Utils.Highlighter.Theme)
require(v1.Types)
local v_u_4 = require(v1.Utils.isCli)
return function() -- name: useStudioThemeColors
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	local v5, v_u_6 = v_u_2.useState(v_u_3.defaultColors)
	v_u_2.useEffect(function()
		-- upvalues: (ref) v_u_4, (ref) v_u_3, (copy) v_u_6
		local function v_u_9() -- name: getTokens
			-- upvalues: (ref) v_u_4, (ref) v_u_3
			if v_u_4() then
				return v_u_3.defaultColors
			end
			local v7, v8 = pcall(function()
				return settings().Studio.Theme
			end)
			return v7 and {
				["background"] = v8:GetColor(Enum.StudioStyleGuideColor.ScriptBackground),
				["iden"] = v8:GetColor(Enum.StudioStyleGuideColor.ScriptText),
				["keyword"] = v8:GetColor(Enum.StudioStyleGuideColor.ScriptKeyword),
				["builtin"] = v8:GetColor(Enum.StudioStyleGuideColor.ScriptBuiltInFunction),
				["string"] = v8:GetColor(Enum.StudioStyleGuideColor.ScriptString),
				["number"] = v8:GetColor(Enum.StudioStyleGuideColor.ScriptNumber),
				["comment"] = v8:GetColor(Enum.StudioStyleGuideColor.ScriptComment),
				["operator"] = v8:GetColor(Enum.StudioStyleGuideColor.ScriptOperator),
				["custom"] = v8:GetColor(Enum.StudioStyleGuideColor.ScriptBool)
			} or {}
		end
		v_u_6((v_u_9()))
		local function v10()
			-- upvalues: (ref) v_u_6, (copy) v_u_9
			return settings().Studio.ThemeChanged:Connect(function()
				-- upvalues: (ref) v_u_6, (ref) v_u_9
				v_u_6((v_u_9()))
			end)
		end
		local v_u_11, v_u_12 = pcall(v10)
		return function()
			-- upvalues: (copy) v_u_11, (copy) v_u_12
			if v_u_11 and v_u_12 then
				v_u_12:Disconnect()
			end
		end
	end, {})
	return v5
end