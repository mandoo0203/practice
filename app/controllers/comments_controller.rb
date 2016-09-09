class CommentsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :check_owner!, only: [:destroy]
    
    
    def create
        
        new_comment = Comment.new(content: params[:content],
                                post_id: params[:post_id],
                                user_id: current_user.id)
        
        new_comment.save
        redirect_to :back
        
        
        
        
    end
    
    
    def destroy
        # comment = Comment.find_by(id: params[:id])
        # thanks to before_action
        @comment.destroy
        redirect_to :back
        
        
    end
    
    private
        def check_owner!
            @comment = Comment.find_by(id: params[:id])
            redirect_to :root_path if @comment.user_id != current_user.id
        end
        
    
end
