class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # we need `list_id` to associate bookmark with corresponding list
    @list = list.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark.delete
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
  
end
