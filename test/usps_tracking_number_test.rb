require 'test_helper'

class USPSTrackingNumberTest < Minitest::Test
  context "a USPS tracking number" do
    ["9101 1234 5678 9000 0000 13", "7196 9010 7560 0307 7385", "9400 1112 0108 0805 4830 16", "9505 5110 6960 5048 6006 24", "9361 2898 7870 0317 6337 95"].each do |valid_number|
      should "return usps with valid 22 digit number: #{valid_number}" do
        should_be_valid_number(valid_number, TrackingNumber::USPS91, :usps)
      end

      should "fail on check digit changes on #{valid_number}" do
        should_fail_on_check_digit_changes(valid_number)
      end

      should "detect #{valid_number} regardless of spacing" do
        should_detect_number_variants(valid_number, TrackingNumber::USPS91)
      end
    end

    ["0307 1790 0005 2348 3741"].each do |valid_number|
      should "return usps with valid 20 digit number: #{valid_number}" do
        should_be_valid_number(valid_number, TrackingNumber::USPS20, :usps)
      end

      should "fail on check digit changes on #{valid_number}" do
        should_fail_on_check_digit_changes(valid_number)
      end

      should "detect #{valid_number} regardless of spacing" do
        should_detect_number_variants(valid_number, TrackingNumber::USPS20)
      end
    end

    ["RB123456785US"].each do |valid_number|
      should "return usps with valid 13 character number #{valid_number}" do
        should_be_valid_number(valid_number, TrackingNumber::USPS13, :usps)
      end

      should "fail on check digit changes on #{valid_number}" do
        should_fail_on_check_digit_changes(valid_number)
      end

      should "detect #{valid_number} regardless of spacing" do
        should_detect_number_variants(valid_number, TrackingNumber::USPS13)
      end
    end

    ["420221539101026837331000039521"].each do |valid_number|
      should "return usps with valid 30 digit number: #{valid_number}" do
        should_be_valid_number(valid_number, TrackingNumber::USPS91, :usps)
      end

      should "fail on check digit changes on #{valid_number}" do
        should_fail_on_check_digit_changes(valid_number)
      end
    end

    ["92748931507708513018050063"].each do |valid_number|
      should "return usps with valid 26 digit number: #{valid_number}" do
        should_be_valid_number(valid_number, TrackingNumber::USPS91, :usps)
      end

      should "fail on check digit changes on #{valid_number}" do
        should_fail_on_check_digit_changes(valid_number)
      end
    end
  end
end
