require 'spec_helper'

describe Spree::Calculator::ESEDEX do
  it_behaves_like "correios calculator" do
    before do # eSedex calculator presumes a contract
      @calculator.preferred_token    = "faketoken"
      @calculator.preferred_password = "fakepass"
    end
  end

  it "should have a description" do
    Spree::Calculator::ESEDEX.description.should == "eSEDEX"
  end

  context "without a token and password" do
    before do
      @esedex = Spree::Calculator::ESEDEX.new
    end

    it "should have a shipping method of :e_sedex" do
      @esedex.shipping_method.should == :e_sedex
    end

    it "should have a shipping code of 81019" do
      @esedex.shipping_code.should == 81019
    end

    it "should raise error if there is no contracto on #compute" do
      product = double(:weight => 1, :depth => 20, :width => 15, :height => 5)
      items   = [double(:product => product)]
      order   = double("Order", :line_items => items,
                      :amount => BigDecimal("2000,00"),
                      :ship_address => stub(:zipcode => "72151613"))
      order.stub(:is_a?).with(Spree::Order).and_return(true)

      expect { @esedex.compute(order) }.to raise_error
    end
  end
end
