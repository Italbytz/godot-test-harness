class_name GodotTestRunner
extends SceneTree

var assertions: GodotTestAssertions = GodotTestAssertions.new()
var total_suites: int = 0
var passed_suites: int = 0
var failed_suites: int = 0

func start(title: String) -> void:
	print("\n========================================================")
	print("  TEST SUITE: ", title)
	print("========================================================")

func run_suite(suite_name: String, callable: Callable) -> bool:
	total_suites += 1
	var suite_id = "[%d] %s" % [total_suites, suite_name]
	print("\n%s..." % suite_id)
	
	var initial_failures = assertions.tests_failed
	var result = callable.call()
	
	var new_failures = assertions.tests_failed - initial_failures
	if result != false and new_failures == 0:
		passed_suites += 1
		print("  -> %s OK." % suite_name)
		return true
	else:
		failed_suites += 1
		printerr("  ❌ %s FAILED with %d assertion failures." % [suite_name, new_failures])
		return false

func finish() -> void:
	print("\n--------------------------------------------------------")
	print("  SUMMARY: %d Suites Run (%d Passed, %d Failed)" % [total_suites, passed_suites, failed_suites])
	print("  ASSERTIONS: %d Total (%d Passed, %d Failed)" % [
		assertions.tests_passed + assertions.tests_failed,
		assertions.tests_passed,
		assertions.tests_failed
	])
	print("--------------------------------------------------------")
	
	if failed_suites == 0 and assertions.tests_failed == 0:
		print("  ✓ ALL TESTS PASSED SUCCESSFULLY!\n")
		quit(0)
	else:
		printerr("  ❌ CI TEST RUN FAILED!\n")
		quit(1)

# Forwarding assertion helpers
func assert_true(cond: bool, msg: String = "") -> bool:
	return assertions.assert_true(cond, msg)

func assert_false(cond: bool, msg: String = "") -> bool:
	return assertions.assert_false(cond, msg)

func assert_eq(actual: Variant, expected: Variant, msg: String = "") -> bool:
	return assertions.assert_eq(actual, expected, msg)

func assert_ne(actual: Variant, expected: Variant, msg: String = "") -> bool:
	return assertions.assert_ne(actual, expected, msg)

func assert_approx_eq(actual: float, expected: float, epsilon: float = 0.001, msg: String = "") -> bool:
	return assertions.assert_approx_eq(actual, expected, epsilon, msg)

func assert_vector_approx_eq(actual: Vector2, expected: Vector2, epsilon: float = 0.001, msg: String = "") -> bool:
	return assertions.assert_vector_approx_eq(actual, expected, epsilon, msg)

func assert_not_null(val: Variant, msg: String = "") -> bool:
	return assertions.assert_not_null(val, msg)

func assert_null(val: Variant, msg: String = "") -> bool:
	return assertions.assert_null(val, msg)

func assert_gt(val: float, threshold: float, msg: String = "") -> bool:
	return assertions.assert_gt(val, threshold, msg)

func assert_lt(val: float, threshold: float, msg: String = "") -> bool:
	return assertions.assert_lt(val, threshold, msg)

