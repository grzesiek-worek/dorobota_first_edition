
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn

inst_built_in = BuiltIn()

def text_box_verify_output(output, full_name, email, current_address, permanent_address):
    """
    Verifies the output of a text box against the expected values.

    *Args:*
        | name | type | description |
        | output | (str) | The actual output from the text box. |
        | full_name | (str) | The expected full name. |
        | email | (str) | The expected email. |
        | current_address | (str) | The expected current address. |
        | permanent_address | (str) | The expected permanent address. |

    Raises:
        AssertionError: If any of the expected values are not found in the output.
    """

    # jeśli chcemy logowac "coś" w RFW, to musimy użyć loggera z robot.api, a nie printa, bo print nie będzie widoczny w logach RFW
    logger.info(f"Verifying text box output: {output}")
    logger.info(f"Expected full name: {full_name}")
    logger.info(f"Expected email: {email}")
    logger.info(f"Expected current address: {current_address}")
    logger.info(f"Expected permanent address: {permanent_address}")

    print(f"Verifying text box output: {output}")
    print(f"Expected full name: {full_name}")
    print(f"Expected email: {email}")

    
    if full_name not in output:
        raise AssertionError(f"Expected full name '{full_name}' not found in output: {output}")
    if email not in output:
        raise AssertionError(f"Expected email '{email}' not found in output: {output}")
    if current_address not in output:
        raise AssertionError(f"Expected current address '{current_address}' not found in output: {output}")
    if permanent_address not in output:
        raise AssertionError(f"Expected permanent address '{permanent_address}' not found in output: {output}")


def text_box_verify_output_with_RFW_libs(output, full_name, email, current_address, permanent_address):
    """
    Verifies the output of a text box against the expected values using Robot Framework's BuiltIn library.

    *Args:*
        | name | type | description |
        | output | (str) | The actual output from the text box. |
        | full_name | (str) | The expected full name. |
        | email | (str) | The expected email. |
        | current_address | (str) | The expected current address. |
        | permanent_address | (str) | The expected permanent address. |
    """
    inst_built_in.should_contain(output, full_name, msg=f"Expected full name '{full_name}' not found in output: {output}")
    inst_built_in.should_contain(output, email, msg=f"Expected email '{email}' not found in output: {output}")
    inst_built_in.should_contain(output, current_address, msg=f"Expected current address '{current_address}' not found in output: {output}")
    inst_built_in.should_contain(output, permanent_address, msg=f"Expected permanent address '{permanent_address}' not found in output: {output}")