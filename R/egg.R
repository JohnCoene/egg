#' egg
#'
#' Add an eater egg to your document
#'
#' @param stroke keys that will trigger the egg.
#' @param egg message that will appear.
#' @param imegg image that appears.
#' @param fade in milliseconds.
#' @param timeout timeout animation in milliseconds.
#' @param elementId use to override element id.
#'
#' @details You don't need to know the special Javascript key codes, as you can use
#' plain English to define your egg (but you can use key codes if you want to). i.e.:
#' \code{up} = up arrow on keyboard.
#'
#' @examples
#' \dontrun{
#' egg(c("r", "s", "t", "a", "t", "s"), "MY EASTER EGG APPEARS",
#'   imegg = "https://upload.wikimedia.org/wikipedia/commons/5/54/Bg-easter-eggs.jpg")
#' }
#'
#' @import htmlwidgets
#'
#' @export
egg <- function(stroke, egg = "", imegg, fade = 500, timeout = 5000, elementId = NULL) {

  # forward options using x
  x = list(
    egg = egg,
    stroke = stroke,
    fade = fade
  )

  x$imegg <- if(!missing(imegg)) imegg

  # create widget
  htmlwidgets::createWidget(
    name = 'egg',
    x,
    width = NULL,
    height = NULL,
    package = 'egg',
    elementId = elementId
  )
}

egg_html <- function(id, style, class, ...){
  htmltools::tags$div(id = id, class = class, style = paste("display: none; position: absolute; top:20%; left:50%", style))
}

#' Shiny bindings for egg
#'
#' Output and render functions for using egg within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a egg
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name egg-shiny
#'
#' @export
eggOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'egg', width, height, package = 'egg')
}

#' @rdname egg-shiny
#' @export
renderEgg <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, eggOutput, env, quoted = TRUE)
}
