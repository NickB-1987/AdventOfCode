use std::{fs, path};

pub mod elves;

fn main() {
    let file = fs::read_to_string(path::Path::new("./input/Elf_Calories.txt"))
        .expect("text input file should exist");

    let (_, expedition) = elves::Expedition::parse(&file).unwrap();

    // Summary information
    println!(
        "Expedition Size: {s}, carrying a total of {e} calories",
        s = expedition.size(),
        e = expedition.energy()
    );

    // Find the Elf carrying the most Calories
    let most_calories = expedition
        .elves
        .iter()
        .map(|e| e.energy())
        .max()
        .unwrap_or(0);
    println!(
        "{} is the most Calories carried by any single Elf",
        most_calories
    );
}
