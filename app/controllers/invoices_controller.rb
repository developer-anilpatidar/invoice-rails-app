class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :update, :destroy]

  def index
    @invoices = Invoice.all
    
    if params[:dateFrom].present? && params[:dateTo].present?
      @invoices = @invoices.filter_with_date(params[:dateFrom], params[:dateTo])
    end
    render json: @invoices
  end

  def show
    render json: @invoice
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      render json: @invoice, status: :created, location: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  def update
    if @invoice.update(invoice_params)
      render json: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @invoice.destroy
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params[:invoice] = params[:data][:attributes]
      params.require(:invoice).permit(:amount, :date)
    end
end
