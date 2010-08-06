require 'rails/generators'
require 'rails/generators/erb/scaffold/scaffold_generator'

module Ouscaffold
  module Generators
    class ErbGenerator < Erb::Generators::ScaffoldGenerator
      source_root File.join(File.dirname(__FILE__), 'templates')

      argument :attributes, :type => :array, :default => [], :banner => "field:type[:option] field:type[:option]"

      class_option :confirm,  :type => :boolean, :default => true,  :desc => "Need input confirmation"
      class_option :as_draft, :type => :boolean, :default => false, :desc => "Implement confirmation using draft column (not implemented)"

      def available_views
        if options[:confirm]
          %w(index edit show new _form confirm_new confirm_edit _confirm)
        else
          %w(index edit show new _form)
        end
      end
            
    end
  end
end

