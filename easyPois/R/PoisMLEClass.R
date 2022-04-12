setClass(
  Class = PoisMLE,
  representation = representation(
    y = "numeric",
    MLE = "numeric",
    LL = "numeric",
    SE = "numeric",
    SEtype = "character"
  ),
  prototype = prototype(
    y = NA,
    MLE = NA,
    LL = NA,
    SE = NA,
    SEtype = "basic"

  )
)
