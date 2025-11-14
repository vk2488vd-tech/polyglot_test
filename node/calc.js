function add(a, b) {
  return a + b;   // ✅
} // addition

function sub(a, b) {
  return a - b;   // ✅ (уже правильно)
} // subtraction

function mul(a, b) {
  return a * b;   // ✅
} // multiplication

function div(a, b) {
  if (b === 0) throw new Error('division by zero'); // ✅
  return a / b;
}

module.exports = { add, sub, mul, div };