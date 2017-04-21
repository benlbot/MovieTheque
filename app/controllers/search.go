package controllers

import (
	"github.com/revel/revel"
)

type Search struct{
	App
}

func (c Search) SearchByName(search string) revel.Result {
	//c.refreshMovieByName(search)

	movies, err := c.getMovieByName(search)
	if err != nil {
		c.Validation.Error("test error")
		return nil
	}

	if(len(movies) == 1) {
		return c.Redirect("/Informations/%d", movies[0].ID)
	} else {
		return c.Render(movies)
	}	
}