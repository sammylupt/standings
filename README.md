**Standings** is a command line gem which allows you to view European soccer/football standings from your terminal.

There is currently support for the English Premier League, English Championship, Scottish Premier League, La Liga, Ligue 1, Serie A, and Bundesliga.

To install:

```
$ gem install standings
```

To use, type ```standings``` from your command line, followed by a flag representing a league, e.g.:

```
$ standings -e
$ standings --epl
```

For a full list of league flags run `$ standings -h`

### Programmatic use

You may want to consume these results in your own applications. To do so, initialize a new `Standings::TableFetcher` instance by passing in a symbol argument representing the league you wish to see results for. A list of the symbols is available in `Standings::LeagueReference`

```ruby
results = Standings::TableFetcher.new(:epl).call
```

If successful, this call will return a `Standings::LeagueResults` instance with two methods:
  * #league, equal to the initial argument passed to the `Standings::TableFetcher` instance
  * #results, an array of `Standings::TableFetcher::Team` structs, sorted such that the first place team is in the 0 index of the array

If this call is unsuccessful, the method will throw either a `Standings::TableFetcher::FetchError` or `Standings::TableFetcher::ParseError`.

Code by [Scott Luptowski](http://www.twitter.com/scottluptowski, "Scott Luptowski") and released under MIT to the extent it is possible. I claim no ownership of any of the league data represented.
