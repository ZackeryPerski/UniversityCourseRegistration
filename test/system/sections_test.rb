require "application_system_test_case"

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:one)
  end

  test "visiting the index" do
    visit sections_url
    assert_selector "h1", text: "Sections"
  end

  test "should create section" do
    visit sections_url
    click_on "New section"

    fill_in "Capacity", with: @section.capacity
    fill_in "Course", with: @section.course_id
    fill_in "Days", with: @section.days
    fill_in "End time", with: @section.end_time
    fill_in "Instructor", with: @section.instructor_id
    fill_in "Semester", with: @section.semester
    fill_in "Start time", with: @section.start_time
    fill_in "Year", with: @section.year
    click_on "Create Section"

    assert_text "Section was successfully created"
    click_on "Back"
  end

  test "should update Section" do
    visit section_url(@section)
    click_on "Edit this section", match: :first

    fill_in "Capacity", with: @section.capacity
    fill_in "Course", with: @section.course_id
    fill_in "Days", with: @section.days
    fill_in "End time", with: @section.end_time
    fill_in "Instructor", with: @section.instructor_id
    fill_in "Semester", with: @section.semester
    fill_in "Start time", with: @section.start_time
    fill_in "Year", with: @section.year
    click_on "Update Section"

    assert_text "Section was successfully updated"
    click_on "Back"
  end

  test "should destroy Section" do
    visit section_url(@section)
    click_on "Destroy this section", match: :first

    assert_text "Section was successfully destroyed"
  end
end
