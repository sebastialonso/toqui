module Toqui
  module RegistrationsHelper 
    def user_class_attributes
      Toqui.user_class.attribute_names - ["created_at", "updated_at", "id"]
    end

    def user_attribute_type attrib
      Toqui.user_class.columns_hash[attrib].type
    end

    def params_name_for_user_class
      Toqui.user_class.to_s.downcase.to_sym
    end

    def input_for attrib, form
      case user_attribute_type(attrib)
      when :string
        form.text_field attrib.to_sym
      when :integer
        form.number_field attrib.to_sym
      end
    end

    def label_for attrib, form
      form.label attrib.to_sym
    end
  end
end
