require 'rails_helper'

RSpec.describe 'Orders API' do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:orders) { create_list(:order, 20, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { orders.first.id }

  # Test suite for GET /users/:user_id/orders
  describe 'GET /users/:user_id/orders' do
    before { get "/users/#{user_id}/orders" }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user orders' do
        expect(json.size).to eq(20)
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  # Test suite for GET /users/:user_id/orders/:id
  describe 'GET /users/:user_id/orders/:id' do
    before { get "/users/#{user_id}/orders/#{id}" }

    context 'when user order exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when user order does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Order/)
      end
    end
  end

  # Test suite for PUT /users/:user_id/orders
  describe 'POST /users/:user_id/orders' do
    let(:valid_attributes) { { device_model: 'LG G6', imei: '123456789012345', annual_price: '250.40', installment_no: '12' } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/orders", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/orders", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Device model can't be blank, Imei can't be blank, Annual price can't be blank/) 
      end
    end
  end

  # Test suite for PUT /users/:user_id/orders/:id
  describe 'PUT /users/:user_id/orders/:id' do
    let(:valid_attributes) { { device_model: 'Iphone 8' } }

    before { put "/users/#{user_id}/orders/#{id}", params: valid_attributes }

    context 'when order exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the order' do
        updated_order = Order.find(id)
        expect(updated_order.device_model).to match(/Iphone 8/)
      end
    end

    context 'when the order does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Order/)
      end
    end
  end

  # Test suite for DELETE /orders/:id
  describe 'DELETE /orders/:id' do
    before { delete "/users/#{user_id}/orders/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end