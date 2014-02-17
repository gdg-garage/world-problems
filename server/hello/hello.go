package hello

import (
    "fmt"
    "net/http"
   // "bytes"

    "encoding/json"

    "io/ioutil"

    "appengine"
    "appengine/urlfetch"

    //"appengine/memcache"
)

func init() {
    //http.HandleFunc("/first", LoadFirstProblems)
    //http.HandleFunc("/third", LoadThirdProblems)
    http.HandleFunc("/problems/random", Random)
}

//func handler(w http.ResponseWriter, r *http.Request) {
//    fmt.Fprint(w, "Hello, world problems!")
//}

func Random(w http.ResponseWriter, r *http.Request)  {
firstUrl := "https://spreadsheets.google.com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od6/public/values?alt=json"

    c := appengine.NewContext(r)
   	client := urlfetch.Client(c)
    resp, err := client.Get(firstUrl)
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
        return 
    }

    type Service struct {
   		Feed string `json:"feed"`
	}

/*
	buf := new(bytes.Buffer)
	buf.ReadFrom(resp.Body)
	s := buf.String()
	*/

	//fmt.Fprintf(w, "%s", s)

	data, err := ioutil.ReadAll(resp.Body)

	type map[string]Animal struct {
		version string
		encoding string
	}

	//var animals Animal

	fmt.Fprintf(w,"Now have data: %s \n\n\n\n", data)

	var jsonBlob = []byte(`
		{"version":"1.0","encoding":"UTF-8"}
	`)
	
	var animals Animal
	err = json.Unmarshal(jsonBlob, &animals)
	
	if err != nil {
		fmt.Println("error:", err)
	}
	fmt.Fprintf(w,"%+v", animals)

	/*configs := make(map[string]map[string][]Service, 0)
    err = json.NewDecoder(data).Decode(&configs)
    if err != nil {
        fmt.Println(err)
        //os.Exit(1)
    }*

    /*err := json.Unmarshal([]byte(resp), &coll.FullList)

    if err != nil {
        fmt.Printf("Could not unmarshall %s: %s", resp, err)
    }

    fmt.Printf("Now have data: %#v\n", coll)
*/
    /*
    buf := new(bytes.Buffer)
	buf.ReadFrom(yourReader)
	s := buf.String()

	byt := []byte(s) //`{"num":6.13,"strs":["a","b"]}`)
	var dat map[string]interface{}
	
	

    if err := json.Unmarshal(byt, &dat); err != nil {
        panic(err)
    }
*/
  //  fmt.Fprintf(w, "%s", dat)

	//fmt.Fprintf(w, "%s", resp.Body)
}


/*func LoadFirstProblems(r *http.Request) (string) {
	firstUrl := "https://spreadsheets.google.com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od6/public/values?alt=json"

    c := appengine.NewContext(r)
   	client := urlfetch.Client(c)
    resp, err := client.Get(firstUrl)
    if err != nil {
    //    http.Error(w, err.Error(), http.StatusInternalServerError)
        return ""
    }

    return resp.Body
    //fmt.Fprintf(w, "%s", resp.Body)
}*

/*func LoadThirdProblems(w http.ResponseWriter, r *http.Request) {
	thirdUrl := "https://spreadsheets.google.com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od7/public/values?alt=json"

    c := appengine.NewContext(r)
    client := urlfetch.Client(c)
    resp, err := client.Get(thirdUrl)
    if err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
        return
    }
    fmt.Fprintf(w, "%s", resp.Body)
}*/