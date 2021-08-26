require 'rails_helper'

RSpec.describe "Cats", type: :request do

  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create name: 'Whiskers', age: 1, enjoys: 'playing with string'

      # make a request
      get '/cats'

      expect(response).to have_http_status(200)
      cat = JSON.parse(response.body)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Boo',
          age: '10',
          enjoys: 'the beach'
        }
      }
      
      # send the request to the server
      post '/cats', params: cat_params

      expect(response).to have_http_status(200)
      cat = Cat.first

      # assure that we have the correct attributes
      expect(cat.name).to eq 'Boo'
      expect(cat.age).to eq 10
      expect(cat.enjoys).to eq 'the beach'
    end
  end

  describe "PATCH /update" do
    it "updates a cat" do
      cat_params = {
        cat: {
          name: 'Boo',
          age: '10',
          enjoys: 'the beach'
        }
      }

      post '/cats', params: cat_params

      updated_cat_params = {
        cat: {
          name: 'Boo',
          age: '15',
          enjoys: 'tuna'
        }
      }

      cat = Cat.first
      patch "/cats/#{cat.id}", params: updated_cat_params

      expect(response).to have_http_status(200)
      updated_cat = Cat.find cat.id
      expect(updated_cat.name).to eq 'Boo'
      expect(updated_cat.age).to eq 15
      expect(updated_cat.enjoys).to eq 'tuna'
    end

    describe "DELETE /delete" do
      it "deletes a cat" do
        cat_params = {
          cat: {
            name: 'Boo',
            age: '10',
            enjoys: 'the beach'
          }
        }

        post '/cats', params: cat_params
        cat = Cat.first

        # delete the cat
        delete "/cats/#{cat.id}"
        
        expect(response).to have_http_status(200)
        expect(Cat.all.length).to eq 0
      end
    end
  end

end
