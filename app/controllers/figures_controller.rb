class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/' do
    redirect to '/figures'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @title = Title.create(params[:title])
    @figure.titles << @title
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
    @figure.save
    redirect '/figures'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @title = Title.create(params[:title])
    @figure.titles << @title
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end