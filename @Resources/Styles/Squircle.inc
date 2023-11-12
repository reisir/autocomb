; Old variable based implementation, can't be animated..
; [Variables]
; sphube=(#Size# / (((#Hypersphube# < 0.5) && (#Hypersphube# > -0.5)) ? 0.5 : #Hypersphube#))
; sphube=(#Size# / #Hypersphube#)

; ssphube=(#SizeWithStroke# - #sphube#)
; s=#SizeWithStroke#
; r=#Radius#

; ssphubes=(#ShadowSizeWithStroke# - #sphube#)
; ss=#ShadowSizeWithStroke#
; rs=#ShadowRadius#

; [Base]
; Shape=Path Squirc | Offset #StrokeRadius#,#StrokeRadius# | Extend Stroke,Fill,Modifiers
; Squirc=(0),(#r#) | CurveTo (#r#),(0),(0),(#sphube#),(#sphube#),0 | CurveTo #s#,#r#,(#ssphube#),0,(#s#),(#sphube#) | CurveTo (#r#),(#s#),(#s#),(#ssphube#),(#ssphube#),(#s#) | CurveTo (0),(#r#),(#sphube#),(#s#),(0),(#ssphube#)

; [Shadow]
; Shape=Path Squirc | Offset #ShadowStrokeRadius#,#ShadowStrokeRadius# | Extend Stroke,Fill,Modifiers
; Squirc=(0),(#rs#) | CurveTo (#rs#),(0),(0),(#sphube#),(#sphube#),0 | CurveTo #ss#,#rs#,(#ssphubes#),0,(#ss#),(#sphube#) | CurveTo (#rs#),(#ss#),(#ss#),(#ssphubes#),(#ssphubes#),(#ss#) | CurveTo (0),(#rs#),(#sphube#),(#ss#),(0),(#ssphubes#)

[Base]
Shape=Path Squirc | Offset #StrokeRadius#,#StrokeRadius# | Extend Stroke,Fill,Modifiers
Squirc=(0),(#Radius#) | CurveTo (#Radius#),(0),(0),((#Size# / #Hypersphube#)),((#Size# / #Hypersphube#)),0 | CurveTo #SizeWithStroke#,#Radius#,((#SizeWithStroke# - (#Size# / #Hypersphube#))),0,(#SizeWithStroke#),((#Size# / #Hypersphube#)) | CurveTo (#Radius#),(#SizeWithStroke#),(#SizeWithStroke#),((#SizeWithStroke# - (#Size# / #Hypersphube#))),((#SizeWithStroke# - (#Size# / #Hypersphube#))),(#SizeWithStroke#) | CurveTo (0),(#Radius#),((#Size# / #Hypersphube#)),(#SizeWithStroke#),(0),((#SizeWithStroke# - (#Size# / #Hypersphube#)))

[Shadow]
Shape=Path Squirc | Offset #ShadowStrokeRadius#,#ShadowStrokeRadius# | Extend Stroke,Fill,Modifiers
Squirc=(0),(#ShadowRadius#) | CurveTo (#ShadowRadius#),(0),(0),((#Size# / #Hypersphube#)),((#Size# / #Hypersphube#)),0 | CurveTo #ShadowSizeWithStroke#,#ShadowRadius#,(#ShadowSizeWithStroke# - (#Size# / #Hypersphube#)),0,(#ShadowSizeWithStroke#),((#Size# / #Hypersphube#)) | CurveTo (#ShadowRadius#),(#ShadowSizeWithStroke#),(#ShadowSizeWithStroke#),(#ShadowSizeWithStroke# - (#Size# / #Hypersphube#)),(#ShadowSizeWithStroke# - (#Size# / #Hypersphube#)),(#ShadowSizeWithStroke#) | CurveTo (0),(#ShadowRadius#),((#Size# / #Hypersphube#)),(#ShadowSizeWithStroke#),(0),(#ShadowSizeWithStroke# - (#Size# / #Hypersphube#))
