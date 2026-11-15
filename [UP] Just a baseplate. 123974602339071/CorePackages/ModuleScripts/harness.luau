-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.__tests__.harness
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.LuauPolyfill).Array
local v_u_5 = require(v2.language.parser).parse
require(v2.type.schema)
local v6 = require(v2.utilities.buildASTSchema).buildSchema
local v7 = require(v1.validate)
local v_u_8 = v7.validate
local v_u_9 = v7.validateSDL
local v_u_10 = v6("  interface Being {\n    name(surname: Boolean): String\n  }\n\n  interface Mammal {\n    mother: Mammal\n    father: Mammal\n  }\n\n  interface Pet implements Being {\n    name(surname: Boolean): String\n  }\n\n  interface Canine implements Mammal & Being {\n    name(surname: Boolean): String\n    mother: Canine\n    father: Canine\n  }\n\n  enum DogCommand {\n    SIT\n    HEEL\n    DOWN\n  }\n\n  type Dog implements Being & Pet & Mammal & Canine {\n    name(surname: Boolean): String\n    nickname: String\n    barkVolume: Int\n    barks: Boolean\n    doesKnowCommand(dogCommand: DogCommand): Boolean\n    isHouseTrained(atOtherHomes: Boolean = true): Boolean\n    isAtLocation(x: Int, y: Int): Boolean\n    mother: Dog\n    father: Dog\n  }\n\n  type Cat implements Being & Pet {\n    name(surname: Boolean): String\n    nickname: String\n    meows: Boolean\n    meowsVolume: Int\n    furColor: FurColor\n  }\n\n  union CatOrDog = Cat | Dog\n\n  interface Intelligent {\n    iq: Int\n  }\n\n  type Human implements Being & Intelligent {\n    name(surname: Boolean): String\n    pets: [Pet]\n    relatives: [Human]\n    iq: Int\n  }\n\n  type Alien implements Being & Intelligent {\n    name(surname: Boolean): String\n    numEyes: Int\n    iq: Int\n  }\n\n  union DogOrHuman = Dog | Human\n\n  union HumanOrAlien = Human | Alien\n\n  enum FurColor {\n    BROWN\n    BLACK\n    TAN\n    SPOTTED\n    NO_FUR\n    UNKNOWN\n  }\n\n  input ComplexInput {\n    requiredField: Boolean!\n    nonNullField: Boolean! = false\n    intField: Int\n    stringField: String\n    booleanField: Boolean\n    stringListField: [String]\n  }\n\n  type ComplicatedArgs {\n    # TODO List\n    # TODO Coercion\n    # TODO NotNulls\n    intArgField(intArg: Int): String\n    nonNullIntArgField(nonNullIntArg: Int!): String\n    stringArgField(stringArg: String): String\n    booleanArgField(booleanArg: Boolean): String\n    enumArgField(enumArg: FurColor): String\n    floatArgField(floatArg: Float): String\n    idArgField(idArg: ID): String\n    stringListArgField(stringListArg: [String]): String\n    stringListNonNullArgField(stringListNonNullArg: [String!]): String\n    complexArgField(complexArg: ComplexInput): String\n    multipleReqs(req1: Int!, req2: Int!): String\n    nonNullFieldWithDefault(arg: Int! = 0): String\n    multipleOpts(opt1: Int = 0, opt2: Int = 0): String\n    multipleOptAndReq(req1: Int!, req2: Int!, opt1: Int = 0, opt2: Int = 0): String\n  }\n\n  type QueryRoot {\n    human(id: ID): Human\n    alien: Alien\n    dog: Dog\n    cat: Cat\n    pet: Pet\n    catOrDog: CatOrDog\n    dogOrHuman: DogOrHuman\n    humanOrAlien: HumanOrAlien\n    complicatedArgs: ComplicatedArgs\n  }\n\n  schema {\n    query: QueryRoot\n  }\n\n  directive @onQuery on QUERY\n  directive @onMutation on MUTATION\n  directive @onSubscription on SUBSCRIPTION\n  directive @onField on FIELD\n  directive @onFragmentDefinition on FRAGMENT_DEFINITION\n  directive @onFragmentSpread on FRAGMENT_SPREAD\n  directive @onInlineFragment on INLINE_FRAGMENT\n  directive @onVariableDefinition on VARIABLE_DEFINITION\n")
local function v_u_17(p11, p12, p13, p14) -- name: expectValidationErrorsWithSchema
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_4
	local v15 = v_u_8(p12, v_u_5(p14), { p13 })
	return p11((v_u_4.map(v15, function(p16)
		return {
			["message"] = p16.message,
			["locations"] = p16.locations
		}
	end)))
end
return {
	["testSchema"] = v_u_10,
	["expectValidationErrorsWithSchema"] = v_u_17,
	["expectValidationErrors"] = function(p18, p19, p20) -- name: expectValidationErrors
		-- upvalues: (copy) v_u_17, (copy) v_u_10
		return v_u_17(p18, v_u_10, p19, p20)
	end,
	["expectSDLValidationErrors"] = function(p21, p22, p23, p24) -- name: expectSDLValidationErrors
		-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_4
		local v25 = v_u_9(v_u_5(p24), p22, { p23 })
		return p21((v_u_4.map(v25, function(p26)
			return {
				["message"] = p26.message,
				["locations"] = p26.locations
			}
		end)))
	end
}