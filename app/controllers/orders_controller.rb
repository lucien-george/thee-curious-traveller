class OrdersController < ApplicationController
  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
    authorize @order
  end

  def create
    trip = Trip.find(params[:trip_id])
    order = Order.new(trip_sku: trip.sku, amount: trip.price, state: 'pending', user: current_user)
    authorize order
    order.save
    redirect_to new_order_payment_path(order)
  end
end
