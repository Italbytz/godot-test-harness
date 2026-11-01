extends "res://addons/test_harness/test_runner.gd"

func _init() -> void:
	start("Self-Test for Italbytz/godot-test-harness")
	
	run_suite("Boolean Assertions", _test_booleans)
	run_suite("Equality Assertions", _test_equality)
	run_suite("Approximation Assertions", _test_approx)
	run_suite("Nullability Assertions", _test_nullability)
	run_suite("Comparison Assertions", _test_comparisons)
	
	finish()

func _test_booleans() -> void:
	assert_true(true, "True must be true")
	assert_false(false, "False must be false")
	assert_true(10 > 5, "10 should be greater than 5")

func _test_equality() -> void:
	assert_eq(42, 42, "Integers should match")
	assert_eq("godot", "godot", "Strings should match")
	assert_ne("apple", "orange", "Different strings should not match")
	assert_eq([1, 2], [1, 2], "Arrays should match")

func _test_approx() -> void:
	assert_approx_eq(3.14159, 3.14158, 0.001, "Pi approximation")
	assert_vector_approx_eq(Vector2(10.0001, 20.0001), Vector2(10.0, 20.0), 0.01, "Vector approximation")

func _test_nullability() -> void:
	var node = RefCounted.new()
	assert_not_null(node, "Node should not be null")
	assert_null(null, "Null should be null")

func _test_comparisons() -> void:
	assert_gt(100.0, 50.0, "100 > 50")
	assert_lt(25.0, 50.0, "25 < 50")
