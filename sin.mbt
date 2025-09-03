///| Sine easing functions

///|
/// Mathematical constants for sine easing
let pi : Double = @math.PI

///|
let half_pi : Double = pi / 2.0

///|
/// Sine ease-in function
/// Smooth acceleration using cosine
pub fn sin_in(t : Double) -> Double {
  if t == 1.0 {
    1.0
  } else {
    1.0 - @math.cos(t * half_pi)
  }
}

///|
/// Sine ease-out function  
/// Smooth deceleration using sine
pub fn sin_out(t : Double) -> Double {
  @math.sin(t * half_pi)
}

///|
/// Sine ease-in-out function
/// Smooth acceleration and deceleration
pub fn sin_in_out(t : Double) -> Double {
  (1.0 - @math.cos(pi * t)) / 2.0
}
