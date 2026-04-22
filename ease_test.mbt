///|
/// Comprehensive tests for d3-ease easing functions
test "linear easing" {
  // Test boundary values
  assert_eq(linear(0.0), 0.0)
  assert_eq(linear(1.0), 1.0)

  // Test intermediate values
  assert_in_delta(linear(0.1), 0.1)
  assert_in_delta(linear(0.5), 0.5)
  assert_in_delta(linear(0.9), 0.9)
}

///|
test "quadratic easing" {
  // Test quad_in boundary values
  assert_eq(quad_in(0.0), 0.0)
  assert_eq(quad_in(1.0), 1.0)

  // Test quad_in intermediate values
  assert_in_delta(quad_in(0.1), 0.01)
  assert_in_delta(quad_in(0.2), 0.04)
  assert_in_delta(quad_in(0.5), 0.25)
  assert_in_delta(quad_in(0.9), 0.81)

  // Test quad_out boundary values
  assert_eq(quad_out(0.0), 0.0)
  assert_eq(quad_out(1.0), 1.0)

  // Test quad_in_out boundary values
  assert_eq(quad_in_out(0.0), 0.0)
  assert_eq(quad_in_out(1.0), 1.0)
  assert_in_delta(quad_in_out(0.5), 0.5)
}

///|
test "cubic easing" {
  // Test cubic_in boundary values
  assert_eq(cubic_in(0.0), 0.0)
  assert_eq(cubic_in(1.0), 1.0)

  // Test cubic_in intermediate values
  assert_in_delta(cubic_in(0.1), 0.001)
  assert_in_delta(cubic_in(0.5), 0.125)
  assert_in_delta(cubic_in(0.9), 0.729)

  // Test cubic_out boundary values
  assert_eq(cubic_out(0.0), 0.0)
  assert_eq(cubic_out(1.0), 1.0)

  // Test cubic_in_out boundary values
  assert_eq(cubic_in_out(0.0), 0.0)
  assert_eq(cubic_in_out(1.0), 1.0)
}

///|
test "polynomial easing" {
  // Test poly_in with default exponent
  assert_eq(poly_in(0.0), 0.0)
  assert_eq(poly_in(1.0), 1.0)
  assert_in_delta(poly_in(0.5), 0.125) // 0.5^3

  // Test poly_out with default exponent
  assert_eq(poly_out(0.0), 0.0)
  assert_eq(poly_out(1.0), 1.0)

  // Test poly_in_out with default exponent
  assert_eq(poly_in_out(0.0), 0.0)
  assert_eq(poly_in_out(1.0), 1.0)

  // Test custom exponent using optional parameter
  assert_in_delta(poly_in(0.5, exponent=2.0), 0.25) // 0.5^2
}

///|
test "sine easing" {
  // Test sin_in boundary values
  assert_eq(sin_in(0.0), 0.0)
  assert_eq(sin_in(1.0), 1.0)

  // Test sin_out boundary values
  assert_eq(sin_out(0.0), 0.0)
  assert_eq(sin_out(1.0), 1.0)

  // Test sin_in_out boundary values
  assert_eq(sin_in_out(0.0), 0.0)
  assert_eq(sin_in_out(1.0), 1.0)
  assert_in_delta(sin_in_out(0.5), 0.5)
}

///|
test "exponential easing" {
  // Test exp_in boundary values
  assert_eq(exp_in(1.0), 1.0)

  // Test exp_out boundary values
  assert_eq(exp_out(0.0), 0.0)

  // Test exp_in_out boundary values
  assert_eq(exp_in_out(0.0), 0.0)
  assert_eq(exp_in_out(1.0), 1.0)
}

///|
test "circle easing" {
  // Test circle_in boundary values
  assert_eq(circle_in(0.0), 0.0)
  assert_eq(circle_in(1.0), 1.0)

  // Test circle_out boundary values
  assert_eq(circle_out(0.0), 0.0)
  assert_eq(circle_out(1.0), 1.0)

  // Test circle_in_out boundary values
  assert_eq(circle_in_out(0.0), 0.0)
  assert_eq(circle_in_out(1.0), 1.0)
  assert_in_delta(circle_in_out(0.5), 0.5)
}

///|
test "bounce easing" {
  // Test bounce_in boundary values
  assert_eq(bounce_in(0.0), 0.0)
  assert_eq(bounce_in(1.0), 1.0)

  // Test bounce_out boundary values
  assert_eq(bounce_out(0.0), 0.0)
  assert_eq(bounce_out(1.0), 1.0)

  // Test bounce_in_out boundary values
  assert_eq(bounce_in_out(0.0), 0.0)
  assert_eq(bounce_in_out(1.0), 1.0)
}

///|
test "back easing" {
  // Test back_in boundary values
  assert_eq(back_in(0.0), 0.0)
  assert_eq(back_in(1.0), 1.0)

  // Test back_out boundary values
  assert_eq(back_out(0.0), 0.0)
  assert_eq(back_out(1.0), 1.0)

  // Test back_in_out boundary values
  assert_eq(back_in_out(0.0), 0.0)
  assert_eq(back_in_out(1.0), 1.0)

  // Test custom overshoot using optional parameter
  let custom_back_in = back_in(0.5, overshoot=2.0)
  let default_back_in = back_in(0.5)
  // Different overshoot should produce different results
  assert_not_eq(custom_back_in, default_back_in)
}

///|
test "elastic easing" {
  // Test elastic_in boundary values
  assert_eq(elastic_in(0.0), 0.0)
  assert_eq(elastic_in(1.0), 1.0)

  // Test elastic_out boundary values
  assert_eq(elastic_out(0.0), 0.0)
  assert_eq(elastic_out(1.0), 1.0)

  // Test elastic_in_out boundary values
  assert_eq(elastic_in_out(0.0), 0.0)
  assert_eq(elastic_in_out(1.0), 1.0)
}

///|
test "ease function aliases" {
  // Test that aliases point to correct functions
  assert_eq(ease_linear(0.5), linear(0.5))
  assert_eq(ease_quad(0.5), quad_in_out(0.5))
  assert_eq(ease_cubic(0.5), cubic_in_out(0.5))
  assert_eq(ease_bounce(0.5), bounce_out(0.5))
  assert_eq(ease_elastic(0.5), elastic_out(0.5))
}

///|
test "optional parameters" {
  // Test polynomial functions with optional exponent parameter
  assert_eq(poly_in(0.5), poly_in(0.5, exponent=3.0)) // Default exponent
  assert_in_delta(poly_in(0.5, exponent=2.0), 0.25) // Custom exponent
  assert_in_delta(poly_out(0.5, exponent=2.0), 0.75) // Custom exponent

  // Test back functions with optional overshoot parameter
  assert_eq(back_in(0.5), back_in(0.5, overshoot=1.70158)) // Default overshoot
  assert_not_eq(back_in(0.5), back_in(0.5, overshoot=2.0)) // Custom overshoot

  // Test elastic functions with optional amplitude and period parameters
  assert_eq(elastic_in(0.5), elastic_in(0.5, amplitude=1.0, period=0.3)) // Defaults
  assert_not_eq(elastic_in(0.5), elastic_in(0.5, amplitude=2.0)) // Custom amplitude
  assert_not_eq(elastic_in(0.5), elastic_in(0.5, period=0.5)) // Custom period
}
