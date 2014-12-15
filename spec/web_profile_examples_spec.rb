require 'spec_helper'

describe "WebProfiles" do

  WebProfileAttributes = {
    "name" => "YeowZa! T-Shirt Shop",
    "presentation" => {
        "brand_name" => "YeowZa! Paypal",
        "logo_image" => "http://www.yeowza.com",
        "locale_code" => "US"
    },
    "input_fields" => {
        "allow_note" => true,
        "no_shipping" => 0,
        "address_override" => 1
    },
    "flow_config" => {
        "landing_page_type" => "billing",
        "bank_txn_pending_url" => "http://www.yeowza.com"
    }
  }

  describe "Examples" do
    describe "WebProfile", :integration => true do
      it "Create" do
        api = API.new
        $webprofile = WebProfile.new(WebProfileAttributes.merge( :token => api.token ))
        $webprofile.create
        expect($webprofile.name.to_s).to eq("YeowZa! T-Shirt Shop")
      end

      it "List" do
        list = WebProfile.get_list
        expect(list.size).to be > 1
      end

      it "Retrieve" do
        webprofile = WebProfile.find("XP-A4UX-5GLG-DAA8-26FL")
        expect(webprofile.name.to_s).to eq("YeowZa! T-Shirt Shop-8871170336226187544")
      end

      it "Update" do
        # append "-test" to web profile name
        webprofile = WebProfile.find("XP-A4UX-5GLG-DAA8-26FL")
        webprofile.name += "-test"
        webprofile.update

        # check whether the name was updated
        webprofile = WebProfile.find("XP-A4UX-5GLG-DAA8-26FL")
        expect(webprofile.name).to eq("YeowZa! T-Shirt Shop-8871170336226187544-test")
        webprofile.name = "YeowZa! T-Shirt Shop-8871170336226187544"
        webprofile.update

        # revert updated profile name for next test run
        webprofile = WebProfile.find("XP-A4UX-5GLG-DAA8-26FL")
        expect(webprofile.name).to eq("YeowZa! T-Shirt Shop-8871170336226187544")
      end

      it "Partial update" do
        # retrieve web profile to perform partial update on
        webprofile = WebProfile.find("XP-A4UX-5GLG-DAA8-26FL")

        # set up partial update
        h = {"op" => "replace",
          "path" => "/presentation/brand_name",
          "value" => "new_brand_name"}

        # do partial update by sending a patch request
        expect(webprofile.partial_update( [h] )).to be_truthy
        webprofile = WebProfile.find("XP-A4UX-5GLG-DAA8-26FL")
        expect(webprofile.presentation.brand_name).to eq("new_brand_name")

        # restore original value for the next test run
        h = {"op" => "replace",
          "path" => "/presentation/brand_name",
          "value" => "brand_name"}
        expect(webprofile.partial_update( [h] )).to be_truthy
        expect(WebProfile.find("XP-A4UX-5GLG-DAA8-26FL").presentation.brand_name).to eq("brand_name")
      end

      it "Delete" do
        puts $webprofile.inspect
        # delete newly created web profile from above create test
        expect($webprofile.delete).to be_truthy

        # make sure it is not retrieved from the system
        webprofile = WebProfile.find($webprofile.id)
        puts webprofile
        expect(webprofile).to be_nil
      end
    end
  end
end