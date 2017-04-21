package controllers

import (
	"github.com/revel/revel"
	"seminaireWeb/app/models"
)

type Index struct{
	App
}

func (c Index) Index() revel.Result {
	var feeds models.MovieFeeds

	feeds = c.allocineFeed()
	c.refreshMovies()

	return c.Render(feeds)
}