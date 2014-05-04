require 'spec_helper'
require_relative '../good_vids'
require 'sequel'

Capybara.app = GoodVids

DB = Sequel.connect('postgres://gschool_user:password@localhost/good_vids_test')

feature 'User can manage a list of videos' do

  before do
    DB[:good_vids].delete
  end

  scenario 'User is welcomed on homepage' do
    visit '/'
    welcome = 'Welcome to the amazing collection of Good Vids'
    expect(page).to have_content(welcome)
  end

  scenario 'User can add videos and see them listed on homepage' do
    visit '/'
    video_name = "Brian Williams Raps 'Rapper's Delight'"
    video_url = 'http://www.youtube.com/watch?v=-YCeIgt7hMs'
    fill_in 'Video Name', with: video_name
    fill_in 'Video URL', with: video_url
    click_on 'Add'
    expect(page).to have_content(video_name)
    expect(page).to have_content(video_url)
  end

  scenario 'User can update videos' do
    visit '/'
    old_video_name = 'Pass the beer'
    updated_video_name = 'Hey Pass Me A Beer II'
    video_url = 'http://www.youtube.com/watch?v=HVsU-vwUpdM'
    fill_in 'Video Name', with: old_video_name
    fill_in 'Video URL', with: video_url
    click_on 'Add'
    click_on 'Edit'
    fill_in 'Video Name', with: updated_video_name
    click_on 'Update'
    expect(page).to have_content(updated_video_name)
  end

  scenario 'User can delete videos' do
    visit '/'
    video_name = 'Baby Bunny - Parry Gripp'
    video_url = 'http://www.youtube.com/watch?v=aD9xQaDAuQw'
    fill_in 'Video Name', with: video_name
    fill_in 'Video URL', with: video_url
    click_on 'Add'
    click_on 'Delete'
    expect(page).to have_no_content(video_name)
  end

end
