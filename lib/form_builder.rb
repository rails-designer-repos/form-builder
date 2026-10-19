class FormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper
  include RailsIcons::Helpers::IconHelper

  %w[
    text_field
    email_field
    password_field
    search_field
    telephone_field
    url_field
    number_field
    date_field
    time_field
    datetime_field
    datetime_local_field
    month_field
    week_field
  ].each do |field_type|
    define_method(field_type) do |method, options = {}|
      options[:class] = options[:class].presence || class_names(input_css, options[:additional_class])
      options.delete(:additional_class)

      super(method, options)
    end
  end
  alias_method :phone_field, :telephone_field

  def text_area(method, options = {})
    options[:class] = options[:class].presence || class_names(input_css, options[:additional_class])
    options.delete(:additional_class)

    super
  end
  alias_method :textarea, :text_area

  def rich_text_area(method, options = {})
    options[:class] = options[:class].presence || class_names(input_css, options[:additional_class])
    options.delete(:additional_class)

    super
  end

  def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
    options[:class] = options[:class].presence || class_names(toggle_input_css, options[:additional_class])
    label_text = block_given? ? @template.capture { yield } : options.delete(:label) || method.to_s.humanize
    options.delete(:additional_class)

    toggle_wrapper do
      super(method, options, checked_value, unchecked_value) + label(method, label_text)
    end
  end
  alias_method :checkbox, :check_box

  def radio_button(method, tag_value, options = {})
    return super if options.delete(:plain)

    options[:class] = options[:class].presence || class_names(toggle_input_css, options[:additional_class])
    label_text = block_given? ? @template.capture { yield } : options.delete(:label) || tag_value.to_s.humanize
    options.delete(:additional_class)

    toggle_wrapper do
      super(method, tag_value, options) + toggle_label("#{method}_#{tag_value}", label_text)
    end
  end

  def select(method, choices = nil, options = {}, html_options = {})
    html_options[:class] = html_options[:class].presence || class_names(
      input_css,
      "bg-[length:16px] bg-[right_6px_center] bg-no-repeat pr-8",
      "bg-[url('data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2020%2020%22%20fill%3D%22%236b7280%22%3E%3Cpath%20fill-rule%3D%22evenodd%22%20d%3D%22M5.23%207.21a.75.75%200%20011.06.02L10%2011.168l3.71-3.938a.75.75%200%20111.08%201.04l-4.25%204.5a.75.75%200%2001-1.08%200l-4.25-4.5a.75.75%200%2001.02-1.06z%22%20clip-rule%3D%22evenodd%22%2F%3E%3C%2Fsvg%3E')]",
      html_options[:additional_class]
    )
    options.delete(:additional_class)

    super
  end

  def file_field(method, options = {})
    options[:class] = options[:class].presence || class_names(file_field_css, options[:additional_class])
    options.delete(:additional_class)

    super
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    html_options[:class] = html_options[:class].presence || class_names(
      input_css,
      "bg-[length:16px] bg-[right_6px_center] bg-no-repeat pr-8",
      "bg-[url('data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2020%2020%22%20fill%3D%22%236b7280%22%3E%3Cpath%20fill-rule%3D%22evenodd%22%20d%3D%22M5.23%207.21a.75.75%200%20011.06.02L10%2011.168l3.71-3.938a.75.75%200%20111.08%201.04l-4.25%204.5a.75.75%200%2001-1.08%200l-4.25-4.5a.75.75%200%2001.02-1.06z%22%20clip-rule%3D%22evenodd%22%2F%3E%3C%2Fsvg%3E')]",
      html_options[:additional_class]
    )
    options.delete(:additional_class)

    super
  end

  def grouped_collection_select(method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
    html_options[:class] = html_options[:class].presence || class_names(
      input_css,
      "bg-[length:16px] bg-[right_6px_center] bg-no-repeat pr-8",
      "bg-[url('data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2020%2020%22%20fill%3D%22%236b7280%22%3E%3Cpath%20fill-rule%3D%22evenodd%22%20d%3D%22M5.23%207.21a.75.75%200%20011.06.02L10%2011.168l3.71-3.938a.75.75%200%20111.08%201.04l-4.25%204.5a.75.75%200%2001-1.08%200l-4.25-4.5a.75.75%200%2001.02-1.06z%22%20clip-rule%3D%22evenodd%22%2F%3E%3C%2Fsvg%3E')]",
      html_options[:additional_class]
    )
    options.delete(:additional_class)

    super
  end

  def collection_check_boxes(method, collection, value_method, text_method, options = {}, html_options = {})
    html_options[:class] = html_options[:class].presence || class_names(toggle_input_css, "rounded-sm", options[:additional_class])

    toggle_wrapper do
      @template.collection_check_boxes(object_name, method, collection, value_method, text_method, options, html_options) do |template|
        checked = Array(@object.send(method)).map(&:to_s).include?(template.value.to_s)
        template.check_box(checked: checked, class: html_options[:class]) + toggle_label("#{method}_#{template.value.to_s.underscore}", template.text)
      end
    end
  end
  alias_method :collection_checkboxes, :collection_check_boxes

  def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {})
    html_options[:class] = html_options[:class].presence || class_names(toggle_input_css, options[:additional_class])

    toggle_wrapper do
      @template.collection_radio_buttons(object_name, method, collection, value_method, text_method, options, html_options) do |template|
        template.radio_button(class: html_options[:class]) + toggle_label("#{method}_#{template.value.to_s.underscore}", template.text)
      end
    end
  end

  def input(attribute, options = {})
    label_suffix = options.delete(:label_suffix)
    hint = options.delete(:hint) || I18n.t("hints.#{attribute}", default: nil)

    @template.content_tag(:div, data: {slot: "field"}, class: options[:field_css] || field_css) do
      label_html = label(attribute, options)

      @template.safe_join([
        (if label_suffix && label_html
           @template.content_tag(:div, class: "flex items-center justify-between") do
             @template.safe_join([label_html, @template.content_tag(:span, label_suffix.html_safe, class: "text-xs font-normal text-gray-500")].compact)
           end
         end),

        (label_html unless label_suffix),

        input_field(attribute, options),

        (@template.content_tag(:p, hint.html_safe, class: "mt-0.5 px-0.5 text-xs font-light text-gray-500") if hint)
      ].compact)
    end
  end

  def label(attribute, text = nil, options = {}, &block)
    text, options = nil, text if text.is_a?(Hash)
    return if options[:label] == false
    label_options = options[:label] || {}
    field_errors = @object.respond_to?(:errors) ? @object.errors.where(attribute) : nil

    label_options[:class] = token_list("flex items-center gap-1 text-sm font-normal text-gray-600", {"text-gray-600": field_errors&.none?, "text-red-600": field_errors&.any?})
    label_text = text || I18n.t("labels.#{attribute}", default: attribute.to_s.humanize)

    super(attribute, label_options) do
      safe_join([
        (icon("circle-alert", class: "size-3.5 scale-100 transition ml-0 ease-in-out duration-300 starting:ml-3.5 starting:scale-0") if field_errors&.any?),
        label_text.html_safe? ? label_text : label_text.to_s
      ].compact)
    end
  end

  private

  def field_css = "w-full [&[data-slot='field']+[data-slot='field']]:mt-4"

  def input_css
    <<~CSS
      w-full px-2.5 py-1.5
      text-sm font-normal text-gray-900
      bg-white
      border-0 ring ring-gray-200/80 rounded-sm
      hover:ring-gray-300
      disabled:opacity-50 disabled:hover:ring-gray-200/80
      outline-none
      focus:bg-white focus:ring focus:ring-brand-300
      appearance-none
    CSS
  end

  def file_field_css
    <<~CSS
      w-full py-1.5
      text-sm font-normal text-gray-600
      disabled:opacity-50
      file:mr-2 file:py-1 file:px-4
      file:text-xs file:font-medium
      file:bg-gray-100 file:text-gray-700
      file:rounded-full file:border-0
      hover:file:bg-gray-200
      focus:outline-hidden focus:ring-0
    CSS
  end

  def toggle_input_css
    <<~CSS
      peer
      accent-gray-800
      border border-gray-900
      rounded-sm
      focus:outline-hidden focus:ring focus:ring-offset-1 focus:ring-gray-600
      disabled:opacity-25 disabled:cursor-not-allowed
    CSS
  end

  def toggle_label_css
    <<~CSS
      block text-sm font-normal text-gray-800 peer-disabled:opacity-50 peer-disabled:cursor-not-allowed
    CSS
  end

  def toggle_wrapper(&block)
    content_tag(:div, yield, data: {slot: "field"}, class: "flex items-start gap-x-2 [&>input]:mt-[0.15em]")
  end

  def toggle_label(method, text)
    label(method, text.html_safe, class: toggle_label_css)
  end

  def input_field(attribute, options)
    return select(attribute, options[:collection], {}, options.except(:as, :label, :collection)) if options[:collection]

    send(FIELD_TYPES.fetch(options[:as] || type_for(attribute), :text_field), attribute, options.except(:as, :label, :collection))
  end

  def type_for(attribute)
    return :email if attribute.to_s.end_with?("email")
    return :password if attribute.to_s.include?("password")
    return :url if attribute.match?(/url|website|site/)
    return :string unless valid?(attribute)

    @object.type_for_attribute(attribute.to_s).type
  rescue NoMethodError
    :string
  end

  def valid?(attribute)
    @object.respond_to?(attribute) &&
      @object.respond_to?(:has_attribute?) &&
      @object.has_attribute?(attribute)
  end

  FIELD_TYPES = {
    string: :text_field,
    email: :email_field,
    password: :password_field,
    url: :url_field,
    text: :text_area,
    rich_text: :rich_text_area,
    integer: :number_field,
    float: :number_field,
    decimal: :number_field,
    datetime: :datetime_local_field,
    date: :date_field
  }
end
