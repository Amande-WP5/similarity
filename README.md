# similarity
Compute a similarity score between arguments using cortical.io's API.

##Requirements
1. [Ruby](https://www.ruby-lang.org) of course
2. An API key from cortical (you can ask me for one)
3. Debate files in the APXD format (see @Amande-WP5/arguman-scraper for some).

##Installation
1. Install [bundler](http://bundler.io/): ```gem install bundler```
2. Clone the repository: ```git clone https://github.com/Amande-WP5/similarity.git && cd similarity```
3. Install the required gems: ```bundle install```
4. Change the API key in [this file](lib/similarity.rb)
5. Check the man: ```bin/similarity help```

##Available commands
###cosine

Compute the cosine similarity between all possible pairs of arguments and write it in-place, in the APXD debate file.

##Contribution
Feel free to contribute using pull-requests and fill issue tickets.
