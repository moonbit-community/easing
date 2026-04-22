///| Elastic easing functions with configurable amplitude and period

///|
/// Mathematical constants for elastic easing
let tau : Double = 2.0 * @math.PI

///|
let default_amplitude : Double = 1.0

///|
let default_period : Double = 0.3

///|
/// Helper function to compute the phase shift for elastic easing
fn compute_phase(amplitude : Double, period : Double) -> Double {
  let a = if amplitude > 1.0 { amplitude } else { 1.0 }
  let p = period / tau
  @math.asin(1.0 / a) * p
}

///|
/// Elastic ease-in function with configurable amplitude and period
/// @param t: time parameter (0.0 to 1.0)
/// @param amplitude: oscillation amplitude (default: 1.0)
/// @param period: oscillation period (default: 0.3)
pub fn elastic_in(
  t : Double,
  amplitude? : Double = default_amplitude,
  period? : Double = default_period,
) -> Double {
  let a = if amplitude > 1.0 { amplitude } else { 1.0 }
  let p = period / tau
  let s = compute_phase(amplitude, period)
  let t1 = t - 1.0
  a * tpmt(-t1) * @math.sin((s - t1) / p)
}

///|
/// Elastic ease-out function with configurable amplitude and period
/// @param t: time parameter (0.0 to 1.0)
/// @param amplitude: oscillation amplitude (default: 1.0)
/// @param period: oscillation period (default: 0.3)
pub fn elastic_out(
  t : Double,
  amplitude? : Double = default_amplitude,
  period? : Double = default_period,
) -> Double {
  let a = if amplitude > 1.0 { amplitude } else { 1.0 }
  let p = period / tau
  let s = compute_phase(amplitude, period)
  1.0 - a * tpmt(t) * @math.sin((t + s) / p)
}

///|
/// Elastic ease-in-out function with configurable amplitude and period
/// @param t: time parameter (0.0 to 1.0)
/// @param amplitude: oscillation amplitude (default: 1.0)
/// @param period: oscillation period (default: 0.3)
pub fn elastic_in_out(
  t : Double,
  amplitude? : Double = default_amplitude,
  period? : Double = default_period,
) -> Double {
  let a = if amplitude > 1.0 { amplitude } else { 1.0 }
  let p = period / tau
  let s = compute_phase(amplitude, period)
  let t2 = t * 2.0 - 1.0
  if t2 < 0.0 {
    a * tpmt(-t2) * @math.sin((s - t2) / p) / 2.0
  } else {
    (2.0 - a * tpmt(t2) * @math.sin((s + t2) / p)) / 2.0
  }
}
