class OrdersController < ApplicationController
  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  def create
    trip = Trip.find(params[:trip_id])
    order = Order.create(trip_sku: trip.sku, amount: trip.price, state:'pending', user: current_user)
    redirect_to new_order_payment_path(order)
  end
end
