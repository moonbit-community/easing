///| Cubic easing functions

///|
/// Cubic ease-in function
/// Acceleration from zero velocity, following a cubic curve
pub fn cubic_in(t : Double) -> Double {
  t * t * t
}

///|
/// Cubic ease-out function
/// Deceleration to zero velocity, following a cubic curve
pub fn cubic_out(t : Double) -> Double {
  let t1 = t - 1.0
  t1 * t1 * t1 + 1.0
}

///|
/// Cubic ease-in-out function
/// Acceleration until halfway, then deceleration
pub fn cubic_in_out(t : Double) -> Double {
  let t2 = t * 2.0
  if t2 <= 1.0 {
    t2 * t2 * t2 / 2.0
  } else {
    let t3 = t2 - 2.0
    (t3 * t3 * t3 + 2.0) / 2.0
  }
}
