require("colorbuddy").colorscheme("mygruvbuddy")

local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

Color.new("white", "#f2e5bc")
Color.new("red", "#cc6666")
Color.new("pink", "#fef601")
Color.new("green", "#99cc99")
Color.new("yellow", "#f8fe7a")
Color.new("blue", "#81a2be")
Color.new("aqua", "#8ec07c")
Color.new("cyan", "#8abeb7")
Color.new("purple", "#8e6fbd")
Color.new("violet", "#b294bb")
Color.new("orange", "#de935f")
Color.new("brown", "#a3685a")

Color.new("seagreen", "#698b69")
Color.new("turquoise", "#698b69")

local background_string = "#111111"
Color.new("background", background_string)
Color.new("gray0", background_string)

Group.new("Normal", c.superwhite, c.gray0)

Group.new("MatchParen", c.cyan, c.gray1)

Group.new("Folded", g.Comment.fg, c.gray1, s.italic)

Group.new("LineNr", c.gray2:light(), c.gray0)

Group.new("@constant", c.orange, nil, s.none)
Group.new("@function", c.yellow, nil, s.none)
Group.new("@function.bracket", g.Normal, g.Normal)
Group.new("@keyword", c.violet, nil, s.none)
Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.none)
Group.new("@property", c.blue)
Group.new("@variable", c.superwhite, nil)
Group.new("@variable.builtin", c.purple:light():light(), g.Normal)

Group.new("texCmd", c.orange)
Group.new("texMathCmd", c.blue)
Group.link("texMathDelim", g.Normal)
Group.link("texMathEnvArgName", g.PreProc)
Group.new("texEnvOpt", c.red)
Group.link("texRefOpt", g.texEnvOpt)
Group.new("texRefArg", c.purple:light())


Group.new("Headline1", c.green, c.gray2, s.bold)
Group.new("Headline2", c.blue, c.gray2, s.bold)
Group.new("Headline3", c.yellow, c.gray2, s.bold)

Group.new("DiagnosticVirtualTextInfo", c.blue:dark(), nil, s.italic)


Group.new("@function.call.lua", c.blue:dark(), nil, nil)
