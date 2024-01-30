package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/AlejandroJorge/forum-rest-api/config"
	"github.com/AlejandroJorge/forum-rest-api/delivery/router"
)

func main() {
	config.Initialize()

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	fmt.Printf("Listening on http://localhost:%s", os.Getenv("PORT"))
	http.ListenAndServe(fmt.Sprintf(":%s", os.Getenv("PORT")), router.AppRouter())
}
