class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
    respond_to do |format|
      format.json { render json: @customers }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @customer }
    end
  end

  def new
    @customer = Customer.new
    respond_to do |format|
      format.json { render json: @customer }
    end
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.json
      else
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.json
      else
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def search
    @customers = Customer.search(params[:query])
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone, :email, :street, :city)
    end
end
