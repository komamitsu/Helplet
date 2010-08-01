require 'erb'

class HelpsController < ApplicationController
  # GET /helps/get?key=xxxx&div_id=yyyy
  def get
    @help = Help.find_by_key(params[:key]) || Help.new(:key => params[:key], :title => '', :description => '')
    html = get_html(params[:edit])
    if request.xhr?
      render :update do |page|
        page[params[:div_id]].replace_html html
      end
    else
      render :text => html
    end
  end

  # POST /helps/update/id
  def update
    begin
      @help = Help.find(params[:help][:id])
    rescue ActiveRecord::RecordNotFound
      @help = Help.new
    end

    if @help.update_attributes(params[:help])
      render :text => 'OK'
    else
      render :text => 'NG', :status => 500
    end
  end

  private
  def get_html(edit = nil)
    if edit.blank?
      template = File.join RAILS_ROOT, 'config/helplet/template_normal.erb'
    else
      template = File.join RAILS_ROOT, 'config/helplet/template_edit.erb'
    end
    render_to_string :file => template, :layout => false
  end
end
