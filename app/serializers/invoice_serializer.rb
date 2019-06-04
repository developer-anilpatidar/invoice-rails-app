class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :amount, :date
end
