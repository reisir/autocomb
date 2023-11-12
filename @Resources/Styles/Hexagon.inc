[Variables]
r1=#Radius#
r2=(#r1# / 2)
s3=(Sqrt(3) * #r2#)

sr1=#ShadowRadius#
sr2=(#sr1# / 2)
ss3=(Sqrt(3) * #sr2#)

[Base]
Shape=Path Hexagon | Offset (#RadiusOffset#),(#RadiusOffset#) | StrokeLineJoin #StrokeLineJoin# | Rotate #HexagonRotation# | Extend Stroke, Fill
Hexagon=(#r1#),(0) | LineTo (#r2#),(#s3#) | LineTo (-#r2#),(#s3#) | LineTo (-#r1#),(0) | LineTo (-#r2#),(-#s3#) | LineTo (#r2#),(-#s3#) | ClosePath 1

[Shadow]
Shape=Path Hexagon | Offset (#ShadowRadiusOffset#),(#ShadowRadiusOffset#) | StrokeLineJoin #StrokeLineJoin# | Rotate #HexagonRotation# | Extend Stroke, Fill
Hexagon=(#sr1#),(0) | LineTo (#sr2#),(#ss3#) | LineTo (-#sr2#),(#ss3#) | LineTo (-#sr1#),(0) | LineTo (-#sr2#),(-#ss3#) | LineTo (#sr2#),(-#ss3#) | ClosePath 1
