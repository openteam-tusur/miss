class DateInput < Formtastic::Inputs::StringInput
  def input_html_options
    value = I18n.l(@object.send(method) || Time.zone.now, format: '%d.%m.%Y %H:%M')
    super.merge(class: 'date')
    super.merge(value: value)
  end
end
