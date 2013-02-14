require 'spec_helper'

module Refinery
  module Flare
    describe Template do
      let(:template) { Template.new(settings) }

      describe "attribute initialization" do
        let(:fields) {[
          { title:                  'string-field',
            refinery_type:          :string,
            refinery_type_options:  {}},
          { title:                  'text-field',
            refinery_type:          :text,
            refinery_type_options:  {}},
          { title:                  'image-field',
            refinery_type:          :image,
            refinery_type_options:  {}},
          { title:                  'resource-field',
            refinery_type:          :resource,
            refinery_type_options:  {}}
        ]}
        let(:parts) {[{
          repeatable:       true,
          fields:           fields,
          refinery_options: {title: 'side-column'}
        }]}
        let(:refinery_options){{
          deletable:       false,
          view_template:   'show',
          layout_template: 'custom'
        }}
        let(:settings) {{
          repeatable: true,
          parts: parts,
          refinery_options: refinery_options
        }}

        it "init attributes" do
          template.repeatable.should == true
          template.refinery_options[:deletable].should == false
          template.refinery_options[:view_template].should == 'show'
          template.refinery_options[:layout_template].should == 'custom'
        end

        it "has parts" do
          template.parts.first.repeatable.should == true
        end

        it "has multiple parts fields" do
          template.parts.first.fields.first.title.should == 'string-field'
          template.parts.first.fields.last.title.should == 'resource-field'
        end

        it "should be valid" do
          template.valid?.should == true
          template.parts.first.valid?.should == true
        end

        describe "with invalid refinery options" do
          let(:refinery_options){{
            stupid_option: true
          }}
          let(:parts) {[{
            repeatable:       true,
            fields:           fields,
            refinery_options: {stupid_option: true}
          }]}

          it "should be invalid template" do
            template.valid?.should == false
          end

          it "should have invalid page part" do
            template.parts.first.valid?.should == false
          end
        end
      end

    end
  end
end
