-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Accordion.useAccordion
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Enums.InputPlacement)
require(v1.Enums.InputSize)
require(v1.Components.Types)
local v_u_4 = require(script.Parent.AccordionContext)
return function()
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return v_u_3.useContext(v_u_4)
end