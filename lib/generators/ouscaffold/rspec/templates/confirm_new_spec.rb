require 'spec_helper'

<% output_attributes = attributes.reject{|attribute| [:datetime, :timestamp, :time, :date].index(attribute.type) } -%>
describe "<%= table_name %>/confirm_new.html.<%= options[:template_engine] %>" do
  before(:each) do
    assign(:<%= file_name %>, stub_model(<%= class_name %>,
      :new_record? => true<%= output_attributes.empty? ? '' : ',' %>
<% output_attributes.each_with_index do |attribute, attribute_index| -%>
      :<%= attribute.name %> => <%= value_for(attribute) %><%= attribute_index == output_attributes.length - 1 ? '' : ','%>
<% end -%>
    ))
  end

  it "renders confirmation of new <%= file_name %> form" do
    render

    rendered.should have_selector("form", :action => <%= table_name %>_path, :method => "post") do |form|
<% for attribute in output_attributes -%>
      rendered.should contain(<%= value_for(attribute) %>.to_s)
      form.should have_selector("input#<%= file_name %>_<%= attribute.name %>", :type => "hidden", :name => "<%= file_name %>[<%= attribute.name %>]")
<% end -%>
    end
  end
end
