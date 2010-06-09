class TaxonConceptsController < InheritedResources::Base
  respond_to :html, :xml, :json , :js

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
      format.js {render :action => 'update_' + params[:tag_list].to_s.downcase + '.js.erb' }
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
      format.js {render :action => 'update_' + params[:tag_list].to_s.downcase + '.js.erb'}
    end
  end

  def add_comment
    debugger
    @taxon_concept = TaxonConcept.find(params[:model])
    @taxon_concept.comments.create(:comment => params[:new_comment], :user => current_user).save;
    flash[:notice]= ("Comment added successfully!")

    respond_to do |format|
      format.js { render :action => "add_comment.js.erb"   }
    end
  end

  def delete_comment

    @comment = Comment.find(params[:delete_comment])
    @taxon_concept = @comment.commentable
    @comment_id = @comment.id
    debugger
    @comment.destroy

    #Add the user to the archived comment
    Comment::Archive.find(@comment_id).deleted_by = current_user

    respond_to do |format|
      format.js { render :action => "add_comment.js.erb"   }
    end

  end

   def create_common_name
    debugger
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
      format.js { render :action => "common_names/add_common_name.js.erb"   }
    end
  end

end


