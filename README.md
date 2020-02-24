
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BARIS <a><img src='man/figures/hex.png' align="right" height="200" /></a>

<!-- badges: start -->

<!-- badges: end -->

With **BARIS** you can exploit the [French official data
portal](https://www.data.gouv.fr/fr/) API directly from R. The package
offers several capabilities, from listing the available datasets to
extracting the needed resources. Nevertheless, there are many
functionalities offered by the API (e.g. uploading a dataset, removing a
resource … among others) that are not covered within the **BARIS**
package which instead focus on the data analysis aspect of the API. The
good news is that the user doesn’t need an API key or any credential to
run the available functions provided by **BARIS**. Finally, in order to
fully apprehend the package, a distinction has to be made. The data.gouv
API provides several **datasets which contain one or many dataframes.**
The unique identifier (ID) of a dataset has this form :
**53699934a3a729239d2051a1** while the ID of an individual dataframe or
resource has this form: **59ea7bba-f38a-4d75-b85f-2d1955050e53**.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("feddelegrand7/BARIS")
```

## BARIS\_home()

Using the function `BARIS_home()` you can list the displayed datasets
within the [home page of the data.gouv
website](https://www.data.gouv.fr/fr/). The function doesn’t take any
argument. It will return a dataframe with many useful information about
the dataset.

``` r
library(BARIS)

BARIS_home()
#> # A tibble: 9 x 13
#>   id    title organization page  views frequency temporal_cov_st~
#>   <chr> <chr> <chr>        <chr> <chr> <chr>     <chr>           
#> 1 5de8~ Fich~ Institut Na~ http~ 7     unknown   2019-12-31      
#> 2 5e00~ "Con~ Ministère d~ http~ 0     unknown   2019-12-08      
#> 3 5b98~ "Don~ Laboratoire~ http~ 0     hourly    <NA>            
#> 4 5c5a~ Résu~ Ministère d~ http~ 0     monthly   2019-06-30      
#> 5 5c4a~ Dema~ Ministère d~ http~ 23    semiannu~ 2019-06-30      
#> 6 5cc1~ Dema~ Etalab       http~ 14    semiannu~ 2019-06-30      
#> 7 5cd5~ Fich~ Etalab       http~ 2     daily     2024-10-01      
#> 8 5369~ Déco~ OpenStreetM~ http~ 27    annual    <NA>            
#> 9 5c34~ Répe~ Ministère d~ http~ 10    quarterly <NA>            
#> # ... with 6 more variables: temporal_cov_end <chr>, created_at <chr>,
#> #   last_modified <chr>, last_update <chr>, archived <chr>, deleted <chr>
```

The data is quite condensated so you should use the `View()` or
`DT::datatable()` functions.

## BARIS\_search()

The `BARIS_search()` function allows you to search for a specific
dataset. Suppose we’re curious about the city of Marseille.

``` r

BARIS_search(query = "Marseille", n_pages = 20)
#> # A tibble: 20 x 11
#>    id    title organization page  views frequency created_at last_modified
#>    <chr> <chr> <chr>        <chr> <chr> <chr>     <chr>      <chr>        
#>  1 5369~ Traf~ Ministère d~ http~ 3     annual    2013-07-0~ 2016-03-04T0~
#>  2 5369~ Déco~ OpenStreetM~ http~ 1     annual    2013-11-1~ 2020-01-02T1~
#>  3 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2012-12-0~ 2019-05-09T0~
#>  4 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2015-07-1~ 2019-05-09T0~
#>  5 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2017-07-2~ 2019-05-09T0~
#>  6 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2012-12-0~ 2019-05-09T0~
#>  7 5dd7~ Quar~ Datactivist  http~ <NA>  unknown   2019-11-2~ 2019-11-22T1~
#>  8 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2012-12-2~ 2019-11-15T0~
#>  9 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2013-10-2~ 2019-05-09T0~
#> 10 5878~ Arro~ NosDonnées.~ http~ <NA>  unknown   2014-03-0~ 2017-07-10T0~
#> 11 5878~ Quar~ NosDonnées.~ http~ <NA>  unknown   2016-03-3~ 2017-07-10T0~
#> 12 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2011-06-1~ 2019-05-09T0~
#> 13 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2012-12-0~ 2019-05-09T0~
#> 14 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2012-12-0~ 2018-08-22T0~
#> 15 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2011-06-1~ 2019-05-09T0~
#> 16 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2012-11-2~ 2019-05-09T0~
#> 17 5369~ Arro~ NosDonnées.~ http~ 4     unknown   2014-03-2~ 2015-12-06T1~
#> 18 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2015-04-0~ 2019-05-09T0~
#> 19 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2018-08-2~ 2019-09-18T0~
#> 20 5ceb~ Mars~ Ville de Ma~ http~ <NA>  unknown   2013-04-1~ 2019-05-09T0~
#> # ... with 3 more variables: last_update <chr>, archived <chr>,
#> #   deleted <chr>
```

The **n\_page** argument is used to specify the number of pages to
search for according to the pagination system of the API, by default its
value is equal to 20. Now, in order to choose a dataset, let’s have a
look at two columns, the ID and the title of each dataset.

``` r

Marseille_data <- BARIS_search(query = "Marseille", n_pages = 20)

Marseille_data[, c("id", "title")]
#> # A tibble: 20 x 2
#>    id                    title                                             
#>    <chr>                 <chr>                                             
#>  1 5369a248a3a729239d20~ Trafic aéroport Marseille-Provence : passagers et~
#>  2 53699233a3a729239d20~ Découpage administratif communal français issu d'~
#>  3 5cebfa8506e3e77ffdb3~ Marseille - Cimetières                            
#>  4 5cebfa8706e3e77c78b3~ Marseille - Crèches                               
#>  5 5cebfa869ce2e764aac3~ Marseille - Subventions                           
#>  6 5cebfa839ce2e76116c3~ Marseille - Élus                                  
#>  7 5dd7a9a78b4c41277a7f~ Quartiers de Marseille                            
#>  8 5cebfa869ce2e76116c3~ Marseille - Délibérations                         
#>  9 5cebfa8306e3e77ffdb3~ Marseille - Monuments historiques                 
#> 10 5878ee29a3a7291485ca~ Arrondissements de Marseille                      
#> 11 5878ee75a3a7291484ca~ Quartiers de Marseille                            
#> 12 5cebfa849ce2e764aac3~ Marseille - Écoles maternelles                    
#> 13 5cebfa869ce2e76116c3~ Marseille - Équipements sociaux                   
#> 14 5cebfa869ce2e764aac3~ Marseille - Lieux culturels                       
#> 15 5cebfa8306e3e77c78b3~ Marseille - Écoles élémentaires                   
#> 16 5cebfa839ce2e76116c3~ Marseille - Wifi public                           
#> 17 53698f14a3a729239d20~ Arrondissements de Marseille                      
#> 18 5cebfa8706e3e77ffdb3~ Marseille - Elections départementales             
#> 19 5cebfa8206e3e77c78b3~ Marseille - Programme Opéra Odéon                 
#> 20 5cebfa8706e3e77c78b3~ Marseille - Parcours culturels
```

Suppose we’re interested in the dataset entitled **Marseille - Monuments
historiques** with its corresponding ID: **5cebfa8306e3e77ffdb31ef5**
and we want to know more about this data. In this case, the
`BARIS_explain()` function can be useful.

## BARIS\_explain()

`BARIS_explain()` returns a description of a dataset. It has one
argument which is the ID of the dataset of interest.

``` r

BARIS_explain("5cebfa8306e3e77ffdb31ef5")
#> [1] "Monuments historiques situés sur le territoire de Marseille, avec adresse, numéro de base Mérimée (base de données du Ministère de la Culture recensant les monuments historiques de toute la France) et points de géolocalisation"
```

The description is in French but even non-French speakers can use this
function in conjunction with a translation tool, for the example the
[googleLanguageR
package](https://cran.r-project.org/package=googleLanguageR).

## BARIS\_resources()

As mentioned previously, each dataset contains one or several dataframes
or as the API call them **resources**. The `BARIS_resources()` function
allows you to list all the available resources within a determined
dataset.

``` r

BARIS_resources("5cebfa8306e3e77ffdb31ef5") # The "Marseille - Monuments historiques" ID
#> # A tibble: 2 x 6
#>   id        title      format published    url           description       
#>   <chr>     <chr>      <chr>  <chr>        <chr>         <chr>             
#> 1 59ea7bba~ MARSEILLE~ csv    2019-05-27T~ https://trou~ Monuments histori~
#> 2 6328f8b3~ Plan des ~ pdf    2019-05-27T~ https://trou~ Edition Janvier 2~
```

Many useful information related to the resource are provided: The id,
the title, the format, the date of publication, the url of the resource,
and a description.

## BARIS\_extract()

The `BARIS_extract()` function allows you to extract the needed resource
into your R session. You have to specify the id of the resource and its
format. Currently, “only” theses formats are supported: json, csv, xls,
xlsx, xml, geojson and shp, nevertheless you can always rely on the url
of the resource to download whatever you need.

As an example, let us extract the above listed csv file:
*MARSEILLE\_MONUMENTS\_HISTORIQUES\_2018.csv*:

``` r

BARIS_extract(resourceId = "59ea7bba-f38a-4d75-b85f-2d1955050e53", format = "csv")
#> # A tibble: 80 x 10
#>    n_base_merimee date_de_protect~ denomination adresse code_postal
#>    <chr>          <chr>            <chr>        <chr>         <int>
#>  1 PA00081336     Classement : li~ Ancienne ég~ /             13002
#>  2 PA00081340     Classement: 13/~ Eglise Sain~ Esplan~       13002
#>  3 PA00081331     Classement: 29/~ Chapelle et~ 2, Rue~       13002
#>  4 PA00081344     Classement: 16/~ Fort Saint-~ ""            13002
#>  5 PA00081325     Inscription : 2~ Les deux bâ~ Quai d~       13002
#>  6 PA00081334     Inscription : 0~ Clocher des~ Montée~       13002
#>  7 PA00081348     Classement: 12/~ Hôtel Davie~ Place ~       13002
#>  8 PA00081363     Classement: 02/~ Maison dite~ 27, Gr~       13002
#>  9 PA00081349     Inscription : 1~ Hôtel-Dieu-~ 6, Pla~       13002
#> 10 PA00081354     Classement: 30/~ Hôtel de Vi~ Quai d~       13002
#> # ... with 70 more rows, and 5 more variables:
#> #   proprietaire_du_monument <chr>, epoque_de_construction <chr>,
#> #   date_de_construction <chr>, longitude <dbl>, latitude <dbl>
```

Finally, I appreciate any feedback, feel free to reach out at
[moh\_fodil](https://twitter.com/moh_fodil) or open an issue on
[Github](https://github.com/feddelegrand7/BARIS/issues).