require File.dirname(__FILE__) + '/test_helper'

class TermExtractionTest < Test::Unit::TestCase
  should 'return correct terms from Yahoo!' do
    yahoo = TermExtraction::Yahoo.new
    yahoo.stubs(:remote_xml).returns(read_xml_fixture('yahoo'))
    assert_equal yahoo.terms, correct_yahoo_terms
  end
  
  should 'return correct terms from Zemanta' do
    zemanta = TermExtraction::Zemanta.new
    zemanta.stubs(:remote_xml).returns(read_xml_fixture('zemanta'))
    assert_equal zemanta.terms, correct_zemanta_terms
  end

  should 'be able to set the context after initialization' do
    yahoo         = TermExtraction::Yahoo.new
    context       = 'foo'
    yahoo.context = context
    assert_equal yahoo.context, context
  end

  should 'be able to set the api key after initialization' do
    zemanta         = TermExtraction::Zemanta.new
    context         = 'bar'
    zemanta.context = context
    assert_equal zemanta.context, context
  end

  private
    def correct_yahoo_terms
      ['gears of war', 'gears']
    end

    def correct_zemanta_terms
      ['Apple', 'IMac', 'Rumor', 'Hardware', 'Nvidia', 'Macintosh', 'Desktops', 'AllInOne']
    end
end