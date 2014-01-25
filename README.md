# lita-google-ranking

[![Build Status](https://travis-ci.org/marsz/lita-google-ranking.png?branch=master)](https://travis-ci.org/marsz/lita-google-ranking)

Lita (robot) handler for getting rank of DOMAIN on google web search with a KEYWORD.

## Installation

Add lita-google-ranking to your Lita instance's Gemfile:

``` ruby
gem "lita-google-ranking"
```

## Configuration

in `lita_config.rb`

```
config.google_ranking.gl = "tw"
config.google_ranking.lr = "lang_zh"
config.google_ranking.cr = "countryTW"
```

- `gl` : http://en.wikipedia.org/wiki/ISO_3166-1#Current_codes
- `lr` : https://developers.google.com/custom-search/docs/xml_results?hl=en&csw=1#languageCollections
- `cr` : https://developers.google.com/custom-search/docs/xml_results?hl=en&csw=1#countryCollections

## Usage

`lita gr DOMAIN KEYWORD` : send KEYWORD to google web search, and return rank of DOMAIN from search results

```
"KEYWORD" ranking of DOMAIN is 3
```

## License

[MIT](http://opensource.org/licenses/MIT)
