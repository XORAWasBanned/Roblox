-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.error.syntaxError
-- https://lua.expert

local GraphQLError = require(script.Parent.GraphQLError).GraphQLError

return {
    syntaxError = function(p1, p2, p3) -- syntaxError | line: 16
        -- upvalues: GraphQLError (copy)
        return GraphQLError.new("Syntax Error: " .. p3, nil, p1, { p2 })
    end
}
