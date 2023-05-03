use std::cell::RefCell;
use std::rc::Rc;

fn main() {
    //let anagrams: Rc<RefCell<Vec<String>>> = Rc::new(RefCell::new(Vec::new()));
    //println!("word");
    let letters: Vec<String> = std::env::args().collect();
    completeAnagrams(&String::from(""), &letters.get(1).unwrap());
    // Rc::clone(&anagrams),
    // );
    //for i in 0..anagrams.borrow().len() {
    //	println!("{}", anagrams.borrow().get(i).unwrap());
    //}
}

fn completeAnagrams(start: &String, end: &String) {
    if end.len() >= 1 {
        let mut i = 1;
        while i <= end.len() - 1 {
            let front: String = String::from(start) + &end[i - 1..i];
            //println!("front: {}", front);
            let back: String = String::from(&end[0..i - 1]) + &end[i..end.len()];
            //println!("back: {}", back);
            //println!("len: {}", end.len());
            completeAnagrams(&front, &back);
            i += 1;
        }
        let front: String = String::from(start) + &end[end.len() - 1..end.len()];
        let back: String = String::from(&end[0..end.len() - 1]);
        completeAnagrams(&front, &back);
    } else {
        //arr.push(format!("{}{}", start, end));
//        println!("{}{}", start, end);
    }
}
