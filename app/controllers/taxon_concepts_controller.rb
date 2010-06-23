class TaxonConceptsController < InheritedResources::Base
  respond_to :html, :xml, :json , :js

  def create
    #debugger
    create!
  end

  def update
    update! {taxon_concepts_path}
  end

  def create_tag
    #debugger
    @status = params[:new_tag]
    GenericMethods.add_tag params[:model],params[:new_tag], params[:tag_list]
    #TaxonConcept.try(:first).add_status @status
    #@value = 'create_' + params[:tag_list].to_s.downcase + '.js.erb'
    #debugger
    #there is same functionality in both after-events of a create_tag and an event_tag, hence this has been
    #refactored into one update_tag.js.erb file
    respond_to do |format|
      #format.html {redirect_to taxon_concepts_path}
      format.js {render 'update_' + params[:tag_list].to_s.downcase + '.js.erb' }
    end
  end

  def delete_tag
    #debugger
    @status = params[:delete_tag]
    GenericMethods.delete_tag params[:model], params[:delete_tag], params[:tag_list]
    #TaxonConcept.try(:first).delete_status @status
    #flash[:notice] = @status + " status has been deleted!"
    respond_to do |format|
      #format.html {redirect_to taxon_concepts_path}
      format.js {render :action => 'delete_' + params[:tag_list].to_s.downcase + '.js.erb'}
    end
  end

  def update_tag
    #debugger
    GenericMethods.update_tag params[:model],params[:old_tag], params[:new_tag], params[:tag_list] ,params[:model_field]
    #TaxonConcept.try(:first).update_status(params[:old_tag], params[:new_tag])
    #flash[:notice] =  " Status has been updated!"
    @message = "This is a message from the controller"
    respond_to do |format|
      #format.html {redirect_to taxon_concepts_path}
      format.js {render 'update_' + params[:tag_list].to_s.downcase + '.js.erb'}
    end
  end

  def add_comment
    #debugger
    @taxon_concept = TaxonConcept.find(params[:model])
    @taxon_concept.comments.create(:comment => params[:new_comment], :user => current_user).save;
    #flash[:notice]= ("Comment added successfully!")

    render "add_comment.js.erb"

  end

  def delete_comment

    @comment = Comment.find(params[:delete_comment])
    @taxon_concept = @comment.commentable
    @comment_id = @comment.id
    #debugger
    @comment.destroy

    #Add the user to the archived comment
    Comment::Archive.find(@comment_id).deleted_by = current_user

    respond_to do |format|
      format.js { render :action => "add_comment.js.erb"   }
    end

  end

  def create_common_name
    #debugger
    @common_name = CommonName.new(params[:common_name])
    @common_name.user = current_user;
    if @common_name.save
      @message = "Successfully created common name."
    end
    @taxon_concept = TaxonConcept.find(params[:model])
    @taxon_concept.common_names << @common_name
#    flash[:notice]= ("Common name added successfully!")
    @message = "Common Name added!"

    respond_to do |format|
      format.js { render "taxon_concepts/common_names/add_common_name" }
    end
  end

  def update_common_name
    @common_name = CommonName.find(params[:common_name_id])
    @taxon_concept = TaxonConcept.find(params[:model])
    if (@common_name.update_attributes(params[:common_name]))
      render "taxon_concepts/common_names/add_common_name"
    end

  end

  def cancel_common_name
    #debugger
    @common_name = CommonName.new
    @taxon_concept = TaxonConcept.find(params[:model])
    render "taxon_concepts/common_names/cancel_common_name"
  end

  def delete_common_name
    #debugger
    @common_name = CommonName.find(params[:delete_common_name])
    @taxon_concept = @common_name.taxon_concepts.first

    @taxon_concept.delete_common_name @common_name

    respond_to do |format|
      format.js { render "taxon_concepts/common_names/add_common_name" }
    end
  end


 

end


