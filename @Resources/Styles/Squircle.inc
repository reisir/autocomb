[Base]
Shape=Path Squirc | Offset (#StrokeWidth# / 2),(#StrokeWidth# / 2) | Extend Stroke,Fill
Squirc=0,(#Size# / 2) | CurveTo (#Size# / 2),0,0,(#Size# / #Hypersphube#),(#Size# / #Hypersphube#),0 | CurveTo #Size#,(#Size# / 2),(#Size# - (#Size# / #Hypersphube#)),0,(#Size#),(#Size# / #Hypersphube#)
Shape2=Path Squirc | Offset (#StrokeWidth# / 2),(#StrokeWidth# / 2 + #Size# / 2) | Rotate 180 | Extend Stroke
Shape3=Combine Shape | Union Shape 2 | Scale ((#Size# - #StrokeWidth#)/#Size#), ((#Size# - #StrokeWidth#)/#Size#),0,0
Stroke=StrokeWidth #StrokeWidth# | Stroke Color #StrokeColor#
Fill=Fill Color #BackgroundColor#
