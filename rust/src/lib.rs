pub fn add(a: f64, b: f64) -> f64 {
    a + b
}

pub fn sub(a: f64, b: f64) -> f64 {
    a - b
}

pub fn mul(a: f64, b: f64) -> f64 {
    a * b
}

pub fn div(a: f64, b: f64) -> f64 {
    if b == 0.0 {
        panic!("division by zero");
    }
    a / b
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_add() {
        assert_eq!(add(2.0, 3.0), 5.0);
    }

    #[test]
    fn test_sub() {
        assert_eq!(sub(5.0, 3.0), 2.0);
    }

    #[test]
    fn test_mul() {
        assert_eq!(mul(4.0, 5.0), 20.0);
    }

    #[test]
    fn test_div() {
        assert_eq!(div(10.0, 2.0), 5.0);
    }

    #[test]
    #[should_panic(expected = "division by zero")]
    fn test_div_zero() {
        div(1.0, 0.0);
    }
}