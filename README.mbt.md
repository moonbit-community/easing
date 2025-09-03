# hackwaly/easing

A comprehensive MoonBit implementation of easing functions for smooth animations, ported from the popular [d3-ease](https://github.com/d3/d3-ease) JavaScript library.

## Overview

Easing functions are mathematical functions that describe how a value changes over time, commonly used in animations to create natural-looking motion. This package provides a complete collection of easing functions with an API that's both powerful and easy to use.

All easing functions take a time parameter `t` between 0.0 and 1.0 and return a transformed value, also typically between 0.0 and 1.0 (though some functions like Back and Elastic can overshoot these bounds for realistic motion effects).

## Basic Usage

### Linear Easing

The simplest easing function - no acceleration or deceleration.

```moonbit
test "linear easing demo" {
  // Linear easing is the identity function
  inspect(@easing.ease_linear(0.0), content="0")
  inspect(@easing.ease_linear(0.5), content="0.5") 
  inspect(@easing.ease_linear(1.0), content="1")
}
```

### Quadratic Easing

Quadratic easing provides smooth acceleration and deceleration.

```moonbit
test "quadratic easing demo" {
  // Different curve shapes
  inspect(@easing.ease_quad_in(0.5), content="0.25")    // Accelerating
  inspect(@easing.ease_quad_out(0.5), content="0.75")   // Decelerating  
  inspect(@easing.ease_quad(0.5), content="0.5")        // In-out (default)
}
```

### Cubic Easing

More pronounced curves than quadratic.

```moonbit
test "cubic easing demo" {
  inspect(@easing.ease_cubic_in(0.5), content="0.125")
  inspect(@easing.ease_cubic_out(0.5), content="0.875")
  inspect(@easing.ease_cubic(0.5), content="0.5")
}
```

## Advanced Easing with Optional Parameters

### Polynomial Easing

Configurable polynomial easing with customizable exponent.

```moonbit
test "polynomial easing with options" {
  // Default exponent is 3.0 (same as cubic)
  let default_poly = @easing.ease_poly_in(0.5)
  inspect(default_poly, content="0.125")
  
  // Using direct function call with custom exponent
  let quadratic = @easing.poly_in(0.5, exponent=2.0)
  inspect(quadratic, content="0.25")
  
  let quartic = @easing.poly_in(0.5, exponent=4.0) 
  inspect(quartic, content="0.0625")
}
```

### Back Easing with Custom Overshoot

Creates anticipation by going slightly backwards before moving forward.

```moonbit
test "back easing with custom overshoot" {
  // Default overshoot
  let normal_back = @easing.ease_back_in(0.5)
  
  // Custom overshoot for more dramatic effect
  let strong_back = @easing.back_in(0.5, overshoot=3.0)
  let weak_back = @easing.back_in(0.5, overshoot=1.0)
  
  // Stronger overshoot creates more negative values
  inspect(strong_back < normal_back, content="true")
  inspect(normal_back < weak_back, content="true")
}
```

### Elastic Easing with Custom Parameters

Creates elastic oscillations like a rubber band or spring.

```moonbit
test "elastic easing with custom parameters" {
  // Default parameters
  let default_elastic = @easing.ease_elastic_in(0.5)
  
  // Custom amplitude affects oscillation strength
  let strong_elastic = @easing.elastic_in(0.5, amplitude=2.0)
  inspect(default_elastic != strong_elastic, content="true")
  
  // Custom period affects oscillation frequency  
  let fast_oscillation = @easing.elastic_in(0.5, period=0.1)
  let slow_oscillation = @easing.elastic_in(0.5, period=0.8)
  inspect(fast_oscillation != slow_oscillation, content="true")
}
```

## Specialized Easing Functions

### Exponential Easing

Creates dramatic acceleration and deceleration effects.

```moonbit
test "exponential easing characteristics" {
  // Values change rapidly near the extremes
  let exp_early = @easing.ease_exp_in(0.1)
  let exp_late = @easing.ease_exp_in(0.9)
  
  // Early values are very small
  inspect(exp_early < 0.01, content="true")
  // Later values grow but slowly at first
  inspect(exp_late < 1.0, content="true")
}
```

### Bounce Easing

Simulates the motion of a bouncing ball.

```moonbit
test "bounce easing behavior" {
  // Bounce typically overshoots during animation
  let quarter_bounce = @easing.ease_bounce_out(0.25)
  let half_bounce = @easing.ease_bounce_out(0.5)
  
  // The bounce creates peaks above the linear progression
  inspect(quarter_bounce > 0.25, content="true")
  inspect(half_bounce > 0.5, content="true")
}
```

### Circle Easing

Based on quarter-circle curves for smooth transitions.

```moonbit
test "circle easing smoothness" {
  // Circle easing provides smooth curves
  inspect(@easing.ease_circle_in(0.0), content="0")
  inspect(@easing.ease_circle_out(1.0), content="1") 
  inspect(@easing.ease_circle(0.5), content="0.5")
}
```

### Sine Easing

Natural, smooth curves based on sine functions.

```moonbit
test "sine easing curves" {
  // Sine creates very natural feeling motion
  let sin_quarter = @easing.ease_sin_in(0.25)
  let sin_half = @easing.ease_sin_out(0.5)
  
  // Values are between 0 and 1 with smooth transitions
  inspect(sin_quarter > 0.0 && sin_quarter < 0.25, content="true")
  inspect(sin_half > 0.5 && sin_half < 1.0, content="true")
}
```

## API Compatibility

This library provides both direct function calls and convenience aliases:

```moonbit
test "API compatibility" {
  // Direct function calls (support optional parameters)
  let poly_custom = @easing.poly_in(0.5, exponent=2.0)
  let back_custom = @easing.back_out(0.5, overshoot=2.0)
  
  // Convenience aliases (d3-ease compatible names)
  let poly_default = @easing.ease_poly_in(0.5)
  let back_default = @easing.ease_back_out(0.5)
  
  // Verify the aliases work correctly
  inspect(@easing.ease_linear(0.5) == @easing.linear(0.5), content="true")
  inspect(poly_default, content="0.125") // Default exponent 3.0
  
  // Demonstrate usage
  ignore(poly_custom)
  ignore(back_custom)
  ignore(back_default)
}
```

## Function Categories

The library includes these easing function families:

- **Linear**: `ease_linear` - Constant speed
- **Quadratic**: `ease_quad_*` - Gentle curves  
- **Cubic**: `ease_cubic_*` - More pronounced curves
- **Polynomial**: `ease_poly_*` - Configurable exponent (supports `exponent=` parameter)
- **Sine**: `ease_sin_*` - Natural, smooth curves
- **Exponential**: `ease_exp_*` - Dramatic acceleration/deceleration
- **Circle**: `ease_circle_*` - Quarter-circle based curves
- **Back**: `ease_back_*` - Anticipation/overshoot (supports `overshoot=` parameter)
- **Bounce**: `ease_bounce_*` - Bouncing ball physics
- **Elastic**: `ease_elastic_*` - Spring/rubber band effects (supports `amplitude=` and `period=` parameters)

Each family typically includes `*_in`, `*_out`, and `*_in_out` variants, plus a default variant (usually the `*_in_out` version).

## Choosing the Right Easing

- **Linear**: Use for simple fades or when you want constant speed
- **Quad/Cubic**: Great for general UI transitions - natural but noticeable  
- **Sine**: Excellent for organic, subtle animations
- **Exponential**: Use sparingly for dramatic impact
- **Circle**: Good balance of smoothness and visibility
- **Back**: Perfect for attention-grabbing effects with anticipation
- **Elastic**: Fun and playful - great for casual, game-like interfaces  
- **Bounce**: Realistic physics simulation for ball-like objects

Most UI animations benefit from **_out** or **_in_out** variants as they provide satisfying deceleration.