# Install and load rvest package

install.packages("rvest");
library("rvest")

# set the URL of the page you want to login
login_url <- "https://the-internet.herokuapp.com/login"

# set the URL of the page you want to access after login
secure_url <- "https://the-internet.herokuapp.com/secure"

#login details
username_text <- "tomsmith"
password_text <- "SuperSecretPassword!"

# Create a session with login URL
pgsession <- session(login_url)

#Get the login form from the login page
pgform <- html_form(pgsession)[[1]]

# fill the login details in the form
filled_form <- html_form_set(pgform,
                          username = username_text,
                          password = password_text,
                          )
# Submit the filled login form
session_submit(pgsession,filled_form, style = "POST")

# Get the required text from the secure page by moving the session to the 
# secure page
# use selector gadget chrome extension to get the html_nodes

text1 <- session_jump_to(pgsession, secure_url) %>% 
  read_html() %>% 
  html_nodes(".subheader") %>% 
  html_text()

# Display the text from the secure page
text1

