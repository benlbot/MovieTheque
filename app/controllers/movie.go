package controllers

import (
	"github.com/revel/revel"
	"seminaireWeb/app/models"
	"strings"
)

type Movie struct{
	App
}

func (c Movie) Show(id string) revel.Result {
	
	var movie models.Movie
	var err error
	movie, err = c.getMovieById(id)
	if err != nil {
		c.Validation.Error("test error")
	}

	movie.Country = strings.Replace(movie.Country, "_", " ", -1)
	movie.Director = strings.Replace(movie.Director, "_", " ", -1)
	movie.Genre = strings.Replace(movie.Genre, "_", " ", -1)
	movie.Starring = strings.Replace(movie.Starring, "_", " ", -1)
	movie.ProducedBy = strings.Replace(movie.ProducedBy, "_", " ", -1)
	stars := strings.Split(movie.Starring, ",")

	return c.Render(movie, stars)
}
