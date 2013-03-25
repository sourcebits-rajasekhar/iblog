class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  require 'net/http'
  require 'oauth2'
  def index
    
    # api_client_obj = OAuth2::Client.new('1028167159482.apps.googleusercontent.com','DX91zikpNgET_mZA1cctablE', {:site => 'https://www.googleapis.com/'})
    # api_access_token_obj = OAuth2::AccessToken.new(api_client_obj, 'ya29.AHES6ZS0mtz4QJhii8XQGyNZ0LepD1ep5dmKi_MrkW0Hcw')
    # response=api_access_token_obj.post('/tracks/v1/geofences/create',{ :geofences =>[ { :name => "Inside" , :polygon => { :invert => false , :loops => [ { :vertices => [{:lat=> 45, :lng => -111 },
    #                                      { :lat=> 45, :lng => -104 },{ :lat=> 41,:lng => -104 }, { :lat=> 41, :lng => -111 } ]}]} }]})

    # puts response.to_s
    
    @articles = Article.order('created_at DESC').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
