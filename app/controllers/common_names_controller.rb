class CommonNamesController < InheritedResources::Base
  respond_to :html, :xml, :json , :js

  def get_common_names
    #debugger
    if (params[:term])
      @common_names = CommonName.find(:all, :conditions => ['name ilike ?', '%'+ params[:term] +'%'])
    else
      @common_names = CommonName.all
    end
    #debugger
    render :json => @common_names

#   respond_to do |format|
#      format.json { render :json => @common_names}
#    end

  end

  def edit
    #debugger

    if (params[:source])
      @common_name = CommonName.find(params[:edit_common_name])
      @taxon_concept = @common_name.taxon_concepts.first
      respond_to do |format|
        format.js { render "taxon_concepts/common_names/edit_common_name.js.erb" }
      end
    else
      edit!
    end
  end

  def get_json_test

    
  end
end
