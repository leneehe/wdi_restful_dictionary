class EntriesController < ApplicationController

  def index
    @entries = Entry.all
    render :index
  end

  def show
    @entry = Entry.find(params[:id])
    render :show
  end

  def new
    @entry = Entry.new
    render :new
  end

  def create
    entry = Entry.new(
      word: params[:entry][:word],
      definition: params[:entry][:definition],
      language: params[:entry][:language]
    )
    entry.save
    redirect_to entry_path(entry.id)
  end

  def edit
    @entry = Entry.find(params[:id])
    render :edit
  end

  def update
      entry = Entry.find(params[:id])
      entry.update(
        word: params[:entry][:word],
        definition: params[:entry][:definition],
        language: params[:entry][:language]
      )
    redirect_to entry_path(params[:id])
  end

  def destroy
    entry = Entry.find(params[:id])
    entry.delete
    redirect_to entries_url
  end
end
