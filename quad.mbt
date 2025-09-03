///| Quadratic easing functions

///|
/// Quadratic ease-in function
/// Acceleration from zero velocity, following a quadratic curve
pub fn quad_in(t : Double) -> Double {
  t * t
}

///|
/// Quadratic ease-out function
/// Deceleration to zero velocity, following a quadratic curve
pub fn quad_out(t : Double) -> Double {
  t * (2.0 - t)
}

///|
/// Quadratic ease-in-out function
/// Acceleration until halfway, then deceleration
pub fn quad_in_out(t : Double) -> Double {
  let t2 = t * 2.0
  if t2 <= 1.0 {
    t2 * t2 / 2.0
  } else {
    let t3 = t2 - 1.0
    (t3 * (2.0 - t3) + 1.0) / 2.0
  }
}
