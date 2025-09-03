///| Mathematical utility functions for easing calculations

///|
/// tpmt is two power minus ten times t scaled to [0,1]
/// This function computes (2^(-10 * x) - 0.0009765625) * 1.0009775171065494
pub fn tpmt(x : Double) -> Double {
  (@math.pow(2.0, -10.0 * x) - 0.0009765625) * 1.0009775171065494
}
