[Rainmeter]
DefaultUpdateDivider=-1
@IncludeContextMenu=#@#ContextMenu.inc
@IncludeVariables=#@#Variables.inc
SkinHeight=#Size#
SkinWidth=#Size#

[Variables]
StrokeRadius=(#StrokeWidth# / 2)
SizeWithStroke=(#Size# - #StrokeWidth#)
Radius=((#Size# / 2) - #StrokeRadius#)
RadiusOffset=(#Size# / 2)

[Base]
Meter=Shape
@IncludeStyle=#@#Styles\#Style#.inc

[Icon]
Meter=Image
X=(#Size# / 2 - #IconSize# / 2)
Y=(#Size# / 2 - #IconSize# / 2)
W=(#IconSize#)
H=(#IconSize#)
