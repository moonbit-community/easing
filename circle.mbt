///| Circle easing functions

///|
/// Circle ease-in function
/// Acceleration following a circular arc
pub fn circle_in(t : Double) -> Double {
  1.0 - (1.0 - t * t).sqrt()
}

///|
/// Circle ease-out function
/// Deceleration following a circular arc
pub fn circle_out(t : Double) -> Double {
  let t1 = t - 1.0
  (1.0 - t1 * t1).sqrt()
}

///|
/// Circle ease-in-out function
/// Acceleration and deceleration following circular arcs
pub fn circle_in_out(t : Double) -> Double {
  let t2 = t * 2.0
  if t2 <= 1.0 {
    (1.0 - (1.0 - t2 * t2).sqrt()) / 2.0
  } else {
    let t3 = t2 - 2.0
    ((1.0 - t3 * t3).sqrt() + 1.0) / 2.0
  }
}
