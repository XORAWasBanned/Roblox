-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.type.validate
-- https://lua.expert

local ParentParent = script.Parent.Parent
local ParentParent2 = ParentParent.Parent
local LuauPolyfill = require(ParentParent2.LuauPolyfill)
local Array, Boolean, Error = LuauPolyfill.Array, LuauPolyfill.Boolean, LuauPolyfill.Error
local isNotNillish = require(ParentParent.luaUtils.isNillish).isNotNillish
local inspect = require(script.Parent.Parent.jsutils.inspect).inspect
local GraphQLError = require(script.Parent.Parent.error.GraphQLError).GraphQLError
local locatedError = require(script.Parent.Parent.error).locatedError

require(ParentParent.language.ast)

local isValidNameError = require(ParentParent.utilities.assertValidName).isValidNameError
local typeComparators = require(script.Parent.Parent.utilities.typeComparators)
local isEqualType, isTypeSubTypeOf = typeComparators.isEqualType, typeComparators.isTypeSubTypeOf
local assertSchema = require(script.Parent.schema).assertSchema
local definition = require(script.Parent.definition)
local isIntrospectionType = require(script.Parent.introspection).isIntrospectionType
local directives = require(script.Parent.directives)
local isDirective, GraphQLDeprecatedDirective = directives.isDirective, directives.GraphQLDeprecatedDirective
local isObjectType, isInterfaceType, isUnionType, isEnumType = definition.isObjectType, definition.isInterfaceType, definition.isUnionType, definition.isEnumType
local isInputObjectType, isNamedType, isNonNullType, isInputType = definition.isInputObjectType, definition.isNamedType, definition.isNonNullType, definition.isInputType
local isOutputType, isRequiredArgument, isRequiredInputField = definition.isOutputType, definition.isRequiredArgument, definition.isRequiredInputField
local t1, validateRootTypes, validateDirectives, getOperationTypeNode, getAllSubNodes, getAllNodes, getAllImplementsInterfaceNodes, getDeprecatedDirectiveNode, getUnionMemberTypeNodes, validateEnumValues, validateName, validateFields, validateTypeImplementsAncestors, validateTypes, validateTypeImplementsInterface, validateInterfaces

local function v1(p1) -- line: 78
    -- upvalues: assertSchema (copy), t1 (ref), validateRootTypes (ref), validateDirectives (ref), validateTypes (ref)
    assertSchema(p1)

    if p1.__validationErrors ~= nil then
        return p1.__validationErrors
    end

    local v2 = t1.new(p1)

    validateRootTypes(v2)
    validateDirectives(v2)
    validateTypes(v2)

    local v3 = v2:getErrors()

    p1.__validationErrors = v3

    return v3
end

t1 = {}
t1.__index = t1

function t1.new(p2) -- line: 132
    -- upvalues: t1 (ref)
    local self = setmetatable({}, t1)

    self._errors = {}
    self.schema = p2

    return self
end

function t1.reportError(p3, p4, p5) -- line: 141
    -- upvalues: Array (copy), Boolean (copy), GraphQLError (copy)
    local v5 = if Array.isArray(p5) then Array.filter(p5, Boolean.toJSBoolean) else p5

    p3:addError(GraphQLError.new(p4, v5))
end

function t1:addError(p7) -- line: 150
    table.insert(self._errors, p7)
end

function t1:getErrors() -- line: 154
    return self._errors
end

function validateRootTypes(p9) -- line: 158
    -- upvalues: isNotNillish (copy), inspect (copy), isObjectType (copy), getOperationTypeNode (ref)
    local schema = p9.schema
    local v6 = schema:getQueryType()

    if isNotNillish(v6) then
        if not isObjectType(v6) then
            local query = getOperationTypeNode(schema, "query")

            p9:reportError(("Query root type must be Object type, it cannot be %s."):format(inspect(v6)), query or v6.astNode)
        end
    else
        p9:reportError("Query root type must be provided.", schema.astNode)
    end

    local v7 = schema:getMutationType()
    local v8, v9

    if isNotNillish(v7) and not isObjectType(v7) then
        local mutation = getOperationTypeNode(schema, "mutation")

        v8 = "Mutation root type must be Object type if provided, it cannot be " .. ("%s."):format(inspect(v7))
        v9 = mutation or v7.astNode
        p9:reportError(v8, v9)
    end

    local v10 = schema:getSubscriptionType()
    local v11, v12

    if isNotNillish(v10) and not isObjectType(v10) then
        local subscription = getOperationTypeNode(schema, "subscription")

        v11 = "Subscription root type must be Object type if provided, it cannot be " .. ("%s."):format(inspect(v10))
        v12 = subscription or v10.astNode
        p9:reportError(v11, v12)
    end
end

function getOperationTypeNode(p10, p11) -- line: 197
    -- upvalues: getAllSubNodes (ref)
    local v13 = getAllSubNodes(p10, function(p12) -- line: 198
        return p12.operationTypes
    end)

    for _, v14 in ipairs(v13) do
        if v14.operation == p11 then
            return v14.type
        end
    end

    return nil
end

function validateDirectives(p13) -- line: 211
    -- upvalues: isNotNillish (copy), inspect (copy), isDirective (copy), isInputType (copy), isRequiredArgument (copy), getDeprecatedDirectiveNode (ref), validateName (ref)
    for _, v15 in ipairs(p13.schema:getDirectives()) do
        if isDirective(v15) then
            validateName(p13, v15)

            for _, v16 in ipairs(v15.args) do
                validateName(p13, v16)

                if not isInputType(v16.type) then
                    p13:reportError(("The type of @%s(%s:) must be Input Type "):format(v15.name, v16.name) .. ("but got: %s."):format(inspect(v16.type)), v16.astNode)
                end

                if isRequiredArgument(v16) and isNotNillish(v16.deprecationReason) then
                    p13:reportError(("Required argument @%s(%s:) cannot be deprecated."):format(v15.name, v16.name), {
                        getDeprecatedDirectiveNode(v16.astNode),
                        if v16.astNode == nil then nil else v16.astNode.type
                    })
                end
            end
        else
            p13:reportError(("Expected directive but got: %s."):format(inspect(v15)), if v15 then v15.astNode else nil)
        end
    end
end

function validateName(p14, p15) -- line: 255
    -- upvalues: locatedError (copy), isValidNameError (copy)
    local v19, astNode

    if typeof(p15) == "table" then
        v19 = p15.name
        astNode = p15.astNode
    else
        v19 = tostring(p15)
    end

    local v20 = isValidNameError(v19)

    if v20 then
        p14:addError(locatedError(v20, astNode))
    end
end

function validateTypes(p16) -- line: 276
    -- upvalues: inspect (copy), isIntrospectionType (copy), isObjectType (copy), isInterfaceType (copy), isUnionType (copy), isEnumType (copy), isInputObjectType (copy), isNamedType (copy), validateEnumValues (ref), validateName (ref), validateFields (ref), validateInterfaces (ref)
    local v21 = createInputObjectCircularRefsValidator(p16)
    local v22 = p16.schema:getTypeMap()

    for _, v23 in ipairs(v22:values()) do
        local astNode = if typeof(v23) == "table" then v23.astNode else nil

        if isNamedType(v23) then
            if not isIntrospectionType(v23) then
                validateName(p16, v23)
            end

            if isObjectType(v23) or isInterfaceType(v23) then
                validateFields(p16, v23)
                validateInterfaces(p16, v23)
            elseif isUnionType(v23) then
                validateUnionMembers(p16, v23)
            elseif isEnumType(v23) then
                validateEnumValues(p16, v23)
            elseif isInputObjectType(v23) then
                validateInputFields(p16, v23)
                v21(v23)
            end
        else
            p16:reportError(("Expected GraphQL named type but got: %s."):format(inspect(v23)), astNode)
        end
    end
end

function validateFields(p17, p18) -- line: 329
    -- upvalues: isNotNillish (copy), inspect (copy), isInputType (copy), isOutputType (copy), isRequiredArgument (copy), getAllNodes (ref), getDeprecatedDirectiveNode (ref), validateName (ref)
    local v24 = p18:getFields():values()

    if #v24 == 0 then
        local v25 = ("Type %s must define one or more fields."):format(p18.name)
        local getAllNodes2 = getAllNodes

        p17:reportError(v25, getAllNodes2(p18))
    end

    for _, v26 in ipairs(v24) do
        validateName(p17, v26)

        if not isOutputType(v26.type) then
            p17:reportError(("The type of %s.%s must be Output Type "):format(p18.name, v26.name) .. ("but got: %s."):format(inspect(v26.type)), if v26.astNode == nil then nil else v26.astNode.type)
        end

        for _, v27 in ipairs(v26.args) do
            local name = v27.name

            validateName(p17, v27)

            if not isInputType(v27.type) then
                p17:reportError(("The type of %s.%s(%s:) must be Input "):format(p18.name, v26.name, name) .. ("Type but got: %s."):format(inspect(v27.type)), if v27.astNode == nil then nil else v27.astNode.type)
            end

            if isRequiredArgument(v27) and isNotNillish(v27.deprecationReason) then
                p17:reportError(("Required argument %s.%s(%s:) cannot be deprecated."):format(p18.name, v26.name, name), {
                    getDeprecatedDirectiveNode(v27.astNode),
                    if v27.astNode == nil then nil else v27.astNode.type
                })
            end
        end
    end
end

function validateInterfaces(p19, p20) -- line: 394
    -- upvalues: inspect (copy), isInterfaceType (copy), getAllImplementsInterfaceNodes (ref), validateTypeImplementsAncestors (ref), validateTypeImplementsInterface (ref)
    local t6 = {}

    for _, v30 in ipairs(p20:getInterfaces()) do
        if isInterfaceType(v30) then
            if p20 == v30 then
                local v31 = ("Type %s cannot implement itself because it would create a circular reference."):format(p20.name)
                local getAllImplementsInterfaceNodes2 = getAllImplementsInterfaceNodes

                p19:reportError(v31, getAllImplementsInterfaceNodes2(p20, v30))
            else
                local v32 = if typeof(nil) == "table" then tostring(v30.name) else tostring(v30)

                if t6[v32] then
                    local v33 = ("Type %s can only implement %s once."):format(p20.name, v30.name)
                    local getAllImplementsInterfaceNodes2 = getAllImplementsInterfaceNodes

                    p19:reportError(v33, getAllImplementsInterfaceNodes2(p20, v30))
                else
                    t6[v32] = true
                    validateTypeImplementsAncestors(p19, p20, v30)
                    validateTypeImplementsInterface(p19, p20, v30)
                end
            end
        else
            local v34 = ("Type %s must only implement Interface types, "):format(inspect(p20)) .. ("it cannot implement %s."):format(inspect(v30))
            local getAllImplementsInterfaceNodes2 = getAllImplementsInterfaceNodes

            p19:reportError(v34, getAllImplementsInterfaceNodes2(p20, v30))
        end
    end
end

function validateTypeImplementsInterface(p21, p22, p23) -- line: 444
    -- upvalues: Array (copy), inspect (copy), isEqualType (copy), isTypeSubTypeOf (copy), isRequiredArgument (copy), getAllNodes (ref)
    local v35 = p22:getFields()

    for _, v36 in ipairs(p23:getFields():values()) do
        local name = v36.name
        local v37 = v35:get(name)

        if v37 then
            if not isTypeSubTypeOf(p21.schema, v37.type, v36.type) then
                p21:reportError(("Interface field %s.%s expects type "):format(p23.name, name) .. ("%s but %s.%s "):format(inspect(v36.type), p22.name, name) .. ("is type %s."):format(inspect(v37.type)), {
                    if v36.astNode == nil then nil else v36.astNode.type,
                    if v37.astNode == nil then nil else v37.astNode.type
                })
            end

            for _, v39 in ipairs(v36.args) do
                local name2 = v39.name
                local v40 = Array.find(v37.args, function(p24) -- line: 492
                    -- upvalues: name2 (copy)
                    return p24.name == name2
                end)

                if v40 then
                    if not isEqualType(v39.type, v40.type) then
                        p21:reportError(("Interface field argument %s.%s(%s:) "):format(p23.name, name, name2) .. ("expects type %s but "):format(inspect(v39.type)) .. ("%s.%s(%s:) is type "):format(p22.name, name, name2) .. ("%s."):format(inspect(v40.type)), {
                            if v39.astNode == nil then nil else v39.astNode.type,
                            if v40.astNode == nil then nil else v40.astNode.type
                        })
                    end
                else
                    p21:reportError(("Interface field argument %s.%s(%s:) expected but %s.%s does not provide it."):format(p23.name, name, name2, p22.name, name), {
                        v39.astNode,
                        v37.astNode
                    })
                end
            end

            for _, v42 in ipairs(v37.args) do
                local name2 = v42.name

                if not Array.find(v36.args, function(p25) -- line: 538
                    -- upvalues: name2 (copy)
                    return p25.name == name2
                end) and isRequiredArgument(v42) then
                    p21:reportError(("Object field %s.%s includes required argument %s that is missing from the Interface field %s.%s."):format(p22.name, name, name2, p23.name, name), {
                        v42.astNode,
                        v36.astNode
                    })
                end
            end
        else
            local v43 = ("Interface field %s.%s expected but %s does not provide it."):format(p23.name, name, p22.name)
            local concat = Array.concat
            local t9 = {
                v36.astNode
            }
            local getAllNodes2 = getAllNodes

            p21:reportError(v43, concat(t9, getAllNodes2(p22)))
        end
    end
end

function validateTypeImplementsAncestors(p26, p27, p28) -- line: 557
    -- upvalues: Array (copy), getAllImplementsInterfaceNodes (ref)
    local v44 = p27:getInterfaces()

    for _, v45 in ipairs(p28:getInterfaces()) do
        if Array.indexOf(v44, v45) == -1 then
            local v46 = if v45 == p27 then ("Type %s cannot implement %s because it would create a circular reference."):format(p27.name, p28.name) else ("Type %s must implement %s because it is implemented by %s."):format(p27.name, v45.name, p28.name)
            local concat = Array.concat
            local v47 = getAllImplementsInterfaceNodes(p28, v45)
            local getAllImplementsInterfaceNodes2 = getAllImplementsInterfaceNodes

            p26:reportError(v46, concat(v47, getAllImplementsInterfaceNodes2(p27, p28)))
        end
    end
end

function validateUnionMembers(p29, p30) -- line: 587
    -- upvalues: inspect (copy), isObjectType (copy), getAllNodes (ref), getUnionMemberTypeNodes (ref)
    local v48 = p30:getTypes()

    if #v48 == 0 then
        local v49 = ("Union type %s must define one or more member types."):format(p30.name)
        local getAllNodes2 = getAllNodes

        p29:reportError(v49, getAllNodes2(p30))
    end

    local t10 = {}

    for _, v50 in ipairs(v48) do
        if t10[tostring(v50.name)] then
            local v51 = ("Union type %s can only include type %s once."):format(p30.name, v50.name)
            local getUnionMemberTypeNodes2 = getUnionMemberTypeNodes

            p29:reportError(v51, getUnionMemberTypeNodes2(p30, v50.name))
        else
            t10[tostring(v50.name)] = true

            if not isObjectType(v50) then
                local v52 = ("Union type %s can only include Object types, "):format(p30.name) .. ("it cannot include %s."):format(inspect(v50))
                local getUnionMemberTypeNodes2 = getUnionMemberTypeNodes

                p29:reportError(v52, getUnionMemberTypeNodes2(p30, (tostring(v50))))
            end
        end
    end
end

function validateEnumValues(p31, p32) -- line: 621
    -- upvalues: getAllNodes (ref), validateName (ref)
    local v53 = p32:getValues()

    if #v53 == 0 then
        local v54 = ("Enum type %s must define one or more values."):format(p32.name)
        local getAllNodes2 = getAllNodes

        p31:reportError(v54, getAllNodes2(p32))
    end

    for _, v55 in ipairs(v53) do
        local name = v55.name

        validateName(p31, v55)

        if name == "true" or name == "false" or name == "null" then
            p31:reportError(("Enum type %s cannot include value: %s."):format(p32.name, name), v55.astNode)
        end
    end
end

function validateInputFields(p33, p34) -- line: 646
    -- upvalues: isNotNillish (copy), inspect (copy), isInputType (copy), isRequiredInputField (copy), getAllNodes (ref), getDeprecatedDirectiveNode (ref), validateName (ref)
    local v56 = p34:getFields():values()

    if #v56 == 0 then
        local v57 = ("Input Object type %s must define one or more fields."):format(p34.name)
        local getAllNodes2 = getAllNodes

        p33:reportError(v57, getAllNodes2(p34))
    end

    for _, v58 in ipairs(v56) do
        validateName(p33, v58)

        if not isInputType(v58.type) then
            p33:reportError(("The type of %s.%s must be Input Type "):format(p34.name, v58.name) .. ("but got: %s."):format(inspect(v58.type)), if v58.astNode == nil then nil else v58.astNode.type)
        end

        if isRequiredInputField(v58) and isNotNillish(v58.deprecationReason) then
            p33:reportError(("Required input field %s.%s cannot be deprecated."):format(p34.name, v58.name), {
                getDeprecatedDirectiveNode(v58.astNode),
                if v58.astNode == nil then nil else v58.astNode.type
            })
        end
    end
end

function createInputObjectCircularRefsValidator(p35) -- line: 688
    -- upvalues: Array (copy), isInputObjectType (copy), isNonNullType (copy)
    local t12 = {}
    local t13 = {}
    local t14 = {}

    local function detectCycleRecursive(p36) -- line: 705
        -- upvalues: p35 (copy), t12 (copy), t13 (copy), t14 (copy), detectCycleRecursive (copy), Array (copy), isInputObjectType (copy), isNonNullType (copy)
        if t14[tostring(p36.name)] then
            return
        end

        t14[tostring(p36.name)] = true
        t13[tostring(p36.name)] = #t12 + 1

        local v61 = p36:getFields():values()

        for _, v62 in ipairs(v61) do
            if isNonNullType(v62.type) and isInputObjectType(v62.type.ofType) then
                local ofType = v62.type.ofType
                local v63 = t13[tostring(ofType.name)]

                table.insert(t12, v62)

                if v63 ~= nil then
                    local v64 = Array.slice(t12, v63)
                    local v65 = Array.join(Array.map(v64, function(p37) -- line: 733
                        return p37.name
                    end), ".")

                    p35:reportError(("Cannot reference Input Object \"%s\" within itself through a series of non-null fields: \"%s\"."):format(ofType.name, v65), Array.map(v64, function(p38) -- line: 743
                        return p38.astNode
                    end))
                else
                    detectCycleRecursive(ofType)
                end

                table.remove(t12)
            end
        end

        t13[tostring(p36.name)] = nil
    end

    return detectCycleRecursive
end

function getAllNodes(p39) -- line: 767
    -- upvalues: Array (copy)
    local astNode, extensionASTNodes = p39.astNode, p39.extensionASTNodes

    if not astNode then
        return extensionASTNodes or {}
    end

    if extensionASTNodes then
        return (Array.concat({ astNode }, extensionASTNodes))
    end

    return { astNode }
end

function getAllSubNodes(p40, p41) -- line: 777
    -- upvalues: Array (copy), getAllNodes (ref)
    local v66 = {}

    for _, v67 in ipairs(getAllNodes(p40)) do
        local v68 = p41(v67)

        v66 = Array.concat(v66, v68 or {})
    end

    return v66
end

function getAllImplementsInterfaceNodes(p42, p43) -- line: 793
    -- upvalues: Array (copy), getAllSubNodes (ref)
    return Array.filter(getAllSubNodes(p42, function(p44) -- line: 798
        return p44.interfaces
    end), function(p45) -- line: 801
        -- upvalues: p43 (copy)
        return p45.name.value == p43.name
    end)
end

function getUnionMemberTypeNodes(p46, p47) -- line: 807
    -- upvalues: Array (copy), getAllSubNodes (ref)
    return Array.filter(getAllSubNodes(p46, function(p48) -- line: 809
        return p48.types
    end), function(p49) -- line: 812
        -- upvalues: p47 (copy)
        return p49.name.value == p47
    end)
end

function getDeprecatedDirectiveNode(p50) -- line: 818
    -- upvalues: Array (copy), GraphQLDeprecatedDirective (copy)
    if p50 == nil or p50.directives == nil then
        return
    end

    return Array.find(p50.directives, function(p51) -- line: 823
        -- upvalues: GraphQLDeprecatedDirective (copy)
        return p51.name.value == GraphQLDeprecatedDirective.name
    end)
end

return {
    validateSchema = v1,
    assertValidSchema = function(p52) -- line: 106
        -- upvalues: Array (copy), Error (copy), v1 (copy)
        local v69 = v1(p52)

        if #v69 ~= 0 then
            error(Error.new(Array.join(Array.map(v69, function(p53) -- line: 111
                return p53.message
            end), "\n\n")))
        end
    end
}
