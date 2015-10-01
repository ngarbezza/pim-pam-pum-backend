require 'rails_helper'

RSpec.describe Api::EventosController, type: :controller do

  let(:user) { User.create(email: 'user@example.com', password: 'password') }

  before do
    authentication_token = AuthenticationToken.create(user_id: user.id, body: 'token', last_used_at: DateTime.current)
    request.env['HTTP_X_USER_EMAIL'] = user.email
    request.env['HTTP_X_AUTH_TOKEN'] = authentication_token.body
  end

  it_behaves_like 'api_controller'
  it_behaves_like 'authenticated_api_controller'

  let(:valid_attributes) { { nombre: 'Juntada', descripcion: 'Algo', fecha: DateTime.current, owner: user } }
  let(:invalid_attributes) { { nombre: nil, descripcion: 'john.doe@example.com', fecha: "123456789" } }
  let!(:evento) { Evento.create(valid_attributes) }

  describe 'GET #index' do
    it 'asigna todos los eventos' do
      get :index
      expect(assigns(:eventos)).to eq(evento)
    end
  end

  describe 'GET #show' do
    it 'asigna el evento pedido' do
      get :show, { id: evento.id }
      expect(assigns(:evento)).to eq(evento)
    end
  end

  describe 'POST #create' do
    context 'con parámetros válidos' do
      it 'creates a new evento' do
        expect {
          post :create, { evento: valid_attributes }
        }.to change(Evento, :count).by(1)
      end

      it 'persiste un nuevo evento' do
        post :create, { evento: valid_attributes }
        expect(assigns(:evento)).to be_a(Evento)
        expect(assigns(:evento)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'asigna un evento pero no lo persiste' do
        post :create, { evento: invalid_attributes }
        expect(assigns(:evento)).to be_a_new(Evento)
        expect(assigns(:evento)).not_to be_persisted
      end

      it 'retorna status unprocessable entity' do
        put :create, { evento: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PUT #update' do
    context 'con parámetros válidos' do
      let(:fecha) { Date.today }
      let(:new_attributes) { { nombre: 'Otra Juntada', fecha: fecha } }

      it 'actualiza el evento apropiado' do
        put :update, { id: evento.id, evento: new_attributes }
        evento.reload
        expect(evento.nombre).to eq('Otra Juntada')
        expect(evento.fecha).to eq(fecha)
      end

      it 'asigna el evento' do
        put :update, { id: evento.id, evento: valid_attributes }
        expect(assigns(:evento)).to eq(evento)
      end
    end

    context 'con parámetros no válidos' do
      it 'asigna el evento' do
        put :update, { id: evento.id, evento: invalid_attributes }
        expect(assigns(:evento)).to eq(evento)
      end

      it 'retorna status unprocessable entity' do
        put :update, { id: evento.id, evento: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'borra el evento pedido' do
      expect {
        delete :destroy, { id: evento.id }
      }.to change(Evento, :count).by(-1)
    end

    it 'redirecciona al index de eventos' do
      delete :destroy, { id: evento.id }
      expect(response.status).to eq(204)
    end
  end
end
