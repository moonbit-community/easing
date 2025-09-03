///| Exponential easing functions

///|
/// Exponential ease-in function
/// Sharp acceleration using exponential curve
pub fn exp_in(t : Double) -> Double {
  tpmt(1.0 - t)
}

///|
/// Exponential ease-out function
/// Sharp deceleration using exponential curve
pub fn exp_out(t : Double) -> Double {
  1.0 - tpmt(t)
}

///|
/// Exponential ease-in-out function
/// Sharp acceleration and deceleration
pub fn exp_in_out(t : Double) -> Double {
  let t2 = t * 2.0
  if t2 <= 1.0 {
    tpmt(1.0 - t2) / 2.0
  } else {
    (2.0 - tpmt(t2 - 1.0)) / 2.0
  }
}
