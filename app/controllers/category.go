package controllers

import (
	"github.com/revel/revel"
)

type Category struct{
	App
}

func (c Category) List(name string) revel.Result {

    movies, err := c.getMovieByGenre(name)
    if err != nil {
        c.Validation.Error("test error")
        return nil
    }

    return c.Render(movies)
}
