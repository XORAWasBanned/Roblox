-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.NoFragmentCyclesRule
-- https://lua.expert

local ParentParent = script.Parent.Parent.Parent
local ParentParent2 = ParentParent.Parent
local Array = require(ParentParent2.LuauPolyfill).Array
local GraphQLError = require(ParentParent.error.GraphQLError).GraphQLError

return {
    NoFragmentCyclesRule = function(p1) -- line: 18
        -- upvalues: Array (copy), GraphQLError (copy)
        local t2 = {}
        local t3 = {}
        local t4 = {}

        local function detectCycleRecursive(p2) -- line: 31
            -- upvalues: p1 (copy), t2 (copy), t3 (copy), t4 (copy), detectCycleRecursive (copy), Array (copy), GraphQLError (copy)
            if t4[p2.name.value] then
                return
            end

            local value = p2.name.value

            t4[value] = true

            local v1 = p1:getFragmentSpreads(p2.selectionSet)

            if #v1 == 0 then
                return
            end

            t3[value] = #t2

            for _, v2 in ipairs(v1) do
                local value = v2.name.value
                local v3 = t3[value]

                table.insert(t2, v2)

                if v3 ~= nil then
                    local v5 = Array.slice(t2, v3 + 1)
                    local v6 = table.concat(Array.map(Array.slice(v5, 1, #v5), function(p3) -- line: 61
                        return "\"" .. p3.name.value .. "\""
                    end), ", ")

                    p1:reportError(GraphQLError.new(("Cannot spread fragment \"%s\" within itself"):format(value) .. (v6 ~= "" and (" via %s."):format(v6) or "."), v5))
                else
                    local v4 = p1:getFragment(value)

                    if v4 then
                        detectCycleRecursive(v4)
                    end
                end

                table.remove(t2)
            end

            t3[value] = nil
        end

        return {
            OperationDefinition = function() -- OperationDefinition | line: 82
                return false
            end,
            FragmentDefinition = function(_, p5) -- FragmentDefinition | line: 85
                -- upvalues: detectCycleRecursive (copy)
                detectCycleRecursive(p5)

                return false
            end
        }
    end
}
