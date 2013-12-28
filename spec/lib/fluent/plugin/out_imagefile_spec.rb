require 'spec_helper'

describe do
  let(:driver) {Fluent::Test::OutputTestDriver.new(Fluent::ImageFileOutput, 'test.metrics').configure(config)}
  let(:save_imagefiles_dir) {File.join(File.dirname(__FILE__), 'saveimages')}

  let(:instance) {driver.instance}
  let(:record) {{ 'filename_field' => save_filename, 'image_field' => image_file}}
  let(:time) {0}
  let(:emit) {
    d = driver
    d.emit(record, Time.at(time))
    d.run
  }

  before do
    FileUtils.rm_rf(save_imagefiles_dir)
    Dir.mkdir(save_imagefiles_dir)
  end

  after do
    FileUtils.rm_rf(save_imagefiles_dir)
  end

  describe 'emit' do
    context 'base64encoded_false' do
      let(:image_file) {File.open(File.join(File.dirname(__FILE__), 'imagefile.jpg'), 'rb').read}
      let(:save_filename) {'savefile1'}

      let(:config) {
        %[
    save_dir #{save_imagefiles_dir}
    filename_key filename_field
    extension jpg
    image_key image_field
    base64encoded false
        ]
      }

      it do
        emit
        File.exists?(File.join(save_imagefiles_dir, 'savefile1.jpg')).should be_true
      end
    end

    context 'base64encoded_true' do
      let(:image_file) {Base64.encode64(File.open(File.join(File.dirname(__FILE__), 'imagefile.jpg'), 'rb').read)}
      let(:save_filename) {'savefile2'}

      let(:config) {
        %[
    save_dir #{save_imagefiles_dir}
    filename_key filename_field
    extension jpg
    image_key image_field
    base64encoded true
        ]
      }

      it do
        emit
        File.exists?(File.join(save_imagefiles_dir, 'savefile2.jpg')).should be_true
      end
    end
    
  end

end