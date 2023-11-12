[Rainmeter]
DefaultUpdateDivider=-1
@IncludeContextMenu=#@#ContextMenu.inc
@IncludeVariables=#@#Variables.inc

[Variables]
StrokeRadius=(#StrokeWidth# / 2)
SizeWithStroke=(#Size# - #StrokeWidth#)
Radius=((#Size# / 2) - #StrokeRadius#)
RadiusOffset=(#Size# / 2)

ShadowStrokeRadius=(#ShadowStrokeWidth# / 2)
ShadowSizeWithStroke=(#Size# - #ShadowStrokeWidth#)
ShadowRadius=((#Size# / 2) - #ShadowStrokeRadius#)
ShadowRadiusOffset=(#Size# / 2)

[Shadow]
Meter=Shape
Stroke=StrokeWidth #ShadowStrokeWidth# | Stroke Color #ShadowStrokeColor#
Fill=Fill Color #ShadowBackgroundColor#
X=#ShadowX#
Y=#ShadowY#
Hidden=(1-#EnableShadow#)

[Base]
Meter=Shape
Stroke=StrokeWidth #StrokeWidth# | Stroke Color #StrokeColor#
Fill=Fill Color #BackgroundColor#

[Style]
@IncludeStyle=#@#Styles\#Style#.inc

[Icon]
Meter=Image
X=(#Size# / 2 - #IconSize# / 2)
Y=(#Size# / 2 - #IconSize# / 2)
W=(#IconSize#)
H=(#IconSize#)
