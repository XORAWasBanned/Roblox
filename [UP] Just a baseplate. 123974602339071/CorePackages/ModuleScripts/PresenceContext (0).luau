-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.1.0.Motion.AnimatePresence.PresenceContext
local v1 = script.Parent.Parent.Parent
return require(v1.React).createContext({
	["isPresent"] = true,
	["id"] = "",
	["onExitComplete"] = nil,
	["passThroughData"] = nil
})