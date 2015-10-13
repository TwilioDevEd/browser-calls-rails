require 'rails_helper'

describe CallController do
  describe '#connect' do
    context 'when phoneNumber is provided' do
      it 'dials to phone number' do
        post :connect, phoneNumber: 'phone-number'
        xml = load_xml(response.body)
        expect(xml.at_xpath('//Response//Dial//Number').content)
          .to eq('phone-number')
      end
    end

    context 'when phoneNumber is not provided' do
      it 'dials to support agent' do
        post :connect
        xml = load_xml(response.body)
        expect(xml.at_xpath('//Response//Dial//Client').content)
          .to eq('support_agent')
      end
    end

    private

    def load_xml(xml)
      Nokogiri::XML(xml)
    end
  end
end
