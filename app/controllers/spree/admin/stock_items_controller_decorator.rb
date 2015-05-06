Spree::Admin::StockItemsController.class_eval do

  before_filter :add_supplier_to_variant, only: :create

  def add_supplier_to_variant
    variant = Spree::Variant.find(params[:variant_id])
    stock_location = Spree::StockLocation.find(params[:stock_location_id])
    supplier = stock_location.supplier

    # Add stock_location's supplier to variant
    unless variant.suppliers.pluck(:id).include?(supplier.id)
      variant.suppliers << supplier
      variant.save        
    end
  end

end
