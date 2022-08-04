package main

// import "fmt"
import "os"
import "sync"

// var anagrams = make(map[int]string);
var wg sync.WaitGroup

func main() {
  // var anagrams = make(map[int]string);
  // var grams chan string = make(chan string);

  //go func() {
  //  wg.Wait();
  //  close(grams);
  //}();

  go completeAnagrams("", os.Args[1]);
  wg.Add(1);

  // fmt.Println(anagrams);
  /*for c := range grams {
    // fmt.Println("received");
    addToHM(anagrams, c);
  }*/
  // addToHM(anagrams, grams);
  // fmt.Println(anagrams);
  wg.Wait();
}

func addToHM(hm map[int]string, grams <-chan string) {
  end := len(hm)
  for c := range grams {
    hm[end] = c;
    end += 1;
  }
}

func completeAnagrams(start string, end string) {
  // wg.Add(1);
  if len(start) < 2 {
    defer wg.Done();
    if len(end) >= 1 {
      for i := 1; i < len(end); i++ {
        go completeAnagrams(start + string(end[i-1]), end[0:i-1] + end[i:len(end)]);
        wg.Add(1);
      }
      go completeAnagrams(start + string(end[len(end)-1]), end[0:len(end)-1]);
      wg.Add(1);
      // wg.Done();
      // return;
    } else {
      // addToHM(anagrams, start + end);
      // c <- (start + end);
      // fmt.Println("sent");
      // wg.Done();
      // return;
      // fmt.Println(start + end);
      
    }
  } else {
    if len(start) <= 2 { defer wg.Done(); }
    if len(end) >= 1 {
      for i := 1; i < len(end); i++ {
        completeAnagrams(start + string(end[i-1]), end[0:i-1] + end[i:len(end)]);
      }
      completeAnagrams(start + string(end[len(end)-1]), end[0:len(end)-1]);
      // wg.Done();
      // return;
    } else {
      // addToHM(anagrams, start + end);
      // c <- (start + end);
      // fmt.Println("sent");
      // wg.Done();
      // return;
      // fmt.Println(start + end);
      
    }
  }
}
