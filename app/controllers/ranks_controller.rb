class RanksController < InheritedResources::Base

  respond_to :html, :xml, :json , :js

  def new
    #debugger
    new! do |format|
      format.js {render "ranks/edit"}
    end
  end

  def create
    create! do |format|
      format.js {render "rank_tree/refresh_rank"}
    end
  end

  def update
   # debugger
    update! do |format|
      format.js { render "rank_tree/refresh_rank"}
    end

  end

  def edit
   # debugger
    @rank = Rank.where(:name => params[:id]).first
    respond_to do |format|
      format.js {render "ranks/edit"}
    end

  end

  def delete_rank
    #debugger
    @rank = Rank.find(params[:id])
    @rank.destroy
    flash[:notice] = "Successfully destroyed rank."
    redirect_to ranks_url

  end

  def get_ranks_display
    #debugger

    key = params[:id]

    @json =[]
    @json = Rank.all.each_with_object([]){|obj, hash|
      element = {:data => obj.name, :attr => {:id => obj.name }, :state => 'opened'}
      hash << element


    }
    render :json => @json.to_json , :callback => params[:callback]

  end

  def sort
    # debugger
    rank = params[:rank]
    position = params[:position]

    Rank.where(:name => rank).first.insert_at(position.to_i + 1)
    render "/rank_tree/refresh_rank"

  end

  def get_rank
    @rank = Rank.where(:name => params[:id] ).first
    #debugger
    render :json => @rank.to_json
  end

end
