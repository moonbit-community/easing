///| Main easing library - exports all easing functions with d3-ease-compatible names

///|
/// Linear easing function
pub let ease_linear : (Double) -> Double = linear

///|
/// Quadratic easing functions
pub let ease_quad : (Double) -> Double = quad_in_out

///|
pub let ease_quad_in : (Double) -> Double = quad_in

///|
pub let ease_quad_out : (Double) -> Double = quad_out

///|
pub let ease_quad_in_out : (Double) -> Double = quad_in_out

///|
/// Cubic easing functions
pub let ease_cubic : (Double) -> Double = cubic_in_out

///|
pub let ease_cubic_in : (Double) -> Double = cubic_in

///|
pub let ease_cubic_out : (Double) -> Double = cubic_out

///|
pub let ease_cubic_in_out : (Double) -> Double = cubic_in_out

///|
/// Polynomial easing functions (using default exponent)
pub let ease_poly : (Double) -> Double = fn(t) { poly_in_out(t) }

///|
pub let ease_poly_in : (Double) -> Double = fn(t) { poly_in(t) }

///|
pub let ease_poly_out : (Double) -> Double = fn(t) { poly_out(t) }

///|
pub let ease_poly_in_out : (Double) -> Double = fn(t) { poly_in_out(t) }

///|
/// Sine easing functions
pub let ease_sin : (Double) -> Double = sin_in_out

///|
pub let ease_sin_in : (Double) -> Double = sin_in

///|
pub let ease_sin_out : (Double) -> Double = sin_out

///|
pub let ease_sin_in_out : (Double) -> Double = sin_in_out

///|
/// Exponential easing functions
pub let ease_exp : (Double) -> Double = exp_in_out

///|
pub let ease_exp_in : (Double) -> Double = exp_in

///|
pub let ease_exp_out : (Double) -> Double = exp_out

///|
pub let ease_exp_in_out : (Double) -> Double = exp_in_out

///|
/// Circle easing functions
pub let ease_circle : (Double) -> Double = circle_in_out

///|
pub let ease_circle_in : (Double) -> Double = circle_in

///|
pub let ease_circle_out : (Double) -> Double = circle_out

///|
pub let ease_circle_in_out : (Double) -> Double = circle_in_out

///|
/// Bounce easing functions
pub let ease_bounce : (Double) -> Double = bounce_out

///|
pub let ease_bounce_in : (Double) -> Double = bounce_in

///|
pub let ease_bounce_out : (Double) -> Double = bounce_out

///|
pub let ease_bounce_in_out : (Double) -> Double = bounce_in_out

///|
/// Back easing functions (using default overshoot)
pub let ease_back : (Double) -> Double = fn(t) { back_in_out(t) }

///|
pub let ease_back_in : (Double) -> Double = fn(t) { back_in(t) }

///|
pub let ease_back_out : (Double) -> Double = fn(t) { back_out(t) }

///|
pub let ease_back_in_out : (Double) -> Double = fn(t) { back_in_out(t) }

///|
/// Elastic easing functions (using default amplitude and period)
pub let ease_elastic : (Double) -> Double = fn(t) { elastic_out(t) }

///|
pub let ease_elastic_in : (Double) -> Double = fn(t) { elastic_in(t) }

///|
pub let ease_elastic_out : (Double) -> Double = fn(t) { elastic_out(t) }

///|
pub let ease_elastic_in_out : (Double) -> Double = fn(t) { elastic_in_out(t) }
