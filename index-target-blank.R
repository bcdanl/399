system("quarto render")
quarto::quarto_render("index.qmd") # Must close all index.html if it is opened on a web-browser.

library(stringr)

# Read the HTML file
html_as_text <- readLines("index.html", warn = FALSE)
system(paste("rm", shQuote("index.html")))
# Sys.sleep(2)


lec_nos <- c('01')
lec_dates <- c('0126')

for (i in 1:length(lec_nos)){
  lec_no <- lec_nos[i]
  lec_date <- lec_dates[i]
  
  old_content <- str_c('lec-', lec_no, '-2024-', lec_date, '.html"')
  new_content <- str_c(old_content, " ", 'target="_blank"') 
  
  
  html_as_text <- str_replace_all(html_as_text,
                                  old_content,
                                  new_content)
}

writeLines(html_as_text, 
           "index.html")

