-- Path: CorePackages.Packages._Index.Markdown.Markdown.Components.MarkdownViewer
local v_u_1 = script:FindFirstAncestor("Components").Parent
local v2 = v_u_1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.Dash)
local v5 = require(v2.Foundation)
local v_u_6 = v5.Text
local v_u_7 = v5.View
local v_u_8 = v5.Hooks.useTokens
local v9 = require(v2.MarkdownCore)
local v_u_10 = require(v_u_1.Parsers.CommonMarkComplianceParser)
local v_u_11 = require(v_u_1.Flags)
require(v_u_1.Types)
local v_u_12 = require(script.MarkdownRenderer)
local v_u_13 = v9.Flags
return function(p_u_14) -- name: MarkdownViewer
	-- upvalues: (copy) v_u_8, (copy) v_u_13, (copy) v_u_3, (copy) v_u_4, (copy) v_u_12, (copy) v_u_11, (copy) v_u_1, (copy) v_u_10, (copy) v_u_7, (copy) v_u_6
	local v_u_15 = v_u_8()
	if v_u_13.FFlagMarkdownAssistantParity or (p_u_14.Markdown or p_u_14.Ast) then
		local v16 = v_u_3.useMemo
		local function v17()
			-- upvalues: (ref) v_u_4, (ref) v_u_12, (copy) p_u_14
			return v_u_4.join(v_u_12.defaultRenderers, p_u_14.Renderers or {}, p_u_14.AdditionalFeatureRenderers or {})
		end
		local v18
		if v_u_13.FFlagMarkdownAssistantParity then
			v18 = { p_u_14.Renderers, p_u_14.AdditionalFeatureRenderers }
		else
			v18 = { p_u_14.Renderers }
		end
		local v_u_19 = v16(v17, v18)
		local v_u_20 = (v_u_13.FFlagMarkdownTables or v_u_13.FFlagMarkdownTagFallbacks) and p_u_14.IsStreaming and {
			["isStreaming"] = true
		} or nil
		local v21
		if v_u_13.FFlagMarkdownTables or v_u_13.FFlagMarkdownTagFallbacks then
			v21 = {
				p_u_14.Markdown,
				p_u_14.Ast,
				p_u_14.IsStreaming,
				p_u_14.ParserProfile
			}
		else
			v21 = { p_u_14.Markdown, p_u_14.Ast, p_u_14.ParserProfile }
		end
		local v_u_27, v_u_28 = v_u_3.useMemo(function()
			-- upvalues: (copy) p_u_14, (ref) v_u_11, (ref) v_u_1, (copy) v_u_20, (ref) v_u_10
			if p_u_14.Ast then
				return true, p_u_14.Ast
			end
			if not p_u_14.Markdown then
				return true, nil
			end
			local v22 = v_u_11.FFlagMarkdownDefaultRobloxProfile
			local v23
			if v_u_11.FFlagMarkdownUseRobloxProfileParser or v22 then
				local v24 = p_u_14.ParserProfile or (v22 and "RobloxMarkdown" or nil)
				if v24 == "RobloxMarkdown" then
					v23 = require(v_u_1.Parsers.RobloxMarkdown.RendererParser)
				elseif v24 == "CommonMark" then
					v23 = require(v_u_1.Parsers.CommonMark.RendererParser)
				else
					v23 = nil
				end
			else
				v23 = nil
			end
			local v25, v26
			if v23 == nil then
				v25, v26 = v_u_10.safeParse(p_u_14.Markdown, v_u_20)
			else
				v25, v26 = v23.safeParse(p_u_14.Markdown, v_u_20)
			end
			if not v25 then
				if p_u_14.OnError then
					p_u_14.OnError(v26)
					return v25, v26
				end
				warn("MarkdownViewer: Error parsing markdown.", v26)
			end
			return v25, v26
		end, v21)
		local v29 = v_u_3.useMemo
		local function v30()
			-- upvalues: (copy) v_u_27, (ref) v_u_12, (copy) v_u_28, (copy) v_u_19, (copy) p_u_14, (copy) v_u_15
			if v_u_27 then
				return v_u_12.render(v_u_28, {
					["userRenderers"] = v_u_19,
					["linkCallback"] = p_u_14.LinkCallback,
					["markdownRendererProps"] = p_u_14.MarkdownRendererProps,
					["colorScheme"] = p_u_14.ColorScheme,
					["tokens"] = v_u_15
				})
			else
				return nil
			end
		end
		local v31
		if v_u_13.FFlagMarkdownAssistantParity then
			v31 = {
				v_u_27,
				v_u_28,
				p_u_14.LinkCallback,
				p_u_14.MarkdownRendererProps,
				p_u_14.ColorScheme,
				v_u_19,
				v_u_15
			}
		else
			v31 = {
				v_u_27,
				v_u_28,
				p_u_14.LinkCallback,
				p_u_14.MarkdownRendererProps,
				p_u_14.ColorScheme,
				v_u_19
			}
		end
		local v32 = v29(v30, v31)
		if v_u_13.FFlagMarkdownAssistantParity and not (p_u_14.Markdown or p_u_14.Ast) then
			warn("MarkdownViewer requires either a Markdown string or an Ast in props")
			return nil
		elseif v_u_27 then
			return v_u_3.createElement(v_u_7, v_u_4.join({
				["tag"] = "col size-full-0 auto-y",
				["backgroundStyle"] = nil,
				["BorderSizePixel"] = 0,
				["backgroundStyle"] = {
					["Transparency"] = 1
				}
			}, p_u_14.WrapperProps or {}), v32)
		else
			return p_u_14.Fallback or v_u_3.createElement(v_u_7, v_u_4.join({
				["tag"] = "size-full-0 auto-y",
				["backgroundStyle"] = nil,
				["backgroundStyle"] = {
					["Transparency"] = 1
				}
			}, p_u_14.WrapperProps or {}), v_u_3.createElement(v_u_6, {
				["Text"] = "Failed to parse the provided markdown"
			}))
		end
	else
		warn("MarkdownViewer requires either a Markdown string or an Ast in props")
		return nil
	end
end