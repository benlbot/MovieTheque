package mapper

import (
	"github.com/knakk/sparql"
	"github.com/revel/revel"
  "time"
)

var repos *sparql.Repo

func InitRepos() error {
  var err error
  repos, err = sparql.NewRepo("http://fr.dbpedia.org/sparql",
    //sparql.DigestAuth("dba", "dba"),
    sparql.Timeout(time.Millisecond*15000),
  )
  if err != nil {
    panic("failed to create Repos")
    revel.ERROR.Fatal(err)
  }
  return err
}
  	
func Repos() *sparql.Repo {
	return repos
}