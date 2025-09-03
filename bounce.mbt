///| Bounce easing functions

///|
/// Constants for bounce easing calculations
let b1 : Double = 4.0 / 11.0

///|
let b2 : Double = 6.0 / 11.0

///|
let b3 : Double = 8.0 / 11.0

///|
let b4 : Double = 3.0 / 4.0

///|
let b5 : Double = 9.0 / 11.0

///|
let b6 : Double = 10.0 / 11.0

///|
let b7 : Double = 15.0 / 16.0

///|
let b8 : Double = 21.0 / 22.0

///|
let b9 : Double = 63.0 / 64.0

///|
let b0 : Double = 1.0 / b1 / b1

///|
/// Bounce ease-in function
/// Inverted bounce effect at the beginning
pub fn bounce_in(t : Double) -> Double {
  1.0 - bounce_out(1.0 - t)
}

///|
/// Bounce ease-out function
/// Bounce effect at the end
pub fn bounce_out(t : Double) -> Double {
  if t < b1 {
    b0 * t * t
  } else if t < b3 {
    let t1 = t - b2
    b0 * t1 * t1 + b4
  } else if t < b6 {
    let t2 = t - b5
    b0 * t2 * t2 + b7
  } else {
    let t3 = t - b8
    b0 * t3 * t3 + b9
  }
}

///|
/// Bounce ease-in-out function
/// Bounce effect at both ends
pub fn bounce_in_out(t : Double) -> Double {
  let t2 = t * 2.0
  if t2 <= 1.0 {
    (1.0 - bounce_out(1.0 - t2)) / 2.0
  } else {
    (bounce_out(t2 - 1.0) + 1.0) / 2.0
  }
}
