from robot.api.deco import keyword



# Nazwa klasy MUSI być taka sama jak nazwa pliku!
class QADemoHelperClass:

    # dekorat keywords z RFW jest potrzebny aby metoda mogła być używana jako keyword w RFW
    @keyword(name="Text Box Verify Output2")
    @staticmethod
    def text_box_verify_output2(actual_output, full_name, email, current_address, permanent_address):
        assert full_name in actual_output, f"Expected full name '{full_name}' not found in actual output."
        assert email in actual_output, f"Expected email '{email}' not found in actual output."
        assert current_address in actual_output, f"Expected current address '{current_address}' not found in actual output."
        assert permanent_address in actual_output, f"Expected permanent address '{permanent_address}' not found in actual output."
