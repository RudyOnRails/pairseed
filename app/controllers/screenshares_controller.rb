class ScreensharesController < ApplicationController
  def create
    uri = URI.parse('http://api.screenleap.com/v1/screen-shares')

    req = Net::HTTP::Post.new(uri.path)

    req.add_field('accountid', ENV['WORKBLAST_SCREENLEAP_ACCOUNT_ID'])
    req.add_field('authtoken', ENV['WORKBLAST_SCREENLEAP_AUTH_TOKEN'])

    res = Net::HTTP.new(uri.host, uri.port).start do |http|
      http.request(req)
    end
    
    @screenleap_response = JSON.parse(res.body)

    @appointment = Appointment.find(params[:screenshare][:appointment_id])
    @screenshare = @appointment.build_screenshare(params[:screenshare])

    @screenshare["applet_html"] = @screenleap_response["appletHtml"]
    @screenshare["viewer_url"] = @screenleap_response["viewerUrl"]

    @screenshare.save
    @appointment.generate_screenshare
    redirect_to @appointment.topic


  end

  def show
    @appointment = Appointment.find(params[:appointment_id])
    @viewer_url = @appointment.screenshare.viewer_url
    render :layout => false
  end
end