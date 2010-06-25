class RankTreeController < InheritedResources::Base
  respond_to :html, :xml, :json , :js

  def get_ranks
    #debugger
    key = params[:key]

    @json =[]
    if (key == "ranks")
      @json = TaxonConcept.taxon_rank_counts.each_with_object([]) { |obj , hash|


        element = {:title => obj.name, :key => "taxon_" + obj.name, :isLazy => true, :isFolder => !TaxonConcept.find_all_by_rank(obj.name).empty?}
        hash << element
      }

    elsif (key.include? '_')
      if key.split('_').first() == "taxon"
        @json = TaxonConcept.find_all_by_rank(key.split('_').at(1)).each_with_object([]){|obj , hash|
          element = {:title => obj.taxon_name.scientific_name, :key => "name_" + obj.taxon_name.scientific_name, :isLazy => true}
          hash << element

        }
      end
    else
      @json = {:title => "nothing here", :key => "a key", :isLazy => true}

    end


    render :json => @json.to_json , :callback => params[:callback]

    #  render "taxon_concepts/ranks/tree.json.erb"
#
#    respond_to do |format|
#      format.json { render "taxon_concepts/ranks/tree.json.erb"}
#    end


  end

  def get_ranks_jstree2
    #debugger
    @key = params[:id]
    @json =[]
    if (@key == "ranks")
      @json = TaxonConcept.taxon_rank_counts

    elsif (@key.include? '_')
      if @key.split('_').first() == "taxon"
        @json = TaxonConcept.find_all_by_rank(@key.split('_').at(1))
      elsif @key.split('_').first() == "node"
        @json = TaxonConcept.find(@key.split('_').at(1)).children
      end
    else
      @json = {:data => "nothing here", :attr =>{:id => "a key"} , :state => "closed"}
    end

    render "/rank_tree/tree.json.erb"
  end

  def get_ranks_jstree
    #debugger
    key = params[:id]

    @json =[]
    if (key == "ranks")
      @json = TaxonConcept.taxon_rank_counts.each_with_object([]) { |obj , hash|
        element = {:data => obj.name, :attr => {:id => "taxon_" + obj.name}, :state => "closed", :icon => "./file.png" }
        hash << element
      }

    elsif (key.include? '_')
      if key.split('_').first() == "taxon"
        @json = TaxonConcept.find_all_by_rank(key.split('_').at(1)).each_with_object([]){|obj , hash|
          element = {:data => obj.taxon_name.scientific_name, :attr =>{:id => "name_" + obj.taxon_name.scientific_name}, :state => "closed"}
          hash << element

        }
      end
    else
      @json = {:data => "nothing here", :attr =>{:id => "a key"} , :state => "closed"}

    end


    render :json => @json.to_json , :callback => params[:callback]

    #  render "taxon_concepts/ranks/tree.json.erb"
#
#    respond_to do |format|
#      format.json { render "taxon_concepts/ranks/tree.json.erb"}
#    end


  end

  def add_child_to_node
    #debugger

    parent_id = params[:parent].split('_').at(1)
    child_id = params[:child]

    @taxon_concept_parent = TaxonConcept.find(parent_id)
    @taxon_concept_parent.add_child(child_id)

    render :action => "rank_tree/refresh_tree"
  end

  def check_node_status
    #debugger
    child_id = params[:child]
    status = TaxonConcept.find(child_id).child?
    render :json =>  status
  end

  def get_node_rank

    node_rank = ""
    node_value = params[:node_id]
    if (node_value.include? 'node_' )
      #debugger
      node_rank = TaxonConcept.find(node_value.split('_').at(1)).rank
    end
    render :json => "Species"
  end

end
