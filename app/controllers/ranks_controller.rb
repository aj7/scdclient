class RanksController < InheritedResources::Base


  def get_ranks_display
    debugger
    
    key = params[:id]

    @json =[]
    @json = Rank.all.each_with_object([]){|obj, hash|
      element = {:data => obj.name, :attr => {:id => obj.name }, :state => 'opened'}
      hash << element

    }
    render :json => @json.to_json , :callback => params[:callback]
    
  end
end
