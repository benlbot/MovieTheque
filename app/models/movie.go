package models

type (
	Movie struct {
		ID				int32		`json:"id" gorm:"column:idmovies;primary_key"`
		Name			string		`json:"name"`
		Abstract		string		`json:"abstract"`
		Country			string		`json:"country"`
		Director		string		`json:"director"`
		FilmRuntime 	string		`json:"film_runtime" gorm:"column:filmRuntime"`
		Genre			string		`json:"genre" gorm:"column:genre"`
		ProducedBy		string		`json:"produced_by" gorm:"column:producedBy"`
		Starring		string		`json:"starring"`
		Thumbnail		string		`json:"thumbnail"`
		IdAllocine		string		`json:"id_allocine" gorm:"column:idAllocine"`
		IdVoAllocine	string		`json:"id_vo_allocine" gorm:"column:idVoAllocine"`
		Sortie			string		`json:"sortie"`
	}

	Movies []*Movie

	MovieFeed struct {
		Title			string		`json:"title"`
		IdBA			string		`json:"idBA"`
		UrlImage		string		`json:"urlImage"`
	}

	MovieFeeds []*MovieFeed
)
