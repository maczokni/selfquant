# selfquant

This is a package for getting data from our quantified self template on google sheets, to keep track of your weekly performance in various categories. 
These categories include: 

To get started: 

1 - Download googlesheets package:
- This project uses google sheets, so you will need the [googlesheets](https://github.com/jennybc/googlesheets) package. 

2 - Get authorisation to your sheets:
- To give access to your sheets, you have to (after intalling google sheets) run the following command (from the googlesheets package) in R: 
    - `(my_sheets <- gs_ls())`
- This will open a window where you have to click "Yes" to some permissions. 

Then you can use the functions in this package to get your weekly stats, visualise them in a report/ dashboard/ whatever out output is, and archive your points. 
