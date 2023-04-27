package anagramsp

import "fmt"
import "os"

// var anagrams = make(map[int]string);

func main() {
	// anagrams := make(map[int]string);
	completeAnagrams("", os.Args[1])
	// fmt.Println(anagrams);
}

func addToHM(hm map[int]string, val string) {
	end := len(hm)
	hm[end] = val
}

func completeAnagrams(start string, end string) {
	if len(end) >= 1 {
		for i := 1; i < len(end); i++ {
			completeAnagrams(start+string(end[i-1]), end[0:i-1]+end[i:len(end)])
		}
		completeAnagrams(start+string(end[len(end)-1]), end[0:len(end)-1])
	} else {
		// addToHM(anagrams, start + end);
		fmt.Println(start + end)
	}
}
