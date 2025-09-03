///| Polynomial easing functions with configurable exponent

///|
/// Default exponent for polynomial easing functions
let default_exponent : Double = 3.0

///|
/// Polynomial ease-in function with configurable exponent
/// @param t: time parameter (0.0 to 1.0)
/// @param exponent: the exponent for the polynomial (default: 3.0)
pub fn poly_in(t : Double, exponent~ : Double = default_exponent) -> Double {
  @math.pow(t, exponent)
}

///|
/// Polynomial ease-out function with configurable exponent
/// @param t: time parameter (0.0 to 1.0)
/// @param exponent: the exponent for the polynomial (default: 3.0)
pub fn poly_out(t : Double, exponent~ : Double = default_exponent) -> Double {
  1.0 - @math.pow(1.0 - t, exponent)
}

///|
/// Polynomial ease-in-out function with configurable exponent
/// @param t: time parameter (0.0 to 1.0)
/// @param exponent: the exponent for the polynomial (default: 3.0)
pub fn poly_in_out(t : Double, exponent~ : Double = default_exponent) -> Double {
  let t2 = t * 2.0
  if t2 <= 1.0 {
    @math.pow(t2, exponent) / 2.0
  } else {
    (2.0 - @math.pow(2.0 - t2, exponent)) / 2.0
  }
}