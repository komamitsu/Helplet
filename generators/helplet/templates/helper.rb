module HelpHelper
  def get_help(p)
    javascript_include_tag('prototype') +
    link_to_remote(p[:disp_name], 
       :url => { 
          :controller => :helps, :action => :get,
          :key => p[:key], :div_id => p[:div_id], :edit => p[:edit]
    })
  end
end

