class_name GodotTestAssertions
extends RefCounted

var tests_passed: int = 0
var tests_failed: int = 0
var failures: Array[String] = []

func assert_true(condition: bool, msg: String = "") -> bool:
	if condition:
		tests_passed += 1
		return true
	_fail("Expected TRUE, but got FALSE. %s" % msg)
	return false

func assert_false(condition: bool, msg: String = "") -> bool:
	if not condition:
		tests_passed += 1
		return true
	_fail("Expected FALSE, but got TRUE. %s" % msg)
	return false

func assert_eq(actual: Variant, expected: Variant, msg: String = "") -> bool:
	if actual == expected:
		tests_passed += 1
		return true
	_fail("Expected %s, but got %s. %s" % [str(expected), str(actual), msg])
	return false

func assert_ne(actual: Variant, expected: Variant, msg: String = "") -> bool:
	if actual != expected:
		tests_passed += 1
		return true
	_fail("Expected value NOT equal to %s, but values match. %s" % [str(expected), msg])
	return false

func assert_approx_eq(actual: float, expected: float, epsilon: float = 0.001, msg: String = "") -> bool:
	if abs(actual - expected) <= epsilon:
		tests_passed += 1
		return true
	_fail("Expected approx %f (±%f), but got %f. %s" % [expected, epsilon, actual, msg])
	return false

func assert_vector_approx_eq(actual: Vector2, expected: Vector2, epsilon: float = 0.001, msg: String = "") -> bool:
	if actual.distance_to(expected) <= epsilon:
		tests_passed += 1
		return true
	_fail("Expected approx Vector2%s, but got Vector2%s. %s" % [str(expected), str(actual), msg])
	return false

func assert_not_null(val: Variant, msg: String = "") -> bool:
	if val != null:
		tests_passed += 1
		return true
	_fail("Expected non-null value, but got NULL. %s" % msg)
	return false

func assert_null(val: Variant, msg: String = "") -> bool:
	if val == null:
		tests_passed += 1
		return true
	_fail("Expected NULL, but got %s. %s" % [str(val), msg])
	return false

func assert_gt(val: float, threshold: float, msg: String = "") -> bool:
	if val > threshold:
		tests_passed += 1
		return true
	_fail("Expected %f > %f. %s" % [val, threshold, msg])
	return false

func assert_lt(val: float, threshold: float, msg: String = "") -> bool:
	if val < threshold:
		tests_passed += 1
		return true
	_fail("Expected %f < %f. %s" % [val, threshold, msg])
	return false

func _fail(failure_msg: String) -> void:
	tests_failed += 1
	failures.append(failure_msg)
	printerr("  ❌ FAILURE: ", failure_msg)

