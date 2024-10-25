require 'spec_helper'

module Refinery
  module PvSliderImages
    describe PvSliderImage do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:pv_slider_image,
          :title => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS" }
      end
    end
  end
end
