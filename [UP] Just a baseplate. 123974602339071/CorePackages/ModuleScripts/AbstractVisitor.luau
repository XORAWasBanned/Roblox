-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.AbstractVisitor
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.node.BlockQuote)
require(v1.node.BulletList)
require(v1.node.Code)
require(v1.node.CustomBlock)
require(v1.node.CustomNode)
require(v1.node.Document)
require(v1.node.Emphasis)
require(v1.node.FencedCodeBlock)
require(v1.node.HardLineBreak)
require(v1.node.Heading)
require(v1.node.HtmlBlock)
require(v1.node.HtmlInline)
require(v1.node.Image)
require(v1.node.IndentedCodeBlock)
require(v1.node.Link)
require(v1.node.LinkReferenceDefinition)
require(v1.node.ListItem)
require(v1.node.Node)
require(v1.node.OrderedList)
require(v1.node.Paragraph)
require(v1.node.SoftLineBreak)
require(v1.node.StrongEmphasis)
require(v1.node.Text)
require(v1.node.ThematicBreak)
local v2 = {}
v2.__index = v2
function v2.visitBlockQuote(p3, p4) -- name: visitBlockQuote
	p3:visitChildren(p4)
end
function v2.visitBulletList(p5, p6) -- name: visitBulletList
	p5:visitChildren(p6)
end
function v2.visitCode(p7, p8) -- name: visitCode
	p7:visitChildren(p8)
end
function v2.visitDocument(p9, p10) -- name: visitDocument
	p9:visitChildren(p10)
end
function v2.visitEmphasis(p11, p12) -- name: visitEmphasis
	p11:visitChildren(p12)
end
function v2.visitFencedCodeBlock(p13, p14) -- name: visitFencedCodeBlock
	p13:visitChildren(p14)
end
function v2.visitHardLineBreak(p15, p16) -- name: visitHardLineBreak
	p15:visitChildren(p16)
end
function v2.visitHeading(p17, p18) -- name: visitHeading
	p17:visitChildren(p18)
end
function v2.visitThematicBreak(p19, p20) -- name: visitThematicBreak
	p19:visitChildren(p20)
end
function v2.visitHtmlInline(p21, p22) -- name: visitHtmlInline
	p21:visitChildren(p22)
end
function v2.visitHtmlBlock(p23, p24) -- name: visitHtmlBlock
	p23:visitChildren(p24)
end
function v2.visitImage(p25, p26) -- name: visitImage
	p25:visitChildren(p26)
end
function v2.visitIndentedCodeBlock(p27, p28) -- name: visitIndentedCodeBlock
	p27:visitChildren(p28)
end
function v2.visitLink(p29, p30) -- name: visitLink
	p29:visitChildren(p30)
end
function v2.visitListItem(p31, p32) -- name: visitListItem
	p31:visitChildren(p32)
end
function v2.visitOrderedList(p33, p34) -- name: visitOrderedList
	p33:visitChildren(p34)
end
function v2.visitParagraph(p35, p36) -- name: visitParagraph
	p35:visitChildren(p36)
end
function v2.visitSoftLineBreak(p37, p38) -- name: visitSoftLineBreak
	p37:visitChildren(p38)
end
function v2.visitStrongEmphasis(p39, p40) -- name: visitStrongEmphasis
	p39:visitChildren(p40)
end
function v2.visitText(p41, p42) -- name: visitText
	p41:visitChildren(p42)
end
function v2.visitLinkReferenceDefinition(p43, p44) -- name: visitLinkReferenceDefinition
	p43:visitChildren(p44)
end
function v2.visitCustomBlock(p45, p46) -- name: visitCustomBlock
	p45:visitChildren(p46)
end
function v2.visitCustomNode(p47, p48) -- name: visitCustomNode
	p47:visitChildren(p48)
end
function v2.visitChildren(p49, p50) -- name: visitChildren
	local v51 = p50:getFirstChild()
	while v51 ~= nil do
		local v52 = v51:getNext()
		v51:accept(p49)
		v51 = v52
	end
end
return v2