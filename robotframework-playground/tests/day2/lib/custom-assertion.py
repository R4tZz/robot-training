from robot.api.deco import keyword


@keyword
def my_custom_equal(actual, expected):
    """Custom assertion to check if two values are equal."""
    if actual != expected:
        raise AssertionError(f"Expected: {expected}, but got: {actual}")
    print(f"Assertion passed: {actual} equals {expected}")
