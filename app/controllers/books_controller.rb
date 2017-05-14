#BOOK SHELF
get '/books' do
  @books = Book.all
  erb :'books/index'
end
# BOOK INFO
get '/books/:id' do
  @book = Book.find(params[:id])
  @user = User.find(@book.owner_id)
  erb :'books/show'
end

# get '/users/:owner_id/books/:id' do
#   @user = User.find(params[:owner_id])
#   @book = @user.books.find(params[:id])
#   erb :'books/show'
# end

#ADD NEW BOOK
get '/users/:owner_id/books/new' do
  erb :'books/_new'
end

post '/users/:owner_id/books' do
  if !current_user
    @errors = ['You need to login first']
    erb :'sessions/new'
  else
    @user = current_user
    @book = @user.books.new(params[:book])
    @book.owner_id = @user.id
    if @book.save
      redirect "/users/#{@user.id}"
    else
      @errors = @book.errors.full_messages
      erb :'books/_new'
    end
  end
end
#EDIT A BOOK IN SHELF
get '/users/:owner_id/books/edit' do
  @user = current_user
  @book = @user.books.find_by(owner_id: params[:owner_id])
  erb :'books/edit'
end

put '/users/:owner_id/books/:id' do
  @user = current_user
  @book = @user.books.find_by(owner_id: params[:owner_id])
  @book.assign_attributes(params[:book])
  if @book.save
    redirect "/users/#{@user.id}"
  else
    @errors = @book.errors.full_messages
    erb :'books/edit'
  end
end

delete '/users/:owner_id/books/:id' do
  @user = User.find(params[:owner_id])
  @book = @user.books.find(params[:id])
  @book.destroy
  redirect "/users/#{@user.id}"
end



