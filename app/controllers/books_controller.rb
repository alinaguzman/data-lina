class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :admin_required

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      CreateDatum.new(@book).execute
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    datum = Datum.find_entry(@book)
    Book.transaction do
      @book.destroy
      datum.destroy
    end
    redirect_to runs_url, notice: 'Book was successfully destroyed.'
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:length, :author, :name, :format, :genre, :started, :date, :description, :rating)
  end
end
