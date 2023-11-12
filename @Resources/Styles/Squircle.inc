[Variables]
sphube=(#Size# / (((#Hypersphube# < 0.5) && (#Hypersphube# > -0.5)) ? 0.5 : #Hypersphube#))
ssphube=(#SizeWithStroke# - #sphube#)
s=#SizeWithStroke#
r=#Radius#

ssphubes=(#ShadowSizeWithStroke# - #sphube#)
ss=#ShadowSizeWithStroke#
rs=#ShadowRadius#

[Base]
Shape=Path Squirc | Offset #StrokeRadius#,#StrokeRadius# | Extend Stroke,Fill
Squirc=(0),(#r#) | CurveTo (#r#),(0),(0),(#sphube#),(#sphube#),0 | CurveTo #s#,#r#,(#ssphube#),0,(#s#),(#sphube#) | CurveTo (#r#),(#s#),(#s#),(#ssphube#),(#ssphube#),(#s#) | CurveTo (0),(#r#),(#sphube#),(#s#),(0),(#ssphube#)

[Shadow]
Shape=Path Squirc | Offset #StrokeRadius#,#StrokeRadius# | Extend Stroke,Fill
Squirc=(0),(#rs#) | CurveTo (#rs#),(0),(0),(#sphube#),(#sphube#),0 | CurveTo #s#,#r#,(#ssphubes#),0,(#ss#),(#sphube#) | CurveTo (#rs#),(#ss#),(#ss#),(#ssphubes#),(#ssphubes#),(#ss#) | CurveTo (0),(#rs#),(#sphube#),(#ss#),(0),(#ssphubes#)
