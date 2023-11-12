[Variables]
sphube=(#Size# / #Hypersphube#)
ssphube=(#SizeWithStroke# - #sphube#)
s=#SizeWithStroke#
r=#Radius#

[Base]
Shape=Path Squirc | Offset #StrokeRadius#,#StrokeRadius# | Extend Stroke,Fill
Squirc=(0),(#r#) | CurveTo (#r#),(0),(0),(#sphube#),(#sphube#),0 | CurveTo #s#,#r#,(#ssphube#),0,(#s#),(#sphube#) | CurveTo (#r#),(#s#),(#s#),(#ssphube#),(#ssphube#),(#s#) | CurveTo (0),(#r#),(#sphube#),(#s#),(0),(#ssphube#)
