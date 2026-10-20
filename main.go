package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	greeting := os.Getenv("GREETING")

	if greeting == "" {
		greeting = "Hello from service A!"
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, greeting)
	})
	http.ListenAndServe(":8080", nil)
}
