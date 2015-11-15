module ActiveAdminHelper
  def aa_enum_select(class_name, enum_name)
    e = class_name.to_s.classify.constantize.send(enum_name.to_s.pluralize)
    {
      as: :select,
      collection: e.keys,
      default:e.keys.first,
      include_blank: false
    }
  end

  def aa_subclass_select(class_name)
    {
      as: :select,
      collection: class_name.to_s.classify.constantize.subclasses.map{|subclass| subclass.name},
      include_blank: false
    }
  end
end
