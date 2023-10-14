from gazpacho import Soup
import requests

## web scraping basic
url = "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"
html = requests.get(url)

print(html.text)


#change to nice html form
imdb = Soup(html.text)

title = imdb.find("title")

#find all movies
titles = imdb.find("h3",{"class": "lister-item-header"})
#strip() ลบ elements อื่นๆ
first_title = titles[0].strip()

#clean all movie_titles using loop
clean_titles = []
for title in titles:
  clean_titles.append(title.strip()

#use list comprehension instead of for loop                     
clean_movie = [title.strip() for title in titles]

#find movie rating
ratings = imdb.find("div", {"class":"ratings-imdb-rating"})
clean_ratings = [float(rating.strip()) for rating in ratings]


#create dataframe of title and rating
import pandas as pd

movie_database = pd.DataFrame(data = {
    "title" : clean_titles,
    "rating" : clean_ratings,
})

