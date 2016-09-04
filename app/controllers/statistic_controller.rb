class StatisticController < ApplicationController
  def index
    if User.find(session[:user_id]).admin
    @comment=Comment.group("DATE(created_at)").count
    @comments=Comment.all.size
    @posts=Post.all.size
    @post=Post.group("DATE(created_at)").count
    @act=Activity.where(action:"attempt_login").group("DATE(created_at)").count
    @activity=Activity.where(action:"attempt_login").count
    else
      @comment=Comment.where(user_id:session[:user_id]).group("DATE(created_at)").count
      @post=Post.where(user_id:session[:user_id]).group("DATE(created_at)").count
      @posts=Post.where(user_id:session[:user_id]).size
      @act=Activity.where(user_id:session[:user_id], action:"attempt_login").group("DATE(created_at)").count
      @activity=Activity.where(user_id:session[:user_id],action:"attempt_login").count
      @comments=Comment.where(user_id:session[:user_id]).size
    end
  end
end
