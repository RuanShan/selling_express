module ApplicationHelper
  def flash_alert flash
    #<% flash.each do |name, msg| %>
    #  <%= content_tag :div, class: "alert alert-#{ name == :error ? "danger" : "success" } alert-dismissable", role: "alert" do %>
    #    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    #    <%= msg %>
    #  <% end %>
    #<% end %>
    if flash.present?
      message = flash[:error] || flash[:notice] || flash[:success]
      flash_class = "danger" if flash[:error]
      flash_class = "info" if flash[:notice]
      flash_class = "success" if flash[:success]
      flash_div = content_tag(:div, message, class: "alert alert-#{flash_class} alert-auto-disappear")
      content_tag(:div, flash_div, class: 'col-md-12')
    end
  end


  # Makes an admin navigation tab (<li> tag) that links to a routing resource under /admin.
  # The arguments should be a list of symbolized controller names that will cause this tab to
  # be highlighted, with the first being the name of the resouce to link (uses URL helpers).
  #
  # Option hash may follow. Valid options are
  #   * :label to override link text, otherwise based on the first resource name (translated)
  #   * :route to override automatically determining the default route
  #   * :match_path as an alternative way to control when the tab is active, /products would
  #     match /admin/products, /admin/products/5/variants etc.  Can be a String or a Regexp.
  #     Controller names are ignored if :match_path is provided.
  #
  # Example:
  #   # Link to /admin/orders, also highlight tab for ProductsController and ShipmentsController
  #   tab :orders, :products, :shipments
  def tab(*args)
    options = { label: args.first.to_s }

    # Return if resource is found and user is not allowed to :admin
    #return '' if klass = klass_for(options[:label])

    if args.last.is_a?(Hash)
      options = options.merge(args.pop)
    end
    options[:route] ||=  "#{args.first}"

    destination_url = options[:url] || send("#{options[:route]}_path")
    titleized_label = t(options[:label], default: options[:label], scope: [:admin, :tab]).titleize

    css_classes = ['sidebar-menu-item']

    if options[:icon]
      link = link_to_with_icon(options[:icon], titleized_label, destination_url)
    else
      link = link_to(titleized_label, destination_url)
    end

    selected = if options[:match_path].is_a? Regexp
      request.fullpath =~ options[:match_path]
    elsif options[:match_path]
      request.fullpath.starts_with?("#{options[:match_path]}")
    else
      args.include?(controller.controller_name.to_sym)
    end
    css_classes << 'selected' if selected

    if options[:css_class]
      css_classes << options[:css_class]
    end
    content_tag('li', link, class: css_classes.join(' '))
  end

  def link_to_with_icon(icon_name, text, url, options = {})
    options[:class] = (options[:class].to_s + " icon-link with-tip action-#{icon_name}").strip
    options[:class] += ' no-text' if options[:no_text]
    options[:title] = text if options[:no_text]
    text = options[:no_text] ? '' : content_tag(:span, text, class: 'text')
    options.delete(:no_text)
    if icon_name
      icon = content_tag(:span, '', class: "icon icon-#{icon_name}")
      text.insert(0, icon + ' ')
    end
    link_to(text.html_safe, url, options)
  end

  def main_part_classes
    if cookies['sidebar-minimized'] == 'true'
      return 'col-sm-12 col-md-12 sidebar-collapsed'
    else
      return 'col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2'
    end
  end
  
  def wrapper_classes
    if cookies['sidebar-minimized'] == 'true'
      return 'sidebar-minimized'
    end
  end
  # finds class for a given symbol / string
  #
  # Example :
  # :products returns Spree::Product
  # :my_products returns MyProduct if MyProduct is defined
  # :my_products returns My::Product if My::Product is defined
  # if cannot constantize it returns nil
  # This will allow us to use cancan abilities on tab
  def klass_for(name)
    model_name = name.to_s

    ["{model_name.classify}", model_name.classify, model_name.gsub('_', '/').classify].find do |t|
      t.safe_constantize
    end.try(:safe_constantize)
  end
end
