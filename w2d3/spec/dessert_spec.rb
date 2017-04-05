require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Baker", :titleize => "Baker") }
  let(:cookies) { Dessert.new('cookie', 25, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cookies.type).to eq('cookie')
    end

    it "sets a quantity" do
      expect(cookies.quantity).to eq(25)
    end

    it "starts ingredients as an empty array" do
      expect(cookies.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('cookie', 'twenty', chef) }.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookies.add_ingredient('flour')
      expect(cookies.ingredients).to eq(['flour'])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      random_ingredients = [1,2,3,4,5,6]
      random_ingredients.each do |ingredient|
        cookies.add_ingredient(ingredient)
      end
      shuffled = random_ingredients.shuffle

      expect(cookies.ingredients).to eq(random_ingredients)
      cookies.mix!
      expect(cookies.ingredients.sort).to eq(shuffled.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookies.eat(1)
      expect(cookies.quantity).to eq(24)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookies.eat(26) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(cookies.serve).to eq('Baker has made 25 cookies!')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookies)
      cookies.make_more
    end
  end
end
