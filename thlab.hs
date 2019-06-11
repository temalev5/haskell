ft = ["DOG","CAT","FOX"]
sec = ["RET","GET","PUT","OUT","IN"]
th = ["MOV","ADD","MUL","DEV"]
concathead x y z = head x: head y: head z:[]
concatelemen x y z = x !! 2: y !! 3: z !! 2:[]
discremenant a b c = (b*b)-(4*a*c)