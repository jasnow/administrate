require "rails_helper"

describe "order form" do
  it "displays a select box for the customer" do
    customer = create(:customer)

    visit new_admin_order_path
    select(customer.name, from: "Customer")
    fill_in "Address line one", with: "Example"
    fill_in "Address line two", with: "Example"
    fill_in "Address city", with: "Example"
    fill_in "Address state", with: "Example"
    fill_in "Address zip", with: "Example"
    click_on "Create Order"

    expect(page).to have_link(customer.name)
    expect(page).to have_flash(
      t("administrate.controller.create.success", resource: "Order")
    )
  end

  describe "has_many relationships" do
    it "can select multiple options" do
      order = create(:order)
      line_items = create_list(:line_item, 3)

      visit edit_admin_order_path(order)
      find_option(line_items.first, "line_item_ids").select_option
      find_option(line_items.last, "line_item_ids").select_option
      click_on "Update Order"

      order.reload
      expect(order.line_items).to include(line_items.first)
      expect(order.line_items).to include(line_items.last)
      expect(order.line_items).not_to include(line_items[1])
    end

    it "can unselect all options" do
      order = create(:order)
      line_item = create(:line_item, order: order)

      visit edit_admin_order_path(order)
      find_option(line_item, "line_item_ids").unselect_option
      click_on "Update Order"

      order.reload
      expect(order.line_items).to be_empty
      expect(page).to have_flash(
        t("administrate.controller.update.success", resource: "Order")
      )
    end

    def find_option(associated_model, field_id)
      field = find("#order_" + field_id)
      field.find("option", text: associated_model.to_s)
    end
  end

  describe "datetime field" do
    it "correctly parses dates" do
      order = create(:order)

      visit edit_admin_order_path(order)
      fill_in("Shipped at", with: "09/03/2015 7:18 AM")
      click_on "Update Order"

      #expect(page).to have_content("Thu, Sep 3, 2015 at 07:18:00 AM")
    end

    it "responds to the date/time picker date format", :js do
      order = create(:order)

      visit edit_admin_order_path(order)
      select_from_datepicker(Time.new(2015, 01, 02, 03, 04, 05))
      click_on "Update Order"

      expect(page).to have_content("Fri, Jan 2, 2015 at 03:04:05 AM")
    end

    def select_from_datepicker(time)
      time_string = time.to_s[0..-7]

      page.execute_script(<<-JS)
        var date = moment("#{time_string}", "YYYY-MM-DD hh:mm:ss");
        $(".datetimepicker").data("DateTimePicker").date(date);
      JS
    end
  end
end
