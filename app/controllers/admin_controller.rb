class AdminController < ActionController::Base

  before_action :authenticate, except: [:login, :checkLogin, :logout]

  def index
    @products = Product.all
    @users = User.all
    @brands = Brand.all
    render layout: 'application'
  end

  def login
    render layout: 'application'
  end

  def checkLogin
    user = User.find_by_email(params[:user][:email])
    digestPasword =  Digest::SHA2.hexdigest params[:user][:password]
    if user.password == digestPasword and user.type_user == 2
      session[:email] = user.email
      session[:token] = user.token
      redirect_to admin_index_path
    else
      redirect_to admin_login_path
    end
  end

  def logout
    reset_session
    redirect_to admin_login_path
  end

  #Brand
  # ############################
  def newBrand
    @brand = Brand.new
    render layout: 'application'
  end

  def editBrand
    @brand = Brand.find(params[:id])
    render layout: 'application'
  end

  # Product
  # ############################
  def newProduct
    @product = Product.new
    @brands = Brand.all
    render layout: 'application'
  end

  def editProduct
    @product = Product.find(params[:id])
    render layout: 'application'
  end

  def newSize
    @size = Size.new
    @productId = params[:id]
    render layout: 'application'
  end

  def editSize
    @size = Size.find(params[:id])
    @productId = params[:id]
    render layout: 'application'
  end

  def manageSize
    @sizes = Size.where(product_id: params[:id]).order('number ASC')
    @product = Product.find(params[:id])
    render layout: 'application'
  end

  def destroySize
    size = Size.find(params[:id])
    size.destroy
  end

  def destroyProduct
  end

  private
    def authenticate
      if session[:email] == nil
        redirect_to admin_login_path
      else
        @login = true
      end
    end


end
