import Data.Foldable (for_)
import System.Environment

rm_elm elm [] acc = reverse acc
rm_elm elm list acc = if elm == (head list) then
                        (reverse acc) ++ (tail list) else
                        (rm_elm elm (tail list) ((head list) : acc))

completeAnagrams start [] = return ()
completeAnagrams start ending = for_ ending (\x -> completeAnagrams (x : start) (rm_elm x ending []))

main = do
    args <- getArgs
    let ending = args !! 0
    completeAnagrams [] ending

