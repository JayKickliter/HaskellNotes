module People (main) where

newtype Age     = Age Float
newtype Weight  = Weight Float
    deriving Show
newtype Address = Address String

data Person = Adult Age Weight Address
            | Child Age Weight Person

charlie, victoria, john :: Person
charlie  = Adult (Age 50) (Weight 150) (Address "Happy St.")
victoria = Adult (Age 52) (Weight 150) (Address "Happy St.")
john     = Child (Age 10) (Weight 90) charlie

getWeight :: Person -> Weight
getWeight (Adult _ w _) = w
getWeight (Child _ w _) = w

main = print(getWeight charlie, getWeight john, getWeight victoria)