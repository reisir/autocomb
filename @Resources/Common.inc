[Rainmeter]
DefaultUpdateDivider=-1
Group=Autocomb
@IncludeVariables=#@#Variables.inc
@IncludeContextMenu=#@#ContextMenu.inc

[Base]
Meter=Shape
@IncludeStyle=#@#Styles\#Style#.inc

[Icon]
Meter=Image
X=((#StrokeWidth# / 2) + #Padding# - #StrokeWidth# / 2)
Y=((#StrokeWidth# / 2) + #Padding# - #StrokeWidth# / 2)
W=(#Size# - (#Padding# * 2))
H=(#Size# - (#Padding# * 2))
