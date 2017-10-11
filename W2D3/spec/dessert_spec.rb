require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Garrett") }
  let(:dessert) { Dessert.new("Cake", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Cake")    
    end
    it "sets a quantity" do 
      expect(dessert.quantity).to eq(10)  
    end      
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])     
    end   
    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("no", "10", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("flour")
      expect(dessert.ingredients.length).to eq(1)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["flour", "icing", "cake mix", "sprinkles"]
      ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end

      expect(dessert.ingredients).to eq(ingredients)
      expect(dessert.mix!).not_to eq(ingredients)
      expect(dessert.ingredients.length).to eq(ingredients.length)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      current = dessert.quantity
      expect(dessert.eat(5)).to eq(current-5)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect{ dessert.eat(9000) }.to raise_error("not enough left!")
    end
  end
  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("GMoney")      
      expect(dessert.serve).to eq("GMoney has made 10 Cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
