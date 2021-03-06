class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  include SessionsHelper
  def index
     @article = Article.find(params[:article_id])
    @comments = @article.comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    puts @comment.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new(:article_id => @article.id)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

 
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    @comment.user_id=current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@article, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { redirect_to(@article, :notice => 
        'Comment could not be saved. Please fill in all fields')}
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
 
 def update
    @comment = Comment.find(params[:id])
    @article = @comment.article
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@article, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json

def destroy
    @comment = Comment.find(params[:id])
    @article = Article.find(params[:article_id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(@article, :notice => 'Comment was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end
