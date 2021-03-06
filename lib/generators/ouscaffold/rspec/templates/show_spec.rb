require 'spec_helper'

<% output_attributes = attributes.reject{|attribute| [:datetime, :timestamp, :time, :date].index(attribute.type) } -%>
describe "<%= controller_path %>/show.html.<%= options[:template_engine] %>" do
  before(:each) do
    @<%= specified.singular_table_name %> = assign(:<%= specified.singular_table_name %>, stub_model(<%= specified.class_name %><%= output_attributes.empty? ? '))' : ',' %>
<% output_attributes.each_with_index do |attribute, attribute_index| -%>
      :<%= attribute.name %> => <%= value_for(attribute) %><%= attribute_index == output_attributes.length - 1 ? '' : ','%>
<% end -%>
<% if !output_attributes.empty? -%>
    ))
<% end -%>
  end

  it "renders attributes in <p>" do
    render
<% for attribute in output_attributes -%>
    rendered.should contain(<%= value_for(attribute) %>.to_s)
<% end -%>
  end
end
