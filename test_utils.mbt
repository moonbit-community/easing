///| Test utilities for d3-ease tests

///|
/// Assert that two floating point numbers are approximately equal within epsilon
pub fn assert_in_delta(actual : Double, expected : Double, epsilon~ : Double = 0.000001) -> Unit {
  if (actual - expected).abs() > epsilon {
    abort("Expected \{actual} to be within \{epsilon} of \{expected}")
  }
}

///|
/// Test that a function returns values within expected bounds
pub fn test_range(
  _name : String,
  func : (Double) -> Double,
  test_values : Array[(Double, Double)],
) -> Unit {
  for i = 0; i < test_values.length(); i = i + 1 {
    let (input, expected) = test_values[i]
    let actual = func(input)
    assert_in_delta(actual, expected)
  }
}