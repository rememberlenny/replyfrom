module SeoHelper

  def set_display_meta_tags

    #title
    title = I18n.t('brand.name')
    og_image = image_url('logo.png')
    url = request.url
    if @set_title
      set_meta_tags :site => @set_title + ' - ' + title
      set_meta_tags :og => {:title => @set_title + ' - ' + title, :type => 'website', :url => url, :image => og_image}
    else
      set_meta_tags :site => title
      set_meta_tags :og => {:title => title, :type => 'website', :url => url, :image => og_image}
    end

    #description
    if @set_meta_description
      set_meta_tags :description => @set_meta_description + ' | ' + I18n.t('meta.description')
      set_meta_tags :og => {:description => @set_meta_description + ' | ' + I18n.t('meta.description')}
    else
      set_meta_tags :description => I18n.t('meta.description')
      set_meta_tags :og => {:description => I18n.t('meta.description')}
    end

    #keyword
    if @set_meta_keyword
      set_meta_tags :keyword => @set_meta_keyword + ',' + I18n.t('meta.keywords') + ',' + title
    else
      set_meta_tags :keyword => I18n.t('meta.keywords') + ', ' + title
    end

    # set_meta_tags :fb => {:admins => = I18n.t('meta.og').app_id}
    set_meta_tags :fb => {:app_id => I18n.t('meta.og.app_id')}
    set_meta_tags :canonical => request.url
    set_meta_tags :og => {:url => request.url}
    # set_meta_tags icon: image_url('emailstand-96.png'), type: 'image/png'
    display_meta_tags
  end

end
