ActiveAdmin.register Article do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  permit_params :list, :of, :attributes, :on, :model
  
  # custom form
  # @see [【随時更新】ActiveAdminのカスタマイズあれこれ - 49hack]{@link http://paranishian.hateblo.jp/entry/activeadmin/customize-example}
  form do |f|
    inputs 'Details' do
      input :title, label: 'Title'
      input :content, label: 'Content'
    end
    panel 'Current' do
      div raw "<b>Title</b>: #{resource.title}"
      div raw "<b>Content</b>: #{resource.content}"
    end
    actions
  end
end
