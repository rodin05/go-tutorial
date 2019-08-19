package main

import (
	"fmt"
	"os"
)

func main() {
	pills := []Pill{Placebo, Aspirin, Ibuprofen, Paracetamol, Acetaminophen}
	fmt.Println(pills)

	fmt.Println("PORT:", os.Getenv("PORT"))
}
