///| Back easing functions with overshoot

///|
/// Default overshoot value for back easing functions
let default_overshoot : Double = 1.70158

///|
/// Back ease-in function with configurable overshoot
/// @param t: time parameter (0.0 to 1.0)
/// @param overshoot: the amount of overshoot (default: 1.70158)
pub fn back_in(t : Double, overshoot~ : Double = default_overshoot) -> Double {
  t * t * (overshoot * (t - 1.0) + t)
}

///|
/// Back ease-out function with configurable overshoot
/// @param t: time parameter (0.0 to 1.0)
/// @param overshoot: the amount of overshoot (default: 1.70158)
pub fn back_out(t : Double, overshoot~ : Double = default_overshoot) -> Double {
  let t1 = t - 1.0
  t1 * t1 * ((t1 + 1.0) * overshoot + t1) + 1.0
}

///|
/// Back ease-in-out function with configurable overshoot
/// @param t: time parameter (0.0 to 1.0)
/// @param overshoot: the amount of overshoot (default: 1.70158)
pub fn back_in_out(t : Double, overshoot~ : Double = default_overshoot) -> Double {
  let t2 = t * 2.0
  if t2 < 1.0 {
    t2 * t2 * ((overshoot + 1.0) * t2 - overshoot) / 2.0
  } else {
    let t3 = t2 - 2.0
    (t3 * t3 * ((overshoot + 1.0) * t3 + overshoot) + 2.0) / 2.0
  }
}