CompilePost <- function(src,
                        fig.path = "images/",
                        base.url = "{{ site.url }}/",
                        out.path = "")
{
    require(knitr)
    # Set base URL for links
    opts_knit$set(base.url = base.url)
    
    # Set to knit as Jekyll
    opts_knit$set(out.format = 'jekyll')
    
    # Set figure path to store images
    fig.path <- paste0(fig.path, sub(".Rmd$", "", basename(src)), "/")
    opts_chunk$set(fig.path = fig.path)
    
    # Set figure caption
    opts_chunk$set(fig.cap = "center")
    
    
    knit(input,
         output = paste0(out.path, sub(".Rmd$", "", basename(src)), ".md"),
         envir = parent.frame())
}

my_imgur_upload <- function(file) {
  require(knitr)
  return(imgur_upload(file, key="07297ec2f36c88f"))
}

PublishPost <- function(src,
                        out.path = "",
                        base.url = "{{ site.url }}")
{
    require(knitr)
    
    # Set base URL for links
    opts_knit$set(base.url = base.url)
    
    # Set to knit as Jekyll
    opts_knit$set(out.format = 'jekyll')
    
    # Set images to load from imgur
    opts_knit$set(upload.fun = my_imgur_upload)
    
    # Set figure caption
    opts_chunk$set(fig.cap = "center")
    
    knit(input,
         output = paste0(out.path, sub(".Rmd$", "",basename(input)), ".md"),
         envir = parent.frame())
}