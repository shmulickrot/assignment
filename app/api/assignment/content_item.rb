module Assignment
  class ContentItem < Grape::API
    resource :items do
      get :get_items
    end
  end
end