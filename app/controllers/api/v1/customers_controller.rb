class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]

  # GET /customers
  def index
    per_page = params[:per_page] ? params[:per_page] : 10
    @customers = Customer.all.paginate(page: params[:page], per_page: per_page)

    if @customers.length >= 1
      render json: {
        status: 'SUCCESS',
        message: 'Successfully loaded',
        data: @customers,
        per_page: per_page.to_i,
        total_data: @customers.count,
        current_page: params[:page].to_i ? params[:page].to_i : 0,
        total_pages: @customers.total_pages
      },
      include: [
        {facilities: {except: [:created_at, :updated_at]}},
        {operations: {except: [:created_at, :updated_at]}},
        {contacts: {except: [:created_at, :updated_at]}},
      ],
      :except => :operation_ids
    else 
      per_page = 0
      total_pages = 0
      render json: {
        status: 'SUCCESS',
        message: 'There are no customers registered on this page',
        data: [],
        per_page: per_page,
        total_data: @customers.count,
        current_page: params[:page].to_i ? params[:page].to_i : 0,
        total_pages: @customers.total_pages
      }
    end
  end

  # GET /customers/1
  def show
    render json: {
      status: 'SUCCESS',
      message: 'Successfully loaded',
      data: @customer
    },
    include: [
      {facilities: {except: [:created_at, :updated_at]}},
      {operations: {except: [:created_at, :updated_at]}},
      {contacts: {except: [:created_at, :updated_at]}}
    ]
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: {
        status: 'SUCCESS',
        message: 'Saved successfully',
        data: @customer,
        location: api_v1_customer_url(@customer)
      },
      include: [
        {operations: {except: [:created_at, :updated_at]}}
      ]
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer,
      include: [
        {operations: {except: [:created_at, :updated_at]}}
      ]
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer)
      .permit(
        :fantasyName,
        :customerName,
        :taxId,
        :status,
        :stateRegistration,
        :facility_id,
        :contact_id,
        operation_ids: []
      )
    end
end
