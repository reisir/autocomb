[Base]
Shape=Path Hexagon | Offset (#RadiusOffset#),(#RadiusOffset#) | StrokeLineJoin #StrokeLineJoin# | Rotate #HexagonRotation# | Extend Stroke, Fill
Hexagon=(#Radius#),(0) | LineTo (#Radius#/2),((Sqrt(3) * #Radius#) / 2) | LineTo (#Radius#/-2), ((Sqrt(3) * #Radius#) / 2) | LineTo (#Radius#/-1),(0) | LineTo (#Radius#/-2),((Sqrt(3) * #Radius#) / -2) | LineTo (#Radius#/2),((Sqrt(3) * #Radius#) / -2) | ClosePath 1
Stroke=StrokeWidth #StrokeWidth# | Stroke Color #StrokeColor#
Fill=Fill Color #BackgroundColor#
