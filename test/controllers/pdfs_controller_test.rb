require 'test_helper'

class PdfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pdf = pdfs(:one)
  end

  test "should get index" do
    get pdfs_url, as: :json
    assert_response :success
  end

  test "should create pdf" do
    assert_difference('Pdf.count') do
      post pdfs_url, params: { pdf: { author: @pdf.author, synopsis: @pdf.synopsis, title: @pdf.title, year: @pdf.year } }, as: :json
    end

    assert_response 201
  end

  test "should show pdf" do
    get pdf_url(@pdf), as: :json
    assert_response :success
  end

  test "should update pdf" do
    patch pdf_url(@pdf), params: { pdf: { author: @pdf.author, synopsis: @pdf.synopsis, title: @pdf.title, year: @pdf.year } }, as: :json
    assert_response 200
  end

  test "should destroy pdf" do
    assert_difference('Pdf.count', -1) do
      delete pdf_url(@pdf), as: :json
    end

    assert_response 204
  end
end
