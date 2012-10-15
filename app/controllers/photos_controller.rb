class PhotosController < ApplicationController
  def index
    
  end
  def show
    @photo = Photo.find_by_id(params[:id])
    album = @photo.album
    album.update_attribute(:views,album.views.to_i.next)
    @photo.update_attribute(:views,@photo.views.to_i.next)
    @photos = Photo.where(:album_id=> @photo.album_id).order("carma DESC")    
    @type = 'photo_id'
    @id = params[:id]
    @comments = Comment.nested_set.where(:photo_id=>params[:id])
    @users = @photo.users
  end
  
  def new
    Photo.new
  end
  
  def create 
    p_attr = params[:photo]
    p_attr[:img] = params[:photo][:img].first if params[:photo][:img].class == Array
    @picture = Photo.new(p_attr)
    if @picture.save
     # @picture.update_attribute(:image, p_attr[:img].original_filename )
      respond_to do |format|
        format.html {                                         #(html response is for browsers using iframe sollution)
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end
  def remove_photo
    photo = Photo.find_by_id(params[:id])
    if !photo.destroy
      @err = "NOT_DESTROY"
    end      
  end
  def destroy
    @picture = Photo.find(params[:id])
    @picture.destroy
    render :json => true
  end
  
  def register     

    if signed_in?
      register = current_user.user_photo_relations.new(:photo_id=>params[:photo_id])
      register.save!
    else
      @err = "NOT_AUTHORIZED"
    end
    @photo = Photo.find_by_id( params[:photo_id] )
    @users = @photo.users
  end
  
  def unregister
    @photo = Photo.find_by_id( params[:photo_id] )
    @users = @photo.users
    if signed_in?
      current_user.user_photo_relations.where(:photo_id=>params[:photo_id]).first.destroy
    end
    respond_to do |format|
      format.html 
      format.js
    end
   
  end
  
  def on_photo
    if current_user && current_user.on_photo?(params[:photo_id])
      render :text => "true"
    else
      render :text => "false"
    end
  end
  def object_photos
    @object = Objects.find_by_id(params[:id])
    @photos = Photo.where(:objects_id => params[:id] )
  end
end
