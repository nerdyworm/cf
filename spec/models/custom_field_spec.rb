require 'spec_helper'

describe CustomField do
  subject { CustomField }

  describe "structure" do
    it "associated objects should have custom field values" do
      deal = Deal.new
      deal.custom_fields.should eql([])
    end

    it "should have an association" do
      deal = Factory.create :deal
      field = Factory.create(:custom_field, :fieldable => deal)

      field.fieldable.should eq(deal)
    end

    it "excepts absurbly large amounts of custom fields" do
      params = {
        :deal => {
          :name => 'a deal name',
          :custom_fields => {
          }
        }
      }

      1000.times do |i|
        params[:deal][:custom_fields]["some_key_#{i}".to_sym] = i
      end

      deal = Deal.new(params[:deal])
      deal.save
    end

    it "does the controller like things" do
      params = {
        :deal => {
          :name => 'a deal name',
          :custom_fields => {
            :key_some =>'value_some',
            :some_key =>'some_value',
          }
        }
      }

      deal = Deal.new(params[:deal])
      deal.save

      deal.reload

      deal.name.should == 'a deal name'
      deal.custom_fields.find_by_key('key_some').value.should == 'value_some'
      deal.custom_fields.find_by_key('some_key').value.should == 'some_value'
    end

    it "does not persist custom fields if not saved" do
      attributes = {
        :custom_fields => {
          :some_key =>'some_value'
        }
      }

      deal = Deal.new(attributes)
      deal.custom_fields.first.new_record?.should be_true
    end

    it "does perist when saved" do
      params = {
        :custom_fields => {
          :some_key =>'some_value'
        }
      }

      deal = Deal.new(params)
      deal.save!
      deal.reload
      deal.custom_fields.first.new_record?.should be_false
    end
  end
end
