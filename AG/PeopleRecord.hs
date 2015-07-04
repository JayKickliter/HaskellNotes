module PeopleRecord (main) where

newtype Age     = Age Float
    deriving Show
newtype Weight  = Weight Float
    deriving Show
newtype Address = Address String
    deriving Show

data Person = Adult {
    age :: Age,
    weight :: Weight,
    address :: Address
} | Child {
    age :: Age,
    weight :: Weight,
    parent :: Person
}

charlie, victoria, john :: Person
charlie  = Adult (Age 50) (Weight 150) (Address "Happy St.")
victoria = Adult (Age 52) (Weight 150) (Address "Happy St.")
john     = Child (Age 10) (Weight 90) charlie

location :: Person -> Address
location Adult{address = addr} = addr
location Child{parent = adult} = location adult


main = print(location charlie, location john, location victoria)
