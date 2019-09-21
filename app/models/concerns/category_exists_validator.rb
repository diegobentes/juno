class CategoryExistsValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        unless Category.where(id: value).any?
            record.errors[attribute] << ( options[:message] || "não existe" )
        end
    end
end