(import [bs4 [BeautifulSoup :as bs]]
        [os [isdir exists]]
        requests
        bs4)

(defn download [url]
  "pull down document at url"
  (let [page (.get requests url)]
    (if (= page.response_code 200)
        page.text
        nil)))

(defn min [string &optional end]
  "simple string utility"
  (+ (.replace string " " "") (str end)))

(defn get-content [itm attr]
  (let [url (.find-all bs itm "enclosure")]
    (if (= (type url) bs4.element.ResultSet)
        (get url attr)
        None)))

(defn exists? [podcast-dir item]
  (let [episode (min (.find-all bs item "title"))
        url (get-content item "url")
        ]    

(defn check-dirs [items]
  "parse xml and return a list of urls to download"
  (let [newlist []]
    (for [item items]
      (if (exists? item)
          (assoc newlist  (check-dir item)))

    (if (os.isdir )))

(defn parse [page]
  "parse page to return list of items"
  (let [data (bs page "xml")
        text "item"]
    (->
      (.find-all bs data text))

(let [podcasts ["http://tinymeatgang.libsyn.com/rssfeed"
                "http://rss.art19.com/startalk-radio"
                "http://wakingup.libsyn.com/rss"]]
  (for [i podcasts]
    (-> 
      i
      (download)
      (parse-page)
      (check-dirs)
      (download))))

