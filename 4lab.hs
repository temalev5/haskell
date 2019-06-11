
perevod x y z = x*(10**(first y - first z))
first :: String -> Double
first "sm" = 1
first "dm" = 2
first "m" = 3
first "km" = 6
first "g" = 1
first "kg" = 4
first "t" = 7