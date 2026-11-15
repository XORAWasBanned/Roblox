-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.Flags
local v1 = script:FindFirstAncestor("MarkdownCore").Parent
local v2 = require(v1.SafeFlags)
return {
	["FFlagMarkdownAssistantParity"] = v2.createGetFFlag("MarkdownAssistantParity")(),
	["FFlagMarkdownTables"] = v2.createGetFFlag("MarkdownTables")(),
	["FFlagMarkdownTagFallbacks"] = v2.createGetFFlag("MarkdownTagFallbacks")()
}