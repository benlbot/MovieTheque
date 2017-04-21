package controllers

import (
	"github.com/revel/revel"
	"seminaireWeb/app/models"
	"seminaireWeb/app/mapper"
	"github.com/mmcdole/gofeed"
	"log"
	"strconv"
	"strings"
	"time"
	"regexp"
)

var (
	isGrRunning bool = false
	lastUpdate = time.Now()
)

type App struct {
	*revel.Controller
}

func(c App) getMovieByName(movieName string) (models.Movies, error ){
	query := mapper.Movie()
	
	movieName = "%"+movieName+"%"

	var movies models.Movies
	var err error

	err = query.Where("name LIKE ?", movieName).Find(&movies).Error
	
	return movies, err
}


func(c App) getMovieById(id string) (models.Movie, error){
	query := mapper.Movie()

	var movie models.Movie
	var err error
	err = query.First(&movie, "idmovies = ?", id).Error
	
	return movie, err
}

func(c App) getMovieByGenre(name string) (models.Movies, error){
	query := mapper.Movie()

	name = "%"+name+"%"

	var movies models.Movies
	var err error
	err = query.Where("genre like ?", name).Find(&movies).Error

	return movies, err
}

func(c App) refreshMovies() {
	if !isGrRunning {
		if time.Since(lastUpdate).Hours() > 168 {
			go c.refresh()
		}
	}
}

func(c App) refresh() {
	isGrRunning = true;
	// Combien de film ?
	count, err := mapper.Repos().Query(
		`SELECT COUNT( DISTINCT ?film_title)
		WHERE {
			?film_title rdf:type <http://dbpedia.org/ontology/Film> 
			}`)
	if err != nil {
		log.Fatal(err)
	}
	number, _ := strconv.Atoi(count.Results.Bindings[0]["callret-0"].Value)

	if(number > 0){
		query := mapper.Movie()

		query.Exec("TRUNCATE TABLE `movies`")
		query.Exec("ALTER TABLE `movies` AUTO_INCREMENT = 1")
		i := 0
		for { // parcour par block de 1000 tous les films
			res, err := mapper.Repos().Query(
				`SELECT DISTINCT ?film_title
				WHERE {
					?film_title rdf:type <http://dbpedia.org/ontology/Film> 
					} LIMIT 1000 OFFSET `+ strconv.Itoa(i))
			if err != nil {
				log.Fatal(err)
			}

			films := res.Results.Bindings
			
			for j := 0; j < 1000; j++ {
				film_name := films[j]["film_title"].Value
				movie, err := mapper.Repos().Query(`
					PREFIX dbo:<http://dbpedia.org/ontology/>
					PREFIX prop:<http://fr.dbpedia.org/property/>

					SELECT DISTINCT * WHERE {
						<`+film_name+`> rdfs:label ?name .
						OPTIONAL { <`+film_name+`> dbo:abstract ?abstract} .
						OPTIONAL { <`+film_name+`> dbo:director ?director } .
						OPTIONAL { <`+film_name+`> dbo:filmRuntime ?filmRuntime } .
						OPTIONAL { <`+film_name+`> dbo:thumbnail ?thumbnail } .
						OPTIONAL { <`+film_name+`> dbo:idAllocine ?idAllocine } .
						OPTIONAL { <`+film_name+`> prop:annéeDeSortie ?sortie }.
						FILTER(LANG(?name) = "" || LANGMATCHES(LANG(?name), "fr"))
						FILTER(LANG(?abstract ) = "" || LANGMATCHES(LANG(?abstract ), "fr"))
						} LIMIT 1
						`)
				if err != nil {
					log.Fatal(err)
				}

				infos := movie.Results.Bindings[0]
								
				country := c.queryByName(film_name, "country")
				genre := c.queryByName(film_name, "genre")
				producedBy := c.queryByName(film_name, "producedBy")
				starring := c.queryByName(film_name, "starring")

				tx := query.Begin()
				if err := tx.Create(&models.Movie{
					Name: infos["name"].Value, 
					Abstract: infos["abstract"].Value,
					Country: country,
					Director: strings.Split(infos["director"].Value, "/")[len(strings.Split(infos["director"].Value, "/"))-1], 
					FilmRuntime: infos["filmRuntime"].Value,
					Genre: genre,
					Starring: starring, 
					Thumbnail: infos["thumbnail"].Value,
					ProducedBy: producedBy, 
					IdAllocine: infos["idAllocine"].Value, 
					Sortie: infos["sortie"].Value}).Error; err != nil {
					tx.Rollback()
					log.Fatal(err)
				}
				tx.Commit()
			}
			if i > number { break }
			i = i+1000;
		}
	}
	log.Println("Database updated.")
	isGrRunning = false
}

func(c App) queryByName(film_name string, d string) string{

	movie, err := mapper.Repos().Query(`
		PREFIX dbo:<http://dbpedia.org/ontology/>
		PREFIX prop:<http://fr.dbpedia.org/property/>

		SELECT DISTINCT ?`+d+` WHERE {
			<`+film_name+`> rdfs:label ?name .
			OPTIONAL { <`+film_name+`> dbo:`+d+` ?`+d+` } .
			FILTER(LANG(?name) = "" || LANGMATCHES(LANG(?name), "fr"))
		}
		`)
	if err != nil {
		log.Fatal(err)
	}
	result := ""
	if movie != nil {
		for j := 0; j < len(movie.Results.Bindings); j++ {
			temp := movie.Results.Bindings[j][d].Value
			split := strings.Split(temp, "/")[len(strings.Split(temp, "/"))-1]
			if result == "" {
				result = result + "," + split /////////// VALEUR
			} else {
				result = split /////////// VALEUR
			}
		}
	}
	return result
}

func(c App) allocineFeed() models.MovieFeeds{
	fp := gofeed.NewParser()
	feed, _ := fp.ParseURL("http://rss.allocine.fr/ac/cine/topfilms?format=xml")
	r, _ := regexp.Compile("/video/player_gen_cmedia=(?:[0-9]+)") // Find url
	x, _ := regexp.Compile("[0-9]+")
	
	var results models.MovieFeeds
	for i:= 0; i < len(feed.Items); i++ {
		temp := feed.Items[i]
		id := r.FindString(temp.Description)
		results = append(results, &models.MovieFeed{Title: temp.Title, IdBA: x.FindString(id), UrlImage: temp.Enclosures[0].URL})
	}
	return results
}