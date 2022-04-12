test_that("logLik function works", {
  expect_equal(logLik(c(1,2,3,4), lambda = 2), -20.59443)
})
